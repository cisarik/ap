# ADR-0005: Single Live Protocol and Pinned Submodule Distribution

## Status

Accepted

## Context

The AP source repository previously carried parallel live protocol-generation
files, copy-based adoption instructions, project templates for permanent
session-state files, and source-repository self-application artifacts. That made
the distribution harder to integrate safely:

- users had to choose among current-looking protocol files;
- consuming projects copied and customized universal files;
- updates were manual file replacement rather than pinned reviewable changes;
- source-session BOOT, NEXT, and WORKERS artifacts looked like product
  distribution material;
- Orchestrator rotation depended too heavily on committed handoff files.

The accepted direction is one canonical, universal, version-pinned AP protocol
that any Git project can integrate without copying or project-specific
modification of the protocol itself.

## Decision

AP has exactly one live normative protocol file:

```text
AP.md
```

Parallel live protocol-generation files are removed from the working tree.
Previous generations remain available through Git history, immutable commit
SHAs, and future tags or releases if adopted.

The default consuming-project distribution is a pinned Git submodule at:

```text
.ap/
```

The consuming project records the exact AP commit through the submodule gitlink.
The protocol read by participants is `.ap/AP.md`.

The consuming project keeps only minimal integration glue:

- `.gitmodules`;
- `.ap/` as a Git submodule;
- root `AGENTS.md` with one managed AP integration block plus project-specific
  rules outside that block.

Universal AP rules remain in the AP repository. Project-specific rules remain
in the consuming project.

The root `ap` tool initializes and checks integration without third-party
dependencies. It creates or updates the managed `AGENTS.md` block, checks
integration health, and supports explicit AP update commands. It never commits
or pushes a consuming project.

AP updates are explicit and auditable:

1. the project pins an exact AP commit;
2. an update is checked;
3. the submodule worktree is moved to an exact new commit;
4. project compatibility is validated;
5. the consuming project commits the changed gitlink.

The AP source repository no longer ships permanent source-session BOOT, NEXT,
or WORKERS files, nor project templates that create always-present placeholders.
Repository handoffs are exceptional and Worker-authored only under explicit
Orchestrator authority with a defined consumer and lifecycle.

The default Orchestrator rotation model is dynamic prompt generation: at a
coherent verified boundary, the Orchestrator states whether rotation is
appropriate and produces a self-contained restoration prompt for the fresh
Orchestrator instance. That prompt grants no mutation authority; the fresh
instance must verify public truth independently.

## Rationale

Git submodules match the AP distribution need:

- the superproject records the exact dependency commit as a gitlink;
- the AP repository keeps independent history;
- the consuming project chooses when to move to a new AP commit;
- standard clone and recovery commands are well understood;
- rollback is a reviewable gitlink change.

Official Git documentation describes submodules as repositories embedded in a
superproject. The superproject tracks the submodule through a gitlink and
`.gitmodules`, and the gitlink records the commit the superproject expects the
submodule worktree to use. It also documents the standard add, checkout,
commit, clone, and update workflows. See:

- <https://git-scm.com/docs/gitsubmodules>
- <https://git-scm.com/docs/git-submodule>
- <https://git-scm.com/docs/gitmodules>

## Security and Supply Chain

Pinning by gitlink prevents silent protocol drift. A project does not consume
whatever happens to be on remote `main` until it explicitly updates the
submodule pointer and commits that pointer.

The integration tool verifies canonical AP repository identity by meaningful
dimensions and accepts cosmetic optional `.git` suffix differences. It avoids
copying protocol text, modifying Git configuration, committing, pushing,
reading credentials, executing downloaded content, or silently following
arbitrary remote branches.

The managed `AGENTS.md` block makes task authority explicit: AP presence is not
task authority, `.ap/` is read-only during ordinary project work, and protocol
updates require a separate explicit task.

## Clone and Update Trade-Offs

Submodules require users to initialize or clone recursively. This is an ordinary
trade-off, not a fatal blocker. The integration documentation keeps the standard
commands visible:

```sh
git clone --recurse-submodules <project-url>
git submodule update --init --recursive
```

Updates require an explicit fetch and checkout in the AP submodule, plus a
superproject gitlink commit. This is intentional because protocol changes
should be reviewed and validated.

## Rollback

Rollback is a normal Git operation: check out an earlier AP commit inside
`.ap/`, validate the project, and commit the changed gitlink in the consuming
project.

## Migration Consequences

Projects that previously copied AP files must inventory copied universal files,
preserve genuine project-specific constraints, add the `.ap/` submodule, run
`./.ap/ap init`, remove superseded copies only after review, validate links and
agent discovery, and commit the migration as one reviewable project change.

Historical copied contents remain in the consuming project's Git history.

## Removed Current ADRs

Earlier ADRs whose sole current purpose was explaining live parallel protocol
generations and source-repository operational state are removed from the live
tree after their relevant reasoning is migrated here. Git history preserves
them.

ADR-0004 remains current because the fresh-slice and diagnostic lifecycle is
still part of AP.

## Rejected Alternatives

- **Manual copy**: rejected because it creates divergent project-local protocol
  files and unsafe manual updates.
- **Generated full copy**: rejected because it still duplicates universal
  protocol text and makes local modification tempting.
- **Git subtree as the default**: rejected because it blends histories and makes
  updates look like large content imports rather than a small pinned pointer.
- **Package-manager installation**: rejected because AP is protocol
  documentation and should not require an ecosystem-specific package format.
- **Unpinned remote-main consumption**: rejected because it silently changes
  behavior in existing projects.
- **Permanent NEXT and WORKERS files**: rejected because they create stale
  session state and source-repository self-application artifacts.

## Revisit Triggers

Revisit this decision if:

- Git submodule support becomes unavailable in the target project class;
- repeated consuming projects cannot operate the explicit update flow;
- supply-chain requirements demand signed releases or additional verification;
- AP becomes more than documentation plus dependency-free tooling;
- a safe removal command becomes necessary and independently testable;
- field evidence shows the managed `AGENTS.md` block is insufficient for agent
  discovery.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../INTEGRATION.md](../../INTEGRATION.md)
- [../../UPDATING.md](../../UPDATING.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
