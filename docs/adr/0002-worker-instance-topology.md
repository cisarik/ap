# ADR-0002: Worker Instance Topology

## Status

Accepted

## Context

Analytic Programming defines one persistent `WORKER` role. Projects may assign one or more concrete Worker instances to that role. Worker count and topology affect coordination cost, integration risk, and verification value.

Project-specific Worker count MUST NOT appear in universal handbooks such as `AP_WORKER.md`.

## Decision

1. `WORKER` remains one persistent protocol role.
2. Multiple concrete Worker instances MAY be assigned to it simultaneously or sequentially.
3. Concrete labels use opaque project-local names such as `Worker_1`, `Worker_2`, `Worker_3`.
4. Project-specific Worker count and state belong in `WORKERS.md`.
5. One Worker is the default topology.
6. Sequential relay is the preferred multi-Worker topology.
7. Parallel workstreams are exceptional and require explicit bounded authorization.
8. The ORCHESTRATOR recommends topology; the COOPERATOR approves significant topology changes.
9. Every Worker instance MUST receive a separate authoritative prompt.
10. Integration remains ORCHESTRATOR-controlled.

## Consequences

- Universal Worker handbook stays vendor-neutral and count-neutral.
- AP v2 projects MUST maintain `WORKERS.md`.
- Parallel execution requires explicit path ownership, integration owner, and conflict policy.
- Additional Workers add coordination overhead; they are justified only by named benefit.

## Alternatives considered

- **Fixed single Worker forever**: Rejected because fresh context, independent verification, and specialist chains provide concrete value when bounded.
- **Parallel as default AP v2 mode**: Rejected because integration risk and conflict cost outweigh benefits for most tasks.
- **Vendor-specific Worker roles (REVIEWER, BUILDER)**: Rejected; assignment profiles apply to Workers, not new persistent roles.

## Lifecycle and ownership

- Topology changes SHOULD be recorded in `WORKERS.md` and noted in Orchestrator handoffs.
- Update authority: ORCHESTRATOR recommendation plus COOPERATOR approval for count or parallel mode changes.
