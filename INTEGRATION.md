# Integrating AP Into a Project

Artifact relationship: **operational integration guide** for
[RF-15](AP.md#rf-15-protocol-variants-and-stable-integration). `AP.md` owns
meaning; this guide projects the unchanged executable adoption, migration, and
removal workflow. It grants no repository or Git authority.

This guide covers first integration, ordinary clone recovery, health checks,
migration from copied AP files, and manual removal.

## Requirements

- The target is a Git repository.
- The project owner accepts AP as a project coordination protocol.
- The project is ready to pin AP as a submodule at `.ap/`.
- Universal AP files are not copied into the project root.

## Clean Project Integration

From the consuming project root:

```sh
git submodule add https://github.com/cisarik/ap.git .ap
./.ap/ap init
./.ap/ap doctor
git diff -- .gitmodules AGENTS.md
git diff --submodule
```

`./.ap/ap init` creates or updates one managed block in root `AGENTS.md`. It
preserves content outside that block and does not create copied AP protocol,
BOOT, NEXT, or WORKERS files.

When a project task authorizes the adoption commit, stage exactly the
integration paths:

```sh
git add .gitmodules .ap AGENTS.md
git commit -m "docs: adopt analytic programming"
```

The AP tool does not commit or push.

## Managed `AGENTS.md` Block

The managed block states that:

- the project uses the exact AP commit pinned by `.ap/`;
- participants read `.ap/AP.md`;
- Orchestrators also read `.ap/AP_ORCHESTRATOR.md`;
- Workers also read `.ap/AP_WORKER.md`;
- prompt structures live in `.ap/PROMPT_CONTRACTS.md`;
- project-specific rules outside the block remain authoritative within their
  scope;
- task authority comes only from the current authoritative Orchestrator prompt;
- `.ap/` is read-only during ordinary project work;
- protocol updates require a separate explicit AP update task.

Do not edit inside the markers manually unless you are deliberately repairing a
failed integration under project authority. Run `./.ap/ap init` to refresh the
managed block.

## Clone Workflow

Preferred clone:

```sh
git clone --recurse-submodules <project-url>
```

Recovery after an ordinary clone:

```sh
git submodule update --init --recursive
./.ap/ap doctor
```

This uses standard Git submodule behavior. AP does not hide submodule checkout
semantics behind unsafe automation.

Official Git documentation describes submodules as repositories embedded in a
superproject, tracked by a gitlink and `.gitmodules`; the gitlink records the
commit expected by the superproject. See:

- <https://git-scm.com/docs/gitsubmodules>
- <https://git-scm.com/docs/git-submodule>
- <https://git-scm.com/docs/gitmodules>

## Pinned Submodule Checkout Topology

The consuming repository owns the `.ap` gitlink that declares its accepted AP
version. An ordinary initialized submodule checkout may therefore be in detached
HEAD at that exact commit. This is the expected pinned submodule topology, not
an error, and attaching `.ap` to `main` is not part of ordinary consumption.

Strict `./.ap/ap doctor` validates the accepted pin by comparing the containing
repository gitlink with the `.ap` checkout `HEAD`, along with canonical identity
and cleanliness. It does not require an active `main` branch. Public AP `main`
and the submodule's local `origin/main` may advance while a consuming project
intentionally remains on its older accepted pin.

For stable AP, strict doctor resolves one exact compatibility tuple:

- canonical repository identity `https://github.com/cisarik/ap.git`, allowing
  only accepted cosmetic URL equivalents;
- canonical consuming-project path `.ap`;
- an immutable `.ap` gitlink in the containing project;
- equality between that gitlink and the `.ap` checkout;
- the exact canonical AP-managed block in root `AGENTS.md`.

This tuple is the explicit stable declaration. It requires no added literal
variant field or managed-block migration and is reported as
`OK resolved governing variant: stable`. An active project-owned declaration
of another governing AP source or variant, or an instruction to import rules
from another variant, invalidates the selection. Quoted and fenced examples are
not active declarations.

Adopting a newer AP version requires a separate explicit submodule-update task,
validation of the candidate, and a containing-repository commit that changes
the `.ap` gitlink. Do not attach or update the submodule merely to make its
checkout resemble a standalone AP development checkout.

## Health Check

Run:

```sh
./.ap/ap doctor
```

The doctor checks the containing Git repository, `.ap` submodule shape,
canonical AP identity, pinned commit, submodule cleanliness, gitlink
consistency, `.gitmodules` coherence, exact managed `AGENTS.md` block, and
confirmed copied AP artifacts. Strict mode also resolves and reports the
governing `stable` variant from the exact compatibility tuple above.

Strict doctor is read-only with respect to the superproject and `.ap`
worktrees, indexes, refs, remotes, and Git configuration. It may create and
remove temporary comparison files outside the project. Use
`./.ap/ap doctor --candidate` only for an intentional update or rollback
candidate where `.ap` differs from the recorded gitlink.

## Migrating From Copied AP Files

Use this process for projects that contain old copied AP files such as
`AP.md`, `APv2.md`, `APv3.md`, `AP_ORCHESTRATOR.md`, `AP_WORKER.md`,
`PROMPT_CONTRACTS.md`, `ARTIFACT_LIFECYCLE.md`, BOOT/NEXT handoff files, or a
WORKERS manifest.

1. Start from a clean verified repository baseline.
2. Inventory each AP-looking file.
3. Classify each file as universal AP copy, project-specific rule, active
   unreconstructable session state, or unrelated project content.
4. Preserve genuine project-specific constraints in root `AGENTS.md` or another
   clearly project-owned document.
5. Do not delete unresolved local-only or session state blindly.
6. Add AP as the `.ap/` submodule:

   ```sh
   git submodule add https://github.com/cisarik/ap.git .ap
   ./.ap/ap init
   ```

7. Review the managed `AGENTS.md` block and any preserved project-specific
   rules.
8. Remove superseded copied universal AP files only after review confirms their
   material content is now in `.ap/` or preserved as project-specific rules.
9. Run:

   ```sh
   ./.ap/ap doctor
   git diff --check
   git diff --submodule
   ```

10. Commit the migration as one reviewable project change.

The consuming project's Git history retains old copied content. The live tree
should contain one AP submodule and project-owned rules, not duplicated
universal protocol files.

## Removing Stale Legacy AP Artifacts

There is no automatic removal command in this slice.

Manual cleanup should:

- happen only from a clean baseline;
- preserve project-specific rules before deletion;
- avoid deleting unresolved handoff state blindly;
- remove copied universal AP files after review;
- remove broken links in the same change;
- run `./.ap/ap doctor` and link checks after cleanup;
- commit the cleanup as an explicit migration or removal task.

## Manual Removal of AP Integration

If a project intentionally stops using AP, use a separate reviewable task. At
minimum:

1. Preserve any project-specific rules that should remain.
2. Remove the managed AP block from `AGENTS.md`.
3. Remove the `.ap` submodule gitlink and `.gitmodules` entry using standard Git
   submodule removal steps appropriate for the project.
4. Validate that no tools still point to `.ap/`.
5. Commit the removal.

AP does not provide a destructive automatic removal command.

## Universal Versus Project-Specific Rules

Canonical universal AP semantics live in `.ap/AP.md`; subordinate AP files use
their declared structural, operational, advisory, explanatory, historical, or
executable relationship.

Project-specific rules live in the consuming project. The root `AGENTS.md` is
the normal place for language rules, product invariants, local paths, source of
truth, tool limits, and security constraints.

If universal AP and project rules conflict, identify the exact conflict. A
project may impose stricter local rules, but it should not edit `.ap/` to do so.

## Related Documents

- [AP.md](AP.md)
- [UPDATING.md](UPDATING.md)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
- [docs/adr/0005-single-live-protocol-and-pinned-submodule-distribution.md](docs/adr/0005-single-live-protocol-and-pinned-submodule-distribution.md)
