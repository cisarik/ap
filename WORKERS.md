# Worker Topology — Analytic Programming Source Repository

## Role versus manifest

`WORKERS.md` is **project-specific operational state**. It records concrete Worker instances, topology, and assignments for this repository.

It must not be confused with the persistent protocol role **WORKER**, which is defined in [AP.md](AP.md) and [AP_WORKER.md](AP_WORKER.md).

## Project

Analytic Programming methodology repository (`https://github.com/cisarik/ap.git`)

## Active protocol

AP v3 ([APv3.md](APv3.md))

[APv2.md](APv2.md) is a superseded experimental multi-Worker protocol retained as reference. It is **not** the active governance protocol.

## Topology

| Setting | Value |
|---|---|
| Topology | Single Worker |
| Approved simultaneous Worker capacity | one |
| Active Worker count (after closeout) | zero |
| Parallel execution | disabled |

**Approved capacity** is how many Workers the COOPERATOR has approved for simultaneous assignment. **Active count** is how many concrete Worker instances currently hold an open session or assignment. After Worker_1 closeout, capacity remains one but active count is zero.

## Worker roster — closed instance

### Worker_1 (closed)

| Field | Value |
|---|---|
| Label | `Worker_1` |
| Persistent role | WORKER |
| Status | CLOSED |
| Completed assignments | AP-BOOTSTRAP-001, AP-AUDIT-002, AP-REPAIR-003, AP-CLOSEOUT-004 |
| Assignment outcome | Initial AP documentation repository created, audited, repaired, and handed off |
| Assignment profile | Documentation synthesis, protocol design, audit, and bounded repair |
| Final verified pre-closeout baseline | `dd0276e4ffaf56efccf3e5ca8082eae7d8810451` |
| Active branch used | `main` |
| Current session state | Closed after the closeout commit |
| Handoff path | [NEXT_WORKER.md](NEXT_WORKER.md) |
| Integration dependencies | none |
| Worker implementation identity | Intentionally undisclosed |
| Unresolved blocker | none |

Worker_1 is a closed historical concrete instance. It is not active.

## Next unused label

| Field | Value |
|---|---|
| Next unused concrete Worker label | `Worker_2` |
| Worker_2 initialized | no |
| Worker_2 assignment | none |
| Worker_2 status | not applicable — not in roster until explicitly initialized |

`Worker_2` is reserved as the next unused label only. It MUST NOT be treated as active merely because the label is recorded here.

A future authoritative ORCHESTRATOR task prompt and an explicit manifest update are required before `Worker_2` may act.

Do not add Worker_2 as an active roster entry until the ORCHESTRATOR and COOPERATOR authorize a new Worker session.

## Update authority

Only an explicit ORCHESTRATOR task may change this manifest.

## Multi-Worker note

AP v3 is a single-Worker model with intentional Worker instance rotation. The v2 multi-Worker topology was experimental and theoretical only. If a future COOPERATOR decision authorizes multiple simultaneous Workers, this file MUST be updated with COOPERATOR-approved topology before activating additional Workers.
