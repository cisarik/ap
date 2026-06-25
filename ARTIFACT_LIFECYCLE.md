# Artifact Lifecycle

Rules for creating, retaining, consuming, and cleaning repository artifacts under Analytic Programming.

## Required metadata

Every meaningful artifact SHOULD have:

| Attribute | Question answered |
|---|---|
| Classification | What kind of artifact is this? |
| Intended consumer | Who reads or uses it next? |
| Authority level | Normative, handbook, overlay, handoff, temporary? |
| Inbound discoverability | How does the next participant find it? |
| Retention trigger | When does it become eligible for archive or deletion? |
| Cleanup trigger | What event authorizes removal? |
| Update owner | Who may change it? |
| Cleanup owner | Who may delete or archive it? |

## Classification

| Class | Description | Typical retention |
|---|---|---|
| Permanent normative protocol | `AP.md`, ADRs when accepted | Until superseded |
| Accepted ADR | Recorded decision | Permanent; supersede, do not silently rewrite |
| Living handbook | `AP_ORCHESTRATOR.md`, `AP_WORKER.md` | Update with protocol evolution |
| Project-specific overlay | `AGENTS.md`, `WORKERS.md` | Project lifetime |
| Bootstrap | `BOOT_*.md` | Stable; rare updates |
| Session handoff | `NEXT_*.md`, label-specific NEXT | Replace at session close |
| Temporary research | Notes supporting one decision | Delete after conclusions transferred |
| Generated evidence | Test output logs committed for audit | Per task authorization |
| Transient diagnostic output | Local command output not committed | Never commit unless authorized |

## Rules

### Temporary research

Temporary research artifacts MUST be removed after conclusions are transferred to durable consumers (ADRs, normative docs, or issue records).

Material conclusions and citations MUST be transferred before deletion.

### Git history as archive

Git history preserves superseded handoffs and documents. Replacement does not require deleting history.

### No orphaned artifacts

Artifacts without a consumer, inbound reference, or retention rule SHOULD be corrected or removed in the same bounded task that retires them.

### Worker deletion authority

Deleting normative or retained artifacts requires explicit task authority. Workers MUST NOT delete protocol files without supersession authorization.

### NEXT files

NEXT files are replaceable lifecycle artifacts. They are overwritten at session close, not appended as logs.

### BOOT files

BOOT files are stable. Change only through explicit governance tasks.

### ADRs

Accepted ADRs are superseded by new ADRs, not silently rewritten. Update the ADR index when status changes.

## Worker responsibilities

When creating or deleting artifacts, the Worker MUST:

- verify lifecycle metadata in the task;
- stop if cleanup authority is missing;
- transfer conclusions before deleting temporary evidence;
- update inbound links when replacing artifacts;
- report artifact state in the Worker report.

## Orchestrator responsibilities

The Orchestrator MUST:

- classify requested artifacts before authorizing creation;
- reject orphan artifacts;
- include cleanup in the same task that consumes temporary evidence when possible;
- verify public commits include authorized cleanup.

## Related documents

- [AP.md](AP.md)
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
