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

AP version 3 (see [APv3.md](APv3.md) §38) defines a 5-class model. The table below maps each class to concrete repository artifacts.

| Class | Description | Repository examples | Typical retention |
|---|---|---|---|
| **Transient evidence** | Command output, reports, observations that normally remain uncommitted | Local command output, chat findings, uncommitted diffs | Never commit unless authorized |
| **Temporary committed evidence** | Research or decision-support material committed only when multi-session review or durable pre-decision evidence is genuinely needed; non-authoritative | Investigation notes, comparison tables, evidence packages | Delete after conclusions transferred to durable consumer |
| **Retained evidence** | Durable audits, reproducible benchmarks, incident evidence, compatibility records with continuing independent value | Benchmark results, compatibility matrices, incident records | Explicit retention rationale and discoverable index required |
| **Normative durable artifacts** | Accepted ADRs, specifications, policies, schemas, authoritative project records | `APv3.md`, accepted ADRs, `SPEC.md`-equivalent normative docs | Remain until explicitly superseded or retired |
| **Operational lifecycle artifacts** | Bootstrap, session handoff, checkpoint, working-state documents | `BOOT_*.md`, `NEXT_*.md`, `WORKERS.md`, `AGENTS.md` | Replace at session close or via governance; MUST NOT become endless logs |

Living handbooks (`AP_ORCHESTRATOR.md`, `AP_WORKER.md`) are normative durable artifacts updated with protocol evolution.

## Required metadata for newly committed documentation or evidence

Every task that authorizes a new committed documentation or evidence artifact MUST define:

- artifact classification;
- authoritative or non-authoritative status;
- intended consumer;
- discoverability or inbound reference;
- retention or cleanup trigger;
- cleanup owner or responsible role.

## Normative principles

- Use the lightest sufficient artifact.
- Prefer an evidence-dense Worker report over a committed research file when the report is sufficient.
- Do not create an artifact without a concrete consumer.
- No committed documentation artifact may remain unintentionally orphaned.
- Git history is the historical archive; the active working tree represents current usable project knowledge.
- When temporary evidence is consumed by a durable artifact: transfer conclusions, remove the temporary evidence, remove or replace inbound links — in the same bounded task and preferably the same commit.
- Retaining consumed evidence is an exception requiring an explicit continuing-value rationale.
- A retention trigger does not itself authorize deletion. Deletion still requires explicit task-specific authority.
- Do not introduce a mandatory global artifact registry; use existing indexes, ADR indexes, README sections, or handoffs when sufficient.

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

- [APv3.md](APv3.md) — active protocol (§38 defines the classification model)
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
