#!/bin/sh
set -eu

REPO=$(cd "$(dirname "$0")/.." && pwd -P)
TMPROOT=$(mktemp -d "${TMPDIR:-/tmp}/ap-tool-tests.XXXXXX")
SOURCE=$TMPROOT/source
SOURCE_URL=file://$SOURCE
OUT=$TMPROOT/out
ERR=$TMPROOT/err

pass_count=0
fail_count=0

say() {
    printf '%s\n' "$*"
}

fail_test() {
    say "not ok - $1"
    fail_count=$((fail_count + 1))
}

pass_test() {
    say "ok - $1"
    pass_count=$((pass_count + 1))
}

run_test() {
    case_name=$1
    shift
    if "$@"; then
        pass_test "$case_name"
    else
        fail_test "$case_name"
    fi
}

cleanup() {
    case "$TMPROOT" in
        /tmp/*|/private/tmp/*|/var/folders/*|/private/var/folders/*)
            rm -rf "$TMPROOT"
            ;;
    esac
}

trap cleanup EXIT HUP INT TERM

run_ok() {
    : > "$OUT"
    : > "$ERR"
    "$@" >"$OUT" 2>"$ERR"
}

run_fail() {
    : > "$OUT"
    : > "$ERR"
    if "$@" >"$OUT" 2>"$ERR"; then
        return 1
    fi
    return 0
}

git_init() {
    dir=$1
    git -C "$dir" init -q -b main
    git -C "$dir" config user.email ap-tests@example.invalid
    git -C "$dir" config user.name "AP Tests"
}

copy_worktree_to_source() {
    mkdir -p "$SOURCE"
    (
        cd "$REPO"
        find . -path ./.git -prune -o -type f -print
    ) | while IFS= read -r path
    do
        mkdir -p "$SOURCE/$(dirname "$path")"
        cp "$REPO/$path" "$SOURCE/$path"
    done
    chmod +x "$SOURCE/ap" "$SOURCE/tests/ap_tool_tests.sh"
    git_init "$SOURCE"
    git -C "$SOURCE" add .
    git -C "$SOURCE" commit -q -m "test source"
}

configure_canonical_submodule() {
    super=$1
    git -C "$super" config -f .gitmodules submodule..ap.url https://github.com/cisarik/ap.git
    git -C "$super/.ap" remote set-url origin https://github.com/cisarik/ap.git
    git -C "$super/.ap" config user.email ap-tests@example.invalid
    git -C "$super/.ap" config user.name "AP Tests"
    git -C "$super/.ap" config protocol.file.allow always
    git -C "$super/.ap" config "url.$SOURCE_URL.insteadOf" https://github.com/cisarik/ap.git
}

new_super() {
    case_name=$1
    super=$TMPROOT/$case_name
    mkdir -p "$super"
    git_init "$super"
    printf '%s\n' "# Host Project" > "$super/README.md"
    git -C "$super" add README.md
    git -C "$super" commit -q -m "base"
    git -C "$super" -c protocol.file.allow=always submodule add "$SOURCE" .ap >/dev/null 2>&1
    configure_canonical_submodule "$super"
    printf '%s\n' "$super"
}

commit_integration() {
    super=$1
    git -C "$super" add .gitmodules .ap AGENTS.md
    git -C "$super" commit -q -m "adopt ap"
}

advance_source() {
    label=$1
    printf '%s\n' "$label" >> "$SOURCE/CHANGELOG.md"
    git -C "$SOURCE" add CHANGELOG.md
    git -C "$SOURCE" commit -q -m "$label"
    git -C "$SOURCE" rev-parse HEAD
}

assert_contains() {
    file=$1
    text=$2
    grep -F "$text" "$file" >/dev/null
}

assert_not_contains() {
    file=$1
    text=$2
    ! grep -F "$text" "$file" >/dev/null
}

hash_file() {
    cksum "$1"
}

refs_snapshot() {
    dir=$1
    git -C "$dir" for-each-ref --format='%(refname) %(objectname)' | sort
}

module_status() {
    dir=$1
    git -C "$dir" status --porcelain=v1 --untracked-files=all
}

assert_no_root_legacy_files() {
    super=$1
    for artifact in AP.md APv2.md APv3.md AP_ORCHESTRATOR.md AP_WORKER.md \
        PROMPT_CONTRACTS.md ARTIFACT_LIFECYCLE.md BOOT_ORCHESTRATOR.md \
        BOOT_WORKER.md NEXT_ORCHESTRATOR.md NEXT_WORKER.md WORKERS.md
    do
        [ ! -e "$super/$artifact" ] || return 1
    done
}

test_init_creates_agents() {
    super=$(new_super init_creates)
    head_before=$(git -C "$super" rev-parse HEAD)
    run_ok "$super/.ap/ap" init
    head_after=$(git -C "$super" rev-parse HEAD)
    [ "$head_before" = "$head_after" ] || return 1
    [ -f "$super/AGENTS.md" ] || return 1
    assert_contains "$super/AGENTS.md" ".ap/AP.md" || return 1
    assert_no_root_legacy_files "$super" || return 1
    [ -z "$(find "$super" -maxdepth 1 -type d -name '.ap-tool.*' -print)" ]
}

test_init_preserves_existing_content_mode_and_idempotent() {
    super=$(new_super init_idempotent)
    printf '%s\n' "# Host Rules" "" "Keep this project rule." > "$super/AGENTS.md"
    chmod 600 "$super/AGENTS.md"
    mode_before=$(stat -f %Lp "$super/AGENTS.md" 2>/dev/null || stat -c %a "$super/AGENTS.md")
    run_ok "$super/.ap/ap" init
    assert_contains "$super/AGENTS.md" "Keep this project rule." || return 1
    mode_after=$(stat -f %Lp "$super/AGENTS.md" 2>/dev/null || stat -c %a "$super/AGENTS.md")
    [ "$mode_before" = "$mode_after" ] || return 1
    before=$(hash_file "$super/AGENTS.md")
    run_ok "$super/.ap/ap" init
    after=$(hash_file "$super/AGENTS.md")
    [ "$before" = "$after" ]
}

test_init_replaces_stale_block_and_preserves_outside() {
    super=$(new_super init_replace)
    cat > "$super/AGENTS.md" <<'EOF'
# Host Rules

before
<!-- BEGIN MANAGED AP INTEGRATION -->
old block
<!-- END MANAGED AP INTEGRATION -->
after
EOF
    run_ok "$super/.ap/ap" init
    assert_contains "$super/AGENTS.md" "before" || return 1
    assert_contains "$super/AGENTS.md" "after" || return 1
    assert_not_contains "$super/AGENTS.md" "old block" || return 1
    run_ok "$super/.ap/ap" doctor
}

test_init_rejects_malformed_markers() {
    super=$(new_super init_malformed)
    printf '%s\n' "<!-- BEGIN MANAGED AP INTEGRATION -->" "missing end" > "$super/AGENTS.md"
    run_fail "$super/.ap/ap" init
}

test_init_rejects_duplicate_markers() {
    super=$(new_super init_duplicate)
    cat > "$super/AGENTS.md" <<'EOF'
<!-- BEGIN MANAGED AP INTEGRATION -->
one
<!-- END MANAGED AP INTEGRATION -->
<!-- BEGIN MANAGED AP INTEGRATION -->
two
<!-- END MANAGED AP INTEGRATION -->
EOF
    run_fail "$super/.ap/ap" init
}

test_init_rejects_wrong_path_remote_and_dirty() {
    super=$TMPROOT/wrong_path
    mkdir -p "$super"
    git_init "$super"
    printf '%s\n' "# Host" > "$super/README.md"
    git -C "$super" add README.md
    git -C "$super" commit -q -m "base"
    mkdir -p "$super/vendor"
    git -C "$super" -c protocol.file.allow=always submodule add "$SOURCE" vendor/ap >/dev/null 2>&1
    git -C "$super/vendor/ap" remote set-url origin https://github.com/cisarik/ap.git
    run_fail "$super/vendor/ap/ap" init || return 1

    super2=$(new_super wrong_remote)
    git -C "$super2/.ap" remote set-url origin https://github.com/example/not-ap.git
    run_fail "$super2/.ap/ap" init || return 1

    super3=$(new_super init_dirty)
    printf '%s\n' dirty > "$super3/.ap/dirty.txt"
    run_fail "$super3/.ap/ap" init
}

test_init_accepts_cosmetic_url() {
    super=$(new_super cosmetic_url)
    git -C "$super" config -f .gitmodules submodule..ap.url https://github.com/cisarik/ap
    git -C "$super/.ap" remote set-url origin https://github.com/cisarik/ap
    run_ok "$super/.ap/ap" init
}

test_init_publication_failure_leaves_original() {
    super=$(new_super init_publication_failure)
    printf '%s\n' "# Original" "preserve me" > "$super/AGENTS.md"
    before=$(hash_file "$super/AGENTS.md")
    AP_TEST_FAIL_BEFORE_AGENTS_MV=1 run_fail "$super/.ap/ap" init || return 1
    after=$(hash_file "$super/AGENTS.md")
    [ "$before" = "$after" ] || return 1
    [ -z "$(find "$super" -maxdepth 1 -type d -name '.ap-tool.*' -print)" ]
}

test_doctor_healthy_exact_block_and_read_only() {
    super=$(new_super doctor_healthy)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    status_before=$(module_status "$super")
    refs_before=$(refs_snapshot "$super")
    ap_status_before=$(module_status "$super/.ap")
    ap_refs_before=$(refs_snapshot "$super/.ap")
    modules_before=$(hash_file "$super/.gitmodules")
    origin_before=$(git -C "$super/.ap" config --get remote.origin.url)
    run_ok "$super/.ap/ap" doctor
    [ "$status_before" = "$(module_status "$super")" ] || return 1
    [ "$refs_before" = "$(refs_snapshot "$super")" ] || return 1
    [ "$ap_status_before" = "$(module_status "$super/.ap")" ] || return 1
    [ "$ap_refs_before" = "$(refs_snapshot "$super/.ap")" ] || return 1
    [ "$modules_before" = "$(hash_file "$super/.gitmodules")" ] || return 1
    [ "$origin_before" = "$(git -C "$super/.ap" config --get remote.origin.url)" ]
}

test_doctor_managed_block_defects() {
    super=$(new_super doctor_block_defects)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"

    cp "$super/AGENTS.md" "$TMPROOT/good-agents"

    sed '/\.ap\/AP.md/d' "$TMPROOT/good-agents" > "$super/AGENTS.md"
    printf '%s\n' "outside phrase .ap/AP.md" >> "$super/AGENTS.md"
    run_fail "$super/.ap/ap" doctor || return 1

    cp "$TMPROOT/good-agents" "$super/AGENTS.md"
    awk '{ print; if ($0 ~ /Prompt structures/) print "injected instruction" }' "$TMPROOT/good-agents" > "$super/AGENTS.md"
    run_fail "$super/.ap/ap" doctor || return 1

    cp "$TMPROOT/good-agents" "$super/AGENTS.md"
    sed 's/All participants read/Participants all read/' "$TMPROOT/good-agents" > "$super/AGENTS.md"
    run_fail "$super/.ap/ap" doctor || return 1

    run_ok "$super/.ap/ap" init
    cmp -s "$TMPROOT/good-agents" "$super/AGENTS.md"
}

test_doctor_missing_dirty_wrong_remote_mismatch() {
    run_fail "$SOURCE/ap" doctor || return 1

    super=$(new_super doctor_uninitialized)
    rm -rf "$super/.ap/.git"
    run_fail "$super/.ap/ap" doctor || return 1

    super2=$(new_super doctor_dirty)
    run_ok "$super2/.ap/ap" init
    commit_integration "$super2"
    printf '%s\n' dirty > "$super2/.ap/dirty.txt"
    run_fail "$super2/.ap/ap" doctor || return 1

    super3=$(new_super doctor_wrong_remote)
    run_ok "$super3/.ap/ap" init
    commit_integration "$super3"
    git -C "$super3/.ap" remote set-url origin https://github.com/example/not-ap.git
    run_fail "$super3/.ap/ap" doctor || return 1

    super4=$(new_super doctor_mismatch)
    run_ok "$super4/.ap/ap" init
    commit_integration "$super4"
    advance_source "advance source for mismatch" >/dev/null
    git -C "$super4/.ap" fetch origin refs/heads/main >/dev/null 2>&1
    git -C "$super4/.ap" checkout --detach --quiet FETCH_HEAD
    run_fail "$super4/.ap/ap" doctor
}

test_legacy_detection_classifies_without_deleting() {
    super=$(new_super doctor_legacy_confirmed)
    run_ok "$super/.ap/ap" init
    printf '%s\n' "# Analytic Programming Protocol" "" "copied content" > "$super/AP.md"
    git -C "$super" add .gitmodules .ap AGENTS.md AP.md
    git -C "$super" commit -q -m "legacy"
    run_fail "$super/.ap/ap" doctor || return 1
    grep -F "confirmed copied AP artifacts present" "$ERR" >/dev/null || return 1
    [ -f "$super/AP.md" ] || return 1

    super2=$(new_super doctor_legacy_ambiguous)
    run_ok "$super2/.ap/ap" init
    printf '%s\n' "# AP.md" "Project-owned unrelated API planning document." > "$super2/AP.md"
    git -C "$super2" add .gitmodules .ap AGENTS.md AP.md
    git -C "$super2" commit -q -m "ambiguous"
    run_ok "$super2/.ap/ap" doctor || return 1
    grep -F "ambiguous-name" "$ERR" >/dev/null || return 1
    [ -f "$super2/AP.md" ] || return 1

    super3=$(new_super doctor_legacy_handoff)
    run_ok "$super3/.ap/ap" init
    printf '%s\n' "# Next Worker Handoff" "Analytic Programming state that requires review." > "$super3/NEXT_WORKER.md"
    git -C "$super3" add .gitmodules .ap AGENTS.md NEXT_WORKER.md
    git -C "$super3" commit -q -m "handoff"
    run_ok "$super3/.ap/ap" doctor || return 1
    grep -F "session-state" "$ERR" >/dev/null || return 1
    [ -f "$super3/NEXT_WORKER.md" ]
}

test_update_no_update_and_check_read_only() {
    super=$(new_super update_none)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    status_before=$(module_status "$super")
    refs_before=$(refs_snapshot "$super")
    ap_status_before=$(module_status "$super/.ap")
    ap_refs_before=$(refs_snapshot "$super/.ap")
    modules_before=$(hash_file "$super/.gitmodules")
    origin_before=$(git -C "$super/.ap" config --get remote.origin.url)
    run_ok "$super/.ap/ap" update --check
    grep -F "update available: no" "$OUT" >/dev/null || return 1
    [ "$status_before" = "$(module_status "$super")" ] || return 1
    [ "$refs_before" = "$(refs_snapshot "$super")" ] || return 1
    [ "$ap_status_before" = "$(module_status "$super/.ap")" ] || return 1
    [ "$ap_refs_before" = "$(refs_snapshot "$super/.ap")" ] || return 1
    [ "$modules_before" = "$(hash_file "$super/.gitmodules")" ] || return 1
    [ "$origin_before" = "$(git -C "$super/.ap" config --get remote.origin.url)" ]
}

test_update_forward_apply_candidate_stage_commit() {
    super=$(new_super update_apply)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    super_head_before=$(git -C "$super" rev-parse HEAD)
    old=$(git -C "$super/.ap" rev-parse HEAD)
    modules_before=$(hash_file "$super/.gitmodules")
    origin_before=$(git -C "$super/.ap" config --get remote.origin.url)
    refs_before=$(refs_snapshot "$super")
    new=$(advance_source "advance for forward update")

    run_ok "$super/.ap/ap" update --check
    grep -F "update available: yes" "$OUT" >/dev/null || return 1
    run_ok "$super/.ap/ap" update --apply
    grep -F "doctor --candidate" "$OUT" >/dev/null || return 1
    [ "$(git -C "$super/.ap" rev-parse HEAD)" = "$new" ] || return 1
    [ "$old" != "$new" ] || return 1
    [ "$(hash_file "$super/.gitmodules")" = "$modules_before" ] || return 1
    [ "$(git -C "$super/.ap" config --get remote.origin.url)" = "$origin_before" ] || return 1
    [ "$(git -C "$super" rev-parse HEAD)" = "$super_head_before" ] || return 1
    [ "$(refs_snapshot "$super")" = "$refs_before" ] || return 1
    [ "$(git -C "$super" diff --name-only)" = ".ap" ] || return 1
    [ -z "$(git -C "$super" diff --cached --name-only)" ] || return 1
    run_fail "$super/.ap/ap" doctor || return 1
    run_ok "$super/.ap/ap" doctor --candidate || return 1
    git -C "$super" add .ap
    run_ok "$super/.ap/ap" doctor || return 1
    git -C "$super" commit -q -m "update ap"
    run_ok "$super/.ap/ap" doctor
}

test_update_rollback_candidate() {
    super=$(new_super rollback_candidate)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    old=$(git -C "$super/.ap" rev-parse HEAD)
    advance_source "advance before rollback" >/dev/null
    run_ok "$super/.ap/ap" update --apply
    git -C "$super" add .ap
    git -C "$super" commit -q -m "update ap"
    run_ok "$super/.ap/ap" doctor
    git -C "$super/.ap" checkout --detach --quiet "$old"
    run_fail "$super/.ap/ap" doctor || return 1
    run_ok "$super/.ap/ap" doctor --candidate || return 1
    git -C "$super" add .ap
    run_ok "$super/.ap/ap" doctor || return 1
    git -C "$super" commit -q -m "roll back ap"
    run_ok "$super/.ap/ap" doctor
}

test_update_rejects_behind_divergent_missing_and_dirty() {
    super=$(new_super update_behind)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    printf '%s\n' local >> "$super/.ap/CHANGELOG.md"
    git -C "$super/.ap" add CHANGELOG.md
    git -C "$super/.ap" commit -q -m "local descendant"
    git -C "$super" add .ap
    git -C "$super" commit -q -m "pin local descendant"
    run_fail "$super/.ap/ap" update --check || return 1
    grep -F "behind the current AP commit" "$ERR" >/dev/null || return 1

    super2=$(new_super update_divergent)
    run_ok "$super2/.ap/ap" init
    commit_integration "$super2"
    advance_source "canonical divergent advance" >/dev/null
    printf '%s\n' local >> "$super2/.ap/CHANGELOG.md"
    git -C "$super2/.ap" add CHANGELOG.md
    git -C "$super2/.ap" commit -q -m "local divergent"
    git -C "$super2" add .ap
    git -C "$super2" commit -q -m "pin local divergent"
    run_fail "$super2/.ap/ap" update --check || return 1
    grep -F "diverges" "$ERR" >/dev/null || return 1

    super3=$(new_super update_unavailable)
    run_ok "$super3/.ap/ap" init
    commit_integration "$super3"
    git -C "$super3/.ap" config --remove-section "url.$SOURCE_URL" >/dev/null 2>&1 || true
    git -C "$super3/.ap" config url.file:///definitely-missing-ap-test.insteadOf https://github.com/cisarik/ap.git
    run_fail "$super3/.ap/ap" update --check || return 1

    super4=$(new_super update_dirty)
    run_ok "$super4/.ap/ap" init
    commit_integration "$super4"
    printf '%s\n' dirty > "$super4/.ap/dirty.txt"
    run_fail "$super4/.ap/ap" update --apply || return 1

    super5=$(new_super update_dirty_super)
    run_ok "$super5/.ap/ap" init
    commit_integration "$super5"
    printf '%s\n' local > "$super5/local.txt"
    run_fail "$super5/.ap/ap" update --apply
}

test_update_rejects_target_without_executable_tool() {
    super=$(new_super update_missing_tool)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    old=$(git -C "$super/.ap" rev-parse HEAD)
    git -C "$SOURCE" rm -q ap
    git -C "$SOURCE" commit -q -m "remove ap tool"
    run_fail "$super/.ap/ap" update --apply || return 1
    grep -F "executable ap tool" "$ERR" >/dev/null || return 1
    [ "$(git -C "$super/.ap" rev-parse HEAD)" = "$old" ]
}

anchor_for_heading() {
    printf '%s\n' "$1" \
        | tr '[:upper:]' '[:lower:]' \
        | sed 's/[^a-z0-9 -]//g; s/ /-/g; s/--*/-/g; s/^-//; s/-$//'
}

