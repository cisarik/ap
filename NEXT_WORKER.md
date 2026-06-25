# Next Worker Handoff

## Identity and authority

This file is a **non-authoritative Worker-session handoff**. It restores repository and session context only.

It grants no command, modification, Git, dependency, migration, secret, network, provider, private-data, filesystem, deployment, or implementation authority.

Only a future authoritative ORCHESTRATOR task prompt may grant concrete task authority.

## Project identity

| Field | Value |
|---|---|
| Project | Analytic Programming |
| Repository | `https://github.com/cisarik/ap.git` |
| Primary branch | `main` |
| Normal local path | `/Users/agile/ap` |
| Repository type | Reusable documentation-only methodology repository |

A future Worker MUST verify the actual working directory and repository root rather than trusting this path blindly.

## Protocol state

| Setting | Value |
|---|---|
| Active protocol | AP v1 in [AP.md](AP.md) |
| APv2 | Complete standalone experimental deliverable in [APv2.md](APv2.md); not active governance for this repository |
| Default Worker count | one |
| Approved topology | single Worker |
| Parallel execution | disabled |
| Active Worker count (after this closeout) | zero |
| Most recently closed concrete instance | `Worker_1` |
| Next unused label | `Worker_2` (not initialized) |

## Completed work

### AP-BOOTSTRAP-001

- Created the initial 27-file documentation repository
- Defined AP v1, standalone APv2, role/instance terminology, universal handbooks, adoption and versioning guidance, artifact lifecycle, prompt contracts, templates, ADR-0001 and ADR-0002
- Root commit: `cbd38afa42c38e573fc1266ef48d426017c9f133` — subject `docs: bootstrap analytic programming protocol`

### AP-AUDIT-002

- Read-only full-repository audit
- Found one MAJOR APv2 standalone defect and two MINOR template-portability defects
- No repository change

### AP-REPAIR-003

- Made APv2 operationally standalone with explicit safety and authority sections
- Repaired template portability in `templates/project/AGENTS.md` and `templates/project/README.md`
- Commit: `dd0276e4ffaf56efccf3e5ca8082eae7d8810451` — subject `docs: make apv2 standalone and templates portable`

### AP-CLOSEOUT-004

- Closes concrete Worker instance `Worker_1`
- Replaces this handoff with current repository state
- Discover and verify the public commit containing this file version; do not assume its SHA from pre-commit text

## Current repository result

- **AP v1** is the active complete single-Worker protocol
- **APv2** is a complete standalone experimental multi-Worker protocol
- Persistent roles: COOPERATOR, ORCHESTRATOR, WORKER
- Concrete Worker instances use opaque labels such as `Worker_1`, `Worker_2`, `Worker_3`
- One Worker remains the default
- APv2 sequential relay is the preferred multi-Worker topology
- Parallel workstreams are exceptional and require explicit isolation and integration planning
- Every Worker receives a separate authoritative prompt
- Project-specific Worker state belongs in [WORKERS.md](WORKERS.md)
- A consuming project ends with exactly one active `AP.md`
- BOOT and NEXT artifacts are context, not task authority
- Public repository evidence SHOULD be independently verified

## Validation evidence

- 27 tracked files before closeout
- Markdown links validated during bootstrap and repair tasks
- No code, dependencies, manifests, lockfiles, CI, or executable tooling
- Templates checked for portability; APv2 standalone defect repaired
- Final pre-closeout worktree was clean
- No FrameNest mutation occurred
- No secret or private data was accessed

## Unresolved matters

- No known BLOCKER or MAJOR defect remains from the completed audit
- APv2 remains experimental by deliberate decision
- No future implementation or documentation task has been authorized
- [NEXT_ORCHESTRATOR.md](NEXT_ORCHESTRATOR.md) remains a separate Orchestrator lifecycle artifact
- The COOPERATOR manually replaces `NEXT_ORCHESTRATOR.md` at Orchestrator-session close according to the adopted project process

## Fresh Worker startup

A future fresh Worker instance MUST:

1. Receive its concrete label and one authoritative task prompt from the ORCHESTRATOR
2. Verify the public repository and current `main`
3. Verify the commit containing the current `NEXT_WORKER.md`
4. Verify branch, remote, worktree, parent, subject, and changed paths
5. Read in order: [AGENTS.md](AGENTS.md), [BOOT_WORKER.md](BOOT_WORKER.md), active [AP.md](AP.md), [AP_WORKER.md](AP_WORKER.md), [WORKERS.md](WORKERS.md), this file, [README.md](README.md), [ADOPTION.md](ADOPTION.md), [VERSIONING.md](VERSIONING.md), [docs/adr/README.md](docs/adr/README.md) and accepted ADRs, then task-relevant documents
6. Stop if repository evidence contradicts the handoff or task
7. Perform only the future bounded task

`Worker_2` is only the next unused label. This handoff does not initialize Worker_2 and does not grant Worker_2 a task.

## Artifact lifecycle

| Attribute | Value |
|---|---|
| Classification | Replaceable Worker-session handoff |
| Consumer | Future ORCHESTRATOR and future Worker instance |
| Authority | Contextual and non-authoritative |
| Retention | Until replaced by a later authorized Worker closeout |
| Update owner | Worker acting under explicit ORCHESTRATOR closeout authority |
| Cleanup model | Replacement rather than accumulation; Git history remains the archive |
