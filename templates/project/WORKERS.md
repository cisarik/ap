# Worker Topology — <PROJECT_NAME>

## Role versus manifest

`WORKERS.md` is **project-specific operational state**. It must not be confused with the persistent protocol role **WORKER**.

## Project

<PROJECT_NAME> — <REPOSITORY_URL>

## Active protocol

<ACTIVE_AP_VERSION> — see active `AP.md` at project root.

## Topology summary

| Setting | Value |
|---|---|
| Approved Worker count | one (default) |
| Parallel execution | disabled (default) |
| Topology | single Worker |

Expand only after ORCHESTRATOR recommendation and COOPERATOR approval.

## Worker roster

### Worker_1 (default placeholder)

| Field | Value |
|---|---|
| Label | `Worker_1` |
| Status | PLANNED |
| Current assignment | None — awaiting first task |
| Assignment profile | General implementation |
| Authorized workstream | TBD per task |
| Capability profile | TBD — functional description without vendor identity |
| Active branch | <PRIMARY_BRANCH> |
| Last verified baseline | TBD |
| Current session state | Not started |
| Handoff path | NEXT_WORKER.md |
| Integration dependencies | none |
| Notes | Initial Worker placeholder |

## Optional additional Workers (AP v2)

When COOPERATOR approves additional Workers, add rows:

### Worker_2 (example — remove if unused)

| Field | Value |
|---|---|
| Label | `Worker_2` |
| Status | PLANNED |
| Current assignment | None |
| Handoff path | NEXT_WORKER_2.md |
| Integration dependencies | Worker_1 baseline TBD |

## Update authority

Only an explicit ORCHESTRATOR task with COOPERATOR approval for topology changes may update this manifest.
