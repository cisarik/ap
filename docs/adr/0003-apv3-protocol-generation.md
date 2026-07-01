# ADR-0003: AP v3 Protocol Generation

## Status

Accepted

## Context

The Analytic Programming source repository carried two protocol generations:

- **AP v1** (`AP.md`): stable single-Worker protocol;
- **AP v2** (`APv2.md`): experimental complete multi-Worker protocol.

A parallel software project (`cisarik/framenest`, public) field-evolved the protocol through extensive real use. Its `AP.md` grew to 38 sections, adding material absent from both v1 and v2: a Worker Role Portability and Capability Model (multi-agent accountability, context capacity, vendor neutrality), three-layer handoff transport (stable bootstrap / repository handoff / authoritative task), compact communication mode, numbered COOPERATOR acceptance feedback, failure handling with bounded retry, session rotation heuristics, anti-patterns, and a 5-class artifact lifecycle model.

The COOPERATOR decided that v3 should be a single-Worker model (not multi-Worker). The v2 multi-Worker topology was experimental and theoretical only; the COOPERATOR could not manage multiple Workers manually.

## Decision

1. Adopt **AP version 3** (`APv3.md`) as the active protocol for this source repository.
2. AP v3 is a **single-Worker Coordinator Protocol with intentional Worker instance rotation**, adapted from the field-evolved FrameNest protocol with product-specific and vendor-specific content generalized out.
3. **Supersede AP v1**: `AP.md` becomes a redirect document pointing to `APv3.md`. The v1 text is preserved in Git history.
4. **Supersede AP v2**: `APv2.md` is retained as a superseded experimental reference. Its multi-Worker topology is not adopted as active governance.
5. Update the universal handbooks (`AP_ORCHESTRATOR.md`, `AP_WORKER.md`) in-place to the v3 level.
6. Align companion documents (`PROMPT_CONTRACTS.md`, `ARTIFACT_LIFECYCLE.md`, `GLOSSARY.md`), project-specific files (`AGENTS.md`, `WORKERS.md`, `BOOT_ORCHESTRATOR.md`), and templates (`templates/project/`) with v3.
7. A consuming project copies `APv3.md` to its own `AP.md` as the active protocol.
8. Update `VERSIONING.md` and `ADOPTION.md` to register v3 as active and mark v1/v2 as superseded.

## Consequences

- The source repository has one active generation (v3) and two superseded generations retained for reference.
- `AP.md` is no longer a full protocol; it is a redirect. Consuming projects must copy `APv3.md`, not the redirect.
- The universal handbooks are richer (handoff orchestration, capability-aware task shaping, compact communication, checklists, artifact lifecycle execution).
- New terminology enters the glossary: capability profile, compact communication mode, numbered COOPERATOR acceptance feedback, three-layer handoff, context economy, integrated bootstrap gate.
- Git history preserves v1 and v2 text for traceability and legacy adoption.

## Alternatives considered

- **Keep v1 active, add v3 as experimental only**: Rejected. The COOPERATOR decided v3 should be active and v1 superseded.
- **Merge v2 multi-Worker topology into v3 as a superset**: Rejected. The COOPERATOR decided v3 is single-Worker; multi-Worker was experimental and theoretical only.
- **Delete v1 and v2 files**: Rejected. Superseded generations are retained for reference and Git traceability per VERSIONING.md deprecation policy.
- **Leave handbooks unchanged for v1/v2, create v3-specific handbooks**: Rejected. The COOPERATOR decided handbooks should be updated in-place to the v3 level.

## Lineage

AP v3 was extracted from the public reference repository `https://github.com/cisarik/framenest` (generic protocol files only: `AP.md`, `AP_ORCHESTRATOR.md`, `AP_WORKER.md`). FrameNest product documentation, project identity, vendor names, and FrameNest-specific ADRs were excluded per the FrameNest boundary rule in `AGENTS.md`. Only generic protocol material was extracted and generalized.

## Lifecycle and ownership

- Update authority: explicit ORCHESTRATOR task with COOPERATOR approval for breaking changes.
- Supersession: new ADR, not silent rewrite of this record.
- Related: [ADR-0001](0001-protocol-version-selection.md), [ADR-0002](0002-worker-instance-topology.md).
