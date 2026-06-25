# ADR-0001: Protocol Version Selection

## Status

Accepted

## Context

The Analytic Programming source repository carries two protocol generations:

- **AP v1** (`AP.md`): stable single-Worker protocol;
- **AP v2** (`APv2.md`): experimental complete multi-Worker protocol.

Consuming projects need a clear rule for choosing one active protocol. Both versions must remain usable without implicit mixing.

## Decision

1. The source repository maintains stable `AP.md` (v1) and experimental standalone `APv2.md`.
2. A consuming project MUST designate exactly one active protocol file named `AP.md`.
3. Version selection belongs to the COOPERATOR.
4. The chosen version MUST be recorded in project-specific documentation (`AGENTS.md` and preferably an ADR).
5. `APv2.md` MUST be complete and standalone; it MUST NOT depend on reading AP v1.

## Consequences

- Target projects copy or rename the chosen version to `AP.md` and remove conflicting protocol files.
- The source repository may carry both versions simultaneously for reference and adoption.
- Upgrade timing is controlled by each consuming project, not by the source repository release cycle.

## Alternatives considered

- **Single evolving `AP.md` only**: Rejected because v1 stability and v2 experimentation require parallel availability during transition.
- **Implicit v2 as extension of v1**: Rejected because consuming projects need one unambiguous active protocol without cross-reading requirements.

## Lifecycle and ownership

- Update authority: explicit ORCHESTRATOR task with COOPERATOR approval for breaking changes.
- Supersession: new ADR, not silent rewrite of this record.
