# Adopting Analytic Programming

This guide explains how to adopt Analytic Programming (AP) in another repository.

## Prerequisites

- A Git repository for your project
- A COOPERATOR who selects protocol version and approves topology
- Willingness to maintain one active `AP.md` and project-specific overlay files

## Two supported adoption paths

### Path A — AP v1 (single Worker default)

Copy these **universal** files from this repository:

- [AP.md](AP.md)
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

The target repository ends with **one active `AP.md`** (v1).

### Path B — AP v2 (multi-Worker capable)

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

- [APv2.md](APv2.md) is **complete and standalone**.
- A target project MUST NOT treat both v1 and v2 as simultaneously active.
- Active version selection is a **COOPERATOR decision**.
- Record the selection in project `AGENTS.md` and preferably an ADR.

## Initial project bootstrap sequence

1. Create or open the target repository.
2. Choose AP v1 or v2.
3. Copy universal protocol and companion files.
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

- Active `AP.md` protocol text (either v1 or renamed v2)
- `AP_ORCHESTRATOR.md` and `AP_WORKER.md` handbooks
- `PROMPT_CONTRACTS.md` and `ARTIFACT_LIFECYCLE.md`

`AP_WORKER.md` never contains project-specific Worker count. Count belongs in `WORKERS.md`.

## Architecture decision

Record protocol version selection and Worker topology in project ADRs when the project uses ADRs. See [docs/adr/](docs/adr/) in this source repository for examples.

## Related documents

- [VERSIONING.md](VERSIONING.md)
- [README.md](README.md)
- [templates/project/README.md](templates/project/README.md)