file_has_anchor() {
    file=$1
    anchor=$2
    awk '/^#/ { sub(/^#+[ ]*/, ""); print }' "$file" | while IFS= read -r heading
    do
        anchor_for_heading "$heading"
    done | grep -Fx "$anchor" >/dev/null
}

extract_links() {
    file=$1
    awk '
        {
            line = $0
            while (match(line, /\[[^]]*\]\([^)]+\)/)) {
                link = substr(line, RSTART, RLENGTH)
                sub(/^.*\]\(/, "", link)
                sub(/\)$/, "", link)
                print link
                line = substr(line, RSTART + RLENGTH)
            }
        }
    ' "$file"
}

test_markdown_links_and_anchors() {
    files=$TMPROOT/markdown-files
    links=$TMPROOT/markdown-links
    find "$REPO" -name '*.md' -not -path '*/.git/*' -print > "$files"
    while IFS= read -r file
    do
        dir=$(dirname "$file")
        extract_links "$file" > "$links"
        while IFS= read -r link
        do
            case "$link" in
                http://*|https://*|mailto:*) continue ;;
            esac
            target=${link%%#*}
            anchor=
            case "$link" in
                *#*) anchor=${link#*#} ;;
            esac
            [ -n "$target" ] || target=$(basename "$file")
            path=$dir/$target
            [ -e "$path" ] || {
                printf 'missing link target in %s: %s\n' "$file" "$link" >&2
                return 1
            }
            if [ -n "$anchor" ]; then
                file_has_anchor "$path" "$anchor" || {
                    printf 'missing anchor in %s: %s\n' "$file" "$link" >&2
                    return 1
                }
            fi
        done < "$links"
    done < "$files"
}

test_repository_structure_and_scans() {
    [ -f "$REPO/AP.md" ] || return 1
    [ ! -e "$REPO/APv2.md" ] || return 1
    [ ! -e "$REPO/APv3.md" ] || return 1
    [ ! -e "$REPO/NEXT_ORCHESTRATOR.md" ] || return 1
    [ ! -e "$REPO/NEXT_WORKER.md" ] || return 1
    [ ! -e "$REPO/BOOT_ORCHESTRATOR.md" ] || return 1
    [ ! -e "$REPO/BOOT_WORKER.md" ] || return 1
    [ ! -e "$REPO/WORKERS.md" ] || return 1
    [ ! -e "$REPO/AGENTS.md" ] || return 1
    [ ! -d "$REPO/templates/project" ] || [ -z "$(find "$REPO/templates/project" -type f -print 2>/dev/null)" ] || return 1
    ! rg -n "copy .*APv3|APv3.md.*to.*AP.md|rename .*APv|choose AP v[0-9]|manual.*handout|initialize .*Worker_1|permanent NEXT" "$REPO" --glob '!/.git/**' --glob '!tests/**' || return 1
    ! rg -n "FrameNest|/Users/agile|Michal|Toto pošli|Worker_1|AP version 3|active generation" \
        "$REPO/AP.md" "$REPO/AP_ORCHESTRATOR.md" "$REPO/AP_WORKER.md" \
        "$REPO/PROMPT_CONTRACTS.md" "$REPO/ARTIFACT_LIFECYCLE.md" || return 1
    for file in AP.md AP_ORCHESTRATOR.md AP_WORKER.md PROMPT_CONTRACTS.md \
        ARTIFACT_LIFECYCLE.md FAQ.md GLOSSARY.md INTEGRATION.md UPDATING.md \
        CHANGELOG.md
    do
        grep -F "$file" "$REPO/README.md" >/dev/null || return 1
    done
}

test_tool_help_and_docs_agree() {
    "$REPO/ap" help > "$OUT"
    grep -F "ap init" "$OUT" >/dev/null || return 1
    grep -F "ap doctor [--candidate]" "$OUT" >/dev/null || return 1
    grep -F "ap update --check" "$OUT" >/dev/null || return 1
    grep -F "ap update --apply" "$OUT" >/dev/null || return 1
    grep -F "doctor --candidate" "$REPO/UPDATING.md" >/dev/null || return 1
    grep -F "./.ap/ap doctor" "$REPO/INTEGRATION.md" >/dev/null
}

test_no_external_test_artifacts() {
    [ -f "$OUT" ] || return 1
    [ -f "$ERR" ] || return 1
    [ -z "$(find "${TMPDIR:-/tmp}" -maxdepth 1 \( -name 'ap-test-out-*' -o -name 'ap-test-err-*' \) -print 2>/dev/null)" ]
}

copy_worktree_to_source

run_test "init creates missing AGENTS.md without commit" test_init_creates_agents
run_test "init preserves existing AGENTS.md content, mode, and idempotence" test_init_preserves_existing_content_mode_and_idempotent
run_test "init repairs stale block and preserves outside content" test_init_replaces_stale_block_and_preserves_outside
run_test "init rejects malformed markers" test_init_rejects_malformed_markers
run_test "init rejects duplicate markers" test_init_rejects_duplicate_markers
run_test "init rejects wrong path, wrong remote, and dirty submodule" test_init_rejects_wrong_path_remote_and_dirty
run_test "init accepts cosmetic missing .git suffix" test_init_accepts_cosmetic_url
run_test "init publication failure leaves original file intact" test_init_publication_failure_leaves_original
run_test "doctor accepts exact healthy block and is project-read-only" test_doctor_healthy_exact_block_and_read_only
run_test "doctor rejects managed block defects inside the block" test_doctor_managed_block_defects
run_test "doctor rejects missing, dirty, wrong remote, and mismatched states" test_doctor_missing_dirty_wrong_remote_mismatch
run_test "legacy detection classifies without deletion or false confirmation" test_legacy_detection_classifies_without_deleting
run_test "update check reports no update and preserves project state" test_update_no_update_and_check_read_only
run_test "forward update apply supports candidate, staging, and final strict validation" test_update_forward_apply_candidate_stage_commit
run_test "rollback uses candidate validation before staged strict validation" test_update_rollback_candidate
run_test "update rejects behind, divergent, unavailable, and dirty states" test_update_rejects_behind_divergent_missing_and_dirty
run_test "update refuses target commit without executable ap tool" test_update_rejects_target_without_executable_tool
run_test "Markdown local links and anchors are valid" test_markdown_links_and_anchors
run_test "repository structure and stale-content scans pass" test_repository_structure_and_scans
run_test "tool help and documentation agree" test_tool_help_and_docs_agree
run_test "test stdout and stderr artifacts stay inside owned temp root" test_no_external_test_artifacts

say "passed: $pass_count"
say "failed: $fail_count"

[ "$fail_count" -eq 0 ]
