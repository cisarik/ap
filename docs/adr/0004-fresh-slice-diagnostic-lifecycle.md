# ADR-0004: Fresh-Slice Implementation and Diagnostic Closeout Lifecycle

## Status

Accepted

## Context

Field use showed a repeatable successful pattern for substantial repository
work:

1. assign one fresh Worker instance to one coherent implementation slice;
2. give that Worker exact bounded authority and enough context to complete the
   slice;
3. finish with validation, one normal commit and push when authorized, and
   independently verifiable public state;
4. have the Orchestrator compare the original task contract, Worker report,
   public commit, diff, tests, documentation claims, and unresolved risks;
5. when risk justifies it, send one second diagnostic closeout prompt about the
   same implemented slice.

The diagnostic pass is valuable because positive-path tests can miss negative
guarantees and failure behavior. The pattern must remain bounded, sequential,
and evidence-driven.

## Decision

AP adopts a proportional Fresh-Slice Implementation and Diagnostic Closeout
Lifecycle.

A substantial coherent task may be assigned to a fresh Worker instance as one
implementation slice. The task may include the inspection, architecture
recording, implementation, tests, documentation, one normal commit and push, and
final report needed to complete that slice when all parts serve one primary
outcome.

The task must not combine unrelated features, speculative refactors, unrelated
audits, independent product decisions, or operational mutations merely because
the Worker has remaining context capacity.

After the implementation report, the Orchestrator performs independent
evaluation against the original task contract and public repository evidence.
The Orchestrator then decides whether acceptance is sufficient or whether one
diagnostic closeout pass is proportionate.

A diagnostic closeout is a second authoritative prompt concerning the same
already implemented slice. It is not a new product feature, general cleanup
mission, unlimited polish pass, or substitute for Orchestrator review.

Diagnostic closeout is read-only by default. Correction authority must be
explicit, limited to confirmed defects inside the original task boundary,
constrained by an exact path allowlist, and normally completed in one corrective
commit.

The default diagnostic closeout may use the same Worker instance for efficiency.
For exceptionally high-risk work, the Orchestrator may instead use a separate
fresh Worker instance for sequential independent audit.

AP remains sequential at the protocol boundary. Independent audit is a
sequential assignment, not parallel execution.

## Consequences

The lifecycle supports substantial coherent work without turning AP into an
open-ended polishing process. It improves review of negative behavior,
documentation truth, security boundaries, and failure cleanup.

It adds judgment load for Orchestrators, who must decide when diagnostic
closeout is worthwhile and keep correction authority narrow.

## Rejected Alternatives

- Mandatory two-prompt ritual for every change.
- Same Worker as acceptance authority.
- Parallel diagnostic and implementation Workers.
- Context exhaustion as a goal.
- Handoff after every substantial slice.
- Broad cleanup during diagnostic closeout.

## Revisit Triggers

Revisit this decision if:

- consuming projects treat diagnostic closeout as mandatory ceremony;
- same-session diagnostics prove insufficient for high-risk classes of work;
- AP later changes its Worker topology;
- field evidence shows the lifecycle encourages oversized tasks;
- tool behavior changes how compaction, public verification, or session
  continuity should be handled.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
