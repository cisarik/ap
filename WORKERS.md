# Worker Topology — Analytic Programming Source Repository

## Role versus manifest

`WORKERS.md` is **project-specific operational state**. It records concrete Worker instances, topology, and assignments for this repository.

It must not be confused with the persistent protocol role **WORKER**, which is defined in [AP.md](AP.md) and [AP_WORKER.md](AP_WORKER.md).

## Project

Analytic Programming methodology repository (`https://github.com/cisarik/ap.git`)

## Active protocol

AP v1 ([AP.md](AP.md))

AP v2 ([APv2.md](APv2.md)) is an experimental deliverable in this repository but is **not** the active governance protocol for the initial bootstrap.

## Topology

| Setting | Value |
|---|---|
| Topology | Single Worker |
| Approved Worker count | one |
| Parallel execution | disabled |

## Worker roster

| Field | Worker_1 |
|---|---|
| Label | `Worker_1` |
| Status | ACTIVE |
| Current assignment | Initial protocol repository bootstrap (AP-BOOTSTRAP-001) |
| Assignment profile | Documentation synthesis and protocol design |
| Authorized workstream | Entire documentation repository per task authorization |
| Capability profile | Repository read/write, shell commands, Git write when authorized |
| Active branch | `main` |
| Last verified baseline | Empty public repository before initial commit |
| Current session state | Open — session remains active after bootstrap |
| Handoff path | [NEXT_WORKER.md](NEXT_WORKER.md) |
| Integration dependencies | none |
| Worker implementation identity | Intentionally undisclosed |
| Notes | First concrete Worker instance for this repository |

## Update authority

Only an explicit ORCHESTRATOR task may change this manifest.

## AP v2 note

When this project adopts AP v2, this file MUST be updated with COOPERATOR-approved topology before activating multiple Workers.
