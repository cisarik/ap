# Adopting Analytic Programming

This guide explains how to adopt Analytic Programming (AP) in another repository.

## Prerequisites

- A Git repository for your project
- A COOPERATOR who selects protocol version and approves topology
- Willingness to maintain one active `AP.md` and project-specific overlay files

## Supported adoption paths

### Path C — AP v3 (recommended, active generation)

AP version 3 is the active and recommended generation. It is a single-Worker Coordinator Protocol with intentional Worker instance rotation.

AP v3 includes a proportional fresh-slice implementation and diagnostic closeout lifecycle. Consuming projects may use it for substantial coherent slices and risk-sensitive closeout review, but it is not a mandatory two-pass ritual for every edit.

1. Copy these **universal** files from this repository:
   - [APv3.md](APv3.md) → rename to `AP.md` in the target project (exactly one active protocol)
   - [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
   - [AP_WORKER.md](AP_WORKER.md)
   - [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
   - [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md)
2. Optionally copy for reference:
   - [GLOSSARY.md](GLOSSARY.md)
   - [VERSIONING.md](VERSIONING.md)
3. Copy and customize project templates from [templates/project/](templates/project/):
   - `README.md`, `AGENTS.md`, `WORKERS.md`, `BOOT_ORCHESTRATOR.md`, `BOOT_WORKER.md`, `NEXT_ORCHESTRATOR.md`, `NEXT_WORKER.md`
4. Set `<ACTIVE_AP_VERSION>` to `v3` in customized templates.
5. Initialize [WORKERS.md](WORKERS.md) with one `Worker_1` by default.

The target repository ends with **one active `AP.md`** containing v3 content.

### Path A — AP v1 (legacy, superseded)

AP v1 is preserved in Git history, not in the current working-tree `AP.md`. The current `AP.md` is a redirect to AP v3.

Do not copy the current `AP.md` when trying to adopt AP v1. Legacy v1 adoption requires intentionally retrieving the historical v1 content from Git history and recording that legacy choice in the target project.

For legacy v1 projects, pair the historical v1 protocol content with these current companion files only after reviewing compatibility:

- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
- [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md)

Optionally copy for reference:

- [GLOSSARY.md](GLOSSARY.md)
- [VERSIONING.md](VERSIONING.md)

Then copy and customize project templates from [templates/project/](templates/project/):

- `README.md` (adapt for your project)
- `AGENTS.md`
- `WORKERS.md`
- `BOOT_ORCHESTRATOR.md`
- `BOOT_WORKER.md`
- `NEXT_ORCHESTRATOR.md`
- `NEXT_WORKER.md`

The target repository ends with **one active `AP.md`** containing historical v1 content.

> **Note:** AP v1 is superseded by v3. Path A is retained for legacy projects only.

### Path B — AP v2 (legacy, superseded)

**Simple manual selection workflow:**

1. Copy portable AP repository files into the new project.
2. Remove the copied v1 `AP.md`.
3. Rename or copy [APv2.md](APv2.md) to `AP.md`.
4. Remove the leftover `APv2.md` from the target project unless intentionally retained as non-active reference only.
5. Confirm that **exactly one file** is designated as the active protocol: `AP.md`.
6. Customize [WORKERS.md](WORKERS.md) — **mandatory** for AP v2.
7. Customize [AGENTS.md](AGENTS.md) and BOOT files from templates.
8. Initialize **one Worker** by default (`Worker_1`).
9. Add more Workers only after ORCHESTRATOR recommendation and COOPERATOR approval.

**Safer selective-copy alternative:**

Copy only the chosen version directly as `AP.md` (either v1 content or v2 content renamed), plus handbooks and companion files. Do not leave two protocol files active.

## Version rules

- [APv3.md](APv3.md) is **active and recommended**.
- [APv2.md](APv2.md) is **superseded** — complete and standalone, but experimental multi-Worker; retained for reference.
- AP v1 is **superseded** — preserved in Git history; `AP.md` in this source repository redirects to v3.
- A target project MUST NOT treat multiple generations as simultaneously active.
- Active version selection is a **COOPERATOR decision**.
- Record the selection in project `AGENTS.md` and preferably an ADR.

## Initial project bootstrap sequence

1. Create or open the target repository.
2. Choose AP v3 (recommended) or a legacy generation.
3. Copy universal protocol and companion files (for v3, copy `APv3.md` to `AP.md`).
4. Copy and customize templates; replace all placeholders.
5. Initialize `WORKERS.md` (one `Worker_1` row by default).
6. Start a fresh Orchestrator instance assigned to the ORCHESTRATOR role.
7. Verify repository identity and public state.
8. Generate one launch-and-task prompt for `Worker_1`.
9. Continue through NEXT handoffs at session boundaries.

## What consuming projects customize

| File | Customization |
|---|---|
| `AGENTS.md` | Project identity, language rules, source-of-truth order, local constraints |
| `WORKERS.md` | Topology, labels, assignments, status |
| `BOOT_*.md` | COOPERATOR name, repository URL, reading order |
| `NEXT_*.md` | Replaced at each session close with verified state |

## What stays universal

- Active `AP.md` protocol text (v3 content recommended; or legacy v1/v2 renamed)
- `AP_ORCHESTRATOR.md` and `AP_WORKER.md` handbooks
- `PROMPT_CONTRACTS.md` and `ARTIFACT_LIFECYCLE.md`

`AP_WORKER.md` never contains project-specific Worker count. Count belongs in `WORKERS.md`.

## Architecture decision

Record protocol version selection and Worker topology in project ADRs when the project uses ADRs. See [docs/adr/](docs/adr/) in this source repository for examples.

## Related documents

- [VERSIONING.md](VERSIONING.md)
- [README.md](README.md)
- [templates/project/README.md](templates/project/README.md)
