#!/bin/sh
set -eu

REPO=$(cd "$(dirname "$0")/.." && pwd -P)
TMPROOT=${TMPDIR:-/tmp}/ap-tool-tests-$$
SOURCE=$TMPROOT/source
SOURCE_URL=file://$SOURCE

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
    rm -rf "$TMPROOT"
}

trap cleanup EXIT HUP INT TERM

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
    git -C "$super/.ap" config protocol.file.allow always
    git -C "$super/.ap" config "url.$SOURCE_URL.insteadOf" https://github.com/cisarik/ap.git
}

new_super() {
    name=$1
    super=$TMPROOT/$name
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

run_ok() {
    "$@" >/tmp/ap-test-out-$$ 2>/tmp/ap-test-err-$$
}

run_fail() {
    if "$@" >/tmp/ap-test-out-$$ 2>/tmp/ap-test-err-$$; then
        return 1
    fi
    return 0
}

assert_file_contains() {
    file=$1
    text=$2
    grep -F "$text" "$file" >/dev/null
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
    assert_file_contains "$super/AGENTS.md" ".ap/AP.md" || return 1
    assert_no_root_legacy_files "$super"
}

test_init_preserves_and_idempotent() {
    super=$(new_super init_idempotent)
    printf '%s\n' "# Host Rules" "" "Keep this byte-oriented project rule." > "$super/AGENTS.md"
    run_ok "$super/.ap/ap" init
    assert_file_contains "$super/AGENTS.md" "Keep this byte-oriented project rule." || return 1
    before=$(cksum "$super/AGENTS.md")
    run_ok "$super/.ap/ap" init
    after=$(cksum "$super/AGENTS.md")
    [ "$before" = "$after" ]
}

test_init_replaces_managed_block() {
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
    assert_file_contains "$super/AGENTS.md" "before" || return 1
    assert_file_contains "$super/AGENTS.md" "after" || return 1
    ! grep -F "old block" "$super/AGENTS.md" >/dev/null
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

test_init_rejects_wrong_path() {
    super=$TMPROOT/wrong_path
    mkdir -p "$super"
    git_init "$super"
    printf '%s\n' "# Host" > "$super/README.md"
    git -C "$super" add README.md
    git -C "$super" commit -q -m "base"
    mkdir -p "$super/vendor"
    git -C "$super" -c protocol.file.allow=always submodule add "$SOURCE" vendor/ap >/dev/null 2>&1
    git -C "$super/vendor/ap" remote set-url origin https://github.com/cisarik/ap.git
    run_fail "$super/vendor/ap/ap" init
}

test_init_rejects_wrong_remote() {
    super=$(new_super wrong_remote)
    git -C "$super/.ap" remote set-url origin https://github.com/example/not-ap.git
    run_fail "$super/.ap/ap" init
}

test_init_accepts_cosmetic_url() {
    super=$(new_super cosmetic_url)
    git -C "$super" config -f .gitmodules submodule..ap.url https://github.com/cisarik/ap
    git -C "$super/.ap" remote set-url origin https://github.com/cisarik/ap
    run_ok "$super/.ap/ap" init
}

test_init_rejects_dirty_submodule() {
    super=$(new_super init_dirty)
    printf '%s\n' dirty > "$super/.ap/dirty.txt"
    run_fail "$super/.ap/ap" init
}

test_doctor_healthy_and_read_only() {
    super=$(new_super doctor_healthy)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    status_before=$(git -C "$super" status --porcelain=v1 --untracked-files=all)
    origin_before=$(git -C "$super/.ap" remote get-url origin)
    run_ok "$super/.ap/ap" doctor
    status_after=$(git -C "$super" status --porcelain=v1 --untracked-files=all)
    origin_after=$(git -C "$super/.ap" remote get-url origin)
    [ "$status_before" = "$status_after" ] || return 1
    [ "$origin_before" = "$origin_after" ] || return 1
}

test_doctor_missing_or_uninitialized_submodule() {
    super=$TMPROOT/doctor_missing
    mkdir -p "$super"
    git_init "$super"
    printf '%s\n' "# Host" > "$super/README.md"
    git -C "$super" add README.md
    git -C "$super" commit -q -m "base"
    run_fail "$SOURCE/ap" doctor || return 1

    mkdir -p "$super/.ap"
    cp "$SOURCE/ap" "$super/.ap/ap"
    chmod +x "$super/.ap/ap"
    run_fail "$super/.ap/ap" doctor
}

test_doctor_dirty_submodule() {
    super=$(new_super doctor_dirty)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    printf '%s\n' dirty > "$super/.ap/dirty.txt"
    run_fail "$super/.ap/ap" doctor
}

test_doctor_wrong_remote() {
    super=$(new_super doctor_wrong_remote)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    git -C "$super/.ap" remote set-url origin https://github.com/example/not-ap.git
    run_fail "$super/.ap/ap" doctor
}

test_doctor_mismatched_gitlink() {
    super=$(new_super doctor_mismatch)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    printf '%s\n' "# local source change" >> "$SOURCE/CHANGELOG.md"
    git -C "$SOURCE" add CHANGELOG.md
    git -C "$SOURCE" commit -q -m "advance source"
    git -C "$super/.ap" fetch origin refs/heads/main >/dev/null 2>&1
    git -C "$super/.ap" checkout --detach --quiet FETCH_HEAD
    run_fail "$super/.ap/ap" doctor
}

test_doctor_bad_agents_block() {
    super=$(new_super doctor_bad_agents)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    printf '%s\n' "# Bad" > "$super/AGENTS.md"
    run_fail "$super/.ap/ap" doctor
}

test_doctor_reports_legacy_artifacts() {
    super=$(new_super doctor_legacy)
    run_ok "$super/.ap/ap" init
    printf '%s\n' "# copied old AP" > "$super/AP.md"
    git -C "$super" add .gitmodules .ap AGENTS.md AP.md
    git -C "$super" commit -q -m "legacy"
    run_fail "$super/.ap/ap" doctor
    grep -F "legacy copied AP artifacts" /tmp/ap-test-err-$$ >/dev/null
}

test_update_no_update() {
    super=$(new_super update_none)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    run_ok "$super/.ap/ap" update --check
    grep -F "update available: no" /tmp/ap-test-out-$$ >/dev/null
}

test_update_available_and_apply() {
    super=$(new_super update_apply)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    old=$(git -C "$super/.ap" rev-parse HEAD)
    modules_before=$(cksum "$super/.gitmodules")
    origin_before=$(git -C "$super/.ap" remote get-url origin)

    printf '%s\n' "update test" >> "$SOURCE/CHANGELOG.md"
    git -C "$SOURCE" add CHANGELOG.md
    git -C "$SOURCE" commit -q -m "advance for update"
    new=$(git -C "$SOURCE" rev-parse HEAD)

    run_ok "$super/.ap/ap" update --check
    grep -F "update available: yes" /tmp/ap-test-out-$$ >/dev/null || return 1
    run_ok "$super/.ap/ap" update --apply
    [ "$(git -C "$super/.ap" rev-parse HEAD)" = "$new" ] || return 1
    [ "$old" != "$new" ] || return 1
    [ "$(cksum "$super/.gitmodules")" = "$modules_before" ] || return 1
    [ "$(git -C "$super/.ap" remote get-url origin)" = "$origin_before" ] || return 1
    changed=$(git -C "$super" diff --name-only)
    [ "$changed" = ".ap" ] || return 1
    [ "$(git -C "$super" rev-parse HEAD)" = "$(git -C "$super" rev-parse HEAD)" ]
}

test_update_refuses_dirty_submodule() {
    super=$(new_super update_dirty)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    printf '%s\n' dirty > "$super/.ap/dirty.txt"
    run_fail "$super/.ap/ap" update --apply
}

test_update_refuses_dirty_superproject() {
    super=$(new_super update_dirty_super)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    printf '%s\n' local > "$super/local.txt"
    run_fail "$super/.ap/ap" update --apply
}

test_update_unavailable_remote() {
    super=$(new_super update_unavailable)
    run_ok "$super/.ap/ap" init
    commit_integration "$super"
    git -C "$super/.ap" config --remove-section "url.$SOURCE_URL" >/dev/null 2>&1 || true
    git -C "$super/.ap" config url.file:///definitely-missing-ap-test.insteadOf https://github.com/cisarik/ap.git
    run_fail "$super/.ap/ap" update --check
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
                exit 1
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

test_repository_structure() {
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
}

test_no_stale_instructions() {
    ! rg -n "copy .*APv3|APv3.md.*to.*AP.md|rename .*APv|choose AP v[0-9]|manual.*handout|initialize .*Worker_1|permanent NEXT" "$REPO" --glob '!/.git/**' --glob '!tests/**'
}

test_no_project_specific_facts_in_universal_files() {
    ! rg -n "FrameNest|/Users/agile|Michal|Toto pošli|Worker_1|AP version 3|active generation" \
        "$REPO/AP.md" "$REPO/AP_ORCHESTRATOR.md" "$REPO/AP_WORKER.md" \
        "$REPO/PROMPT_CONTRACTS.md" "$REPO/ARTIFACT_LIFECYCLE.md"
}

test_docs_discoverable_from_readme() {
    for file in AP.md AP_ORCHESTRATOR.md AP_WORKER.md PROMPT_CONTRACTS.md \
        ARTIFACT_LIFECYCLE.md FAQ.md GLOSSARY.md INTEGRATION.md UPDATING.md \
        CHANGELOG.md
    do
        grep -F "$file" "$REPO/README.md" >/dev/null || return 1
    done
}

test_tool_help_mentions_documented_commands() {
    "$REPO/ap" help >/tmp/ap-test-out-$$
    grep -F "ap init" /tmp/ap-test-out-$$ >/dev/null || return 1
    grep -F "ap doctor" /tmp/ap-test-out-$$ >/dev/null || return 1
    grep -F "ap update --check" /tmp/ap-test-out-$$ >/dev/null || return 1
    grep -F "ap update --apply" /tmp/ap-test-out-$$ >/dev/null || return 1
    grep -F "ap update --check" "$REPO/UPDATING.md" >/dev/null || return 1
    grep -F "./.ap/ap doctor" "$REPO/INTEGRATION.md" >/dev/null
}

mkdir -p "$TMPROOT"
copy_worktree_to_source

run_test "init creates missing AGENTS.md without commit" test_init_creates_agents
run_test "init preserves existing AGENTS.md and is idempotent" test_init_preserves_and_idempotent
run_test "init replaces exact managed block" test_init_replaces_managed_block
run_test "init rejects malformed markers" test_init_rejects_malformed_markers
run_test "init rejects duplicate markers" test_init_rejects_duplicate_markers
run_test "init rejects wrong submodule path" test_init_rejects_wrong_path
run_test "init rejects wrong remote identity" test_init_rejects_wrong_remote
run_test "init accepts cosmetic missing .git suffix" test_init_accepts_cosmetic_url
run_test "init rejects dirty submodule" test_init_rejects_dirty_submodule
run_test "doctor accepts healthy integration and is read-only" test_doctor_healthy_and_read_only
run_test "doctor rejects missing or uninitialized submodule" test_doctor_missing_or_uninitialized_submodule
run_test "doctor diagnoses dirty submodule" test_doctor_dirty_submodule
run_test "doctor diagnoses wrong remote" test_doctor_wrong_remote
run_test "doctor diagnoses mismatched gitlink" test_doctor_mismatched_gitlink
run_test "doctor diagnoses malformed managed block" test_doctor_bad_agents_block
run_test "doctor reports legacy copied artifacts without deleting them" test_doctor_reports_legacy_artifacts
run_test "update check reports no-update state" test_update_no_update
run_test "update check and apply move only gitlink state" test_update_available_and_apply
run_test "update apply refuses dirty submodule" test_update_refuses_dirty_submodule
run_test "update apply refuses dirty superproject" test_update_refuses_dirty_superproject
run_test "update check fails deterministically on unavailable remote" test_update_unavailable_remote
run_test "Markdown local links and anchors are valid" test_markdown_links_and_anchors
run_test "repository structure has one live protocol and no session templates" test_repository_structure
run_test "repository has no stale copy-generation instructions" test_no_stale_instructions
run_test "universal files have no project-specific facts" test_no_project_specific_facts_in_universal_files
run_test "retained top-level docs are discoverable from README" test_docs_discoverable_from_readme
run_test "tool help and documentation agree" test_tool_help_mentions_documented_commands

say "passed: $pass_count"
say "failed: $fail_count"

[ "$fail_count" -eq 0 ]
