# ADR-0020: Intuitive Mode, the Orchestrator Intuition Boundary, and the Intuition Projection

Status: Accepted

## Date

2026-08-27

## Context

[ADR-0019](0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md)
records why Orchestrator capability profiles and subagent delivery became
explicit. Alongside that work, field use showed a second gap: capable
Orchestrator clients invite an "intuitive mode" in which the Orchestrator acts
directly — synthesizing grants, staging files, emitting presentation packages,
even accepting work — without a clear line separating lawful direct routing
duty from Worker-required mutation and acceptance. Without that line,
Orchestrator intuition silently becomes implementation authority, and
independence claims weaken.

A related gap: the protocol's rules are dense by design, and experienced
Orchestrators asked for a brief intuition aid. Any such aid must not become a
second live protocol, and optional signaling (emoji, capsules) must remain
project-owned presentation rather than universal fields.

## Decision

Keep [AP.md](../../AP.md) as the sole live semantic owner. Record the
Orchestrator intuition boundary inside the existing RF-02 semantics, add an
advisory dense-grant pattern, and add one brief explanatory projection; add no
rule family, structural record, field, schema, command, validator, or
executable surface. This ADR does not rewrite capability-profile or dispatch
semantics; those are owned by
[ADR-0019](0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md)
and cited here only as context.

- **Intuition boundary.** Orchestrator-direct action is lawful only when all
  hold: inside an accepted logical whole's routing duty; deterministic or
  reversible; no semantic-owner mutation; no independence claim; no
  substituted Cooperator material decision; inside the accepted plan. Allowed
  direct work includes synthesizing and readiness-reviewing Worker grants,
  read-only inspection and preflight, RF-19 staging and archival after the
  report exists, dispatch-worktree create/remove when the accepted plan names
  that topology, emitting an activated project-owned Cooperator presentation
  after the copyable prompt, restoring or cleaning its own routing state, and
  direct acceptance at evidence-ladder rung 1 for E0/E1 claims that do not
  require independence. Worker-required work includes authoring AP or protocol
  content, implementation PASS on a material candidate, any acceptance
  requiring independence, publication, deployment, production, consumer pin
  updates, host or credential changes, and material protocol design not
  already locked. Direct acceptance never waives independent acceptance of a
  sole-protocol candidate. Intuition never bypasses the Plan-to-Execution
  Gate
  ([RF-02](../../AP.md#rf-02-orchestrator-decision-reconciliation-and-closure-authority)).
- **Dense grants by citation.** An advisory pattern (P19) teaches composing a
  complete grant from existing fields by citing canonical owners. Citations
  are context, never authority; no caps; no generator-owner.
- **`INTUITION.md` projection.** One new brief file: an explanatory
  projection of `AP.md` with advisory quick-rules. `AP.md` prevails on
  conflict; the file is optional, never required reading, and never a
  semantic owner; it holds a hard budget of at most 200 lines so it cannot
  grow into a second protocol.
- **Opt-in signaling pointer.** Emoji and localized signaling remain
  project-owned optional presentation under the existing Cooperator delivery
  and optional presentation mechanisms, emitted after the copyable
  structurally English prompt. They are never AP fields, never a
  Worker-authority gate, and inactive by default. `INTEGRATION.md` is
  unchanged.

## Semantic Ownership and Projections

- `AP.md` alone owns the intuition boundary (RF-02), the anti-pattern bullets,
  and the Related Documents link to `INTUITION.md`.
- `INTUITION.md` is the brief explanatory projection with advisory
  quick-rules; it owns no meaning.
- `PROMPT_ENGINEERING_PATTERNS.md` carries advisory pattern P19 and its index
  row.
- `README.md` gains one optional reading-order row; `ARTIFACT_LIFECYCLE.md`
  classifies `INTUITION.md` in the distribution-relationships table.
- `CHANGELOG.md` and this ADR are historical projections.

## Compatibility

The decision is prospective. Historical prompts interpret under their original
AP pins. Consumers that never read `INTUITION.md` lose nothing; Read-Only
Orchestrators remain fully valid. No managed block, schema, executable `ap`
behavior, consumer repository, or Meta path changes, and no mechanical
enforcement is claimed. The line budget keeps the projection brief by
construction.

## Consequences

Orchestrators gain a one-page intuition aid and an explicit boundary that
keeps direct action inside routing duty while mutation, independence, and
acceptance stay with Workers. Intuition-as-implementation-authority and
projection-as-owner are named anti-patterns. Documentation-first proportional
review applies; independent acceptance of this candidate, publication,
consumer adoption, and logical-whole closure remain separate.

## Relationship to Earlier Decisions

- ADR-0006: this decision keeps the adaptive lifecycle; intuition works
  inside selected phases and never converts a phase into authority.
- ADR-0011: this decision applies its evidence ladder; rung-1 direct
  acceptance is preserved exactly where independence is not required.
- ADR-0013: this decision follows the semantic-owner registry; `INTUITION.md`
  is explanatory, not a second owner.
- ADR-0015: this decision is documentation-first; no validator or suite is
  added.
- ADR-0017: this decision reuses its Cooperator-presentation and delivery
  disciplines; signaling stays project-owned presentation after the copyable
  prompt.
- ADR-0018: this decision applies its binding lesson in the reverse direction:
  capability and intuition never substitute for the Cooperator-selected route.
- ADR-0019: this decision builds on its capability-profile labels and
  dispatch-delivery semantics without changing them.

## Rejected Alternatives

- **Intuition as recorded implementation authority**: rejected; it would
  bypass Worker authority, Plan-to-Execution, and independence.
- **A new RF family for intuition**: rejected; RF-02 already owns Orchestrator
  decision authority, and a new family would duplicate it.
- **`INTUITION.md` as a second semantic owner or required reading**: rejected;
  `AP.md` is the sole owner, and required reading would recreate a parallel
  protocol.
- **Required emoji or Slovak fields**: rejected; signaling is opt-in,
  project-owned presentation, never a universal AP field.
- **Executable intuition or prompt validator**: rejected; the boundary is
  normative and operational, not mechanical, and `ap` does not construct or
  validate prompts.
- **Meta filename grammar as AP**: rejected; trace-local grammar stays
  storage-owned under RF-19.
- **A fourth persistent role for capable Orchestrators**: rejected; see
  [ADR-0019](0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md).
- **Ceremonial extra Workers or isolation-as-independence**: rejected;
  current-session reuse stays lawful, and isolation never proves independence.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../INTUITION.md](../../INTUITION.md)
- [../../PROMPT_ENGINEERING_PATTERNS.md](../../PROMPT_ENGINEERING_PATTERNS.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../ARTIFACT_LIFECYCLE.md](../../ARTIFACT_LIFECYCLE.md)
- [0006-adaptive-orchestration-and-preflight-lifecycle.md](0006-adaptive-orchestration-and-preflight-lifecycle.md)
- [0011-risk-routed-planning-and-bounded-closure.md](0011-risk-routed-planning-and-bounded-closure.md)
- [0013-semantic-ownership-and-convergence.md](0013-semantic-ownership-and-convergence.md)
- [0015-monolithic-ap-test-suite-retirement.md](0015-monolithic-ap-test-suite-retirement.md)
- [0017-cooperator-ergonomics-cost-proportional-execution.md](0017-cooperator-ergonomics-cost-proportional-execution.md)
- [0018-consumer-declared-execution-route-binding.md](0018-consumer-declared-execution-route-binding.md)
- [0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md](0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md)
