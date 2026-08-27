# ADR-0019: Subagent Delivery of Worker Sessions and Orchestrator Capability Profiles

Status: Accepted

## Date

2026-08-27

## Context

Client runtimes increasingly expose in-conversation subagent or tool-dispatch
capabilities, and field AP use showed two failure modes. First, an Orchestrator
with such a client had no protocol vocabulary for using it: dispatch happened
ad hoc, sometimes as opaque tool-task swarms with no complete Worker prompt, no
Worker session target, no coordinates, and no accountable Worker report.
Second, a subagent spawned inside the parent Orchestrator's own conversation
was presented as a "fresh independent audit" while inheriting the parent's
conversation and reasoning, silently defeating independence.

Current AP text already required a complete authoritative prompt, one
accountable Worker per session, fresh sessions for independent acceptance, and
single-active topology, but it did not state (a) whether an Orchestrator client
dispatch capability creates a new role, (b) how dispatch relates to the Worker
session target and complete-prompt requirements, or (c) that parent-context
spawning cannot produce independence.

## Decision

Keep [AP.md](../../AP.md) as the sole live semantic owner. Extend the existing
§2, §3, RF-02, RF-05, and RF-06 semantics with a bounded clarification; add no
rule family, structural record, field, schema, command, validator, or
executable surface.

- **Capability profiles, not a fourth role.** An **Agent Orchestrator** is an
  ORCHESTRATOR instance whose client functionally exposes session-dispatch or
  tool-routing capabilities and whose Cooperator-selected route — or an
  accepted plan for that logical whole — authorizes using them. A **Read-Only
  Orchestrator** lacks those capabilities or is not authorized to use them.
  Both remain the ORCHESTRATOR role; the names are descriptive
  capability-profile labels, never additional persistent roles, and a profile
  never grants authority
  ([RF-06](../../AP.md#rf-06-capability-reasoning-permission-containment-and-authority)).
- **Dispatch is prompt delivery.** Dispatch delivers one complete
  authoritative Worker prompt — coordinates, session target, profile,
  boundaries, and report contract — into one concrete session. A tool-task
  summary is not a prompt. The receiving session is an ordinary AP Worker
  session;
  [RF-03](../../AP.md#rf-03-worker-bounded-authority-and-report-expiry) and
  [RF-19](../../AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity)
  are unchanged. One accountable WORKER per dispatched session; the dispatcher
  remains the Orchestrator.
- **Whole-or-route authorization.** Dispatch authorization is the
  Cooperator-selected route or the accepted plan for the logical whole, not
  per-spawn microapproval. Copy-paste delivery remains a first-class lawful
  fallback whenever dispatch is absent, unauthorized, or cannot deliver the
  complete prompt; a dispatch that cannot deliver the complete prompt is not a
  dispatch. The default remains not-used. Parallel dispatch stays under
  single-active and the bounded parallel exception, and an audit is never
  dispatched in parallel with implementation.
- **Parent-context disqualifier.** A session spawned inside the parent
  Orchestrator's conversation, or inheriting its conversation history or
  reasoning, is not a fresh session and cannot provide independent acceptance
  ([RF-05](../../AP.md#rf-05-freshcurrent-routing-and-independent-acceptance)).
  The vendor-neutral functional test: the spawned session receives only the
  issued prompt text as initial context, holds no parent transcript, and
  returns its own terminal report. Named runtimes are non-normative. A
  dispatched session that discovers parent-context inheritance stops and
  reports it.
- **Recording unchanged.** The existing `Sub-agents or internal delegation`
  record stays Worker-scoped: it records Worker-initiated delegation only. A
  dispatched Worker records `not-used` unless it delegates internally.
  Orchestrator dispatch is recorded through the existing session target,
  exchange coordinates, Worker session profile, and Cooperator-selected route.
  No new field, record, or coordinate grammar.

## Semantic Ownership and Projections

- `AP.md` alone owns the capability-profile labels, the dispatch-delivery
  semantics, and the parent-context disqualifier (§2, §3, RF-02, RF-05,
  RF-06).
- `AP_ORCHESTRATOR.md` adds an operational section and a decision-table row
  for dispatch and the intuition boundary; it adds no requirement unowned by
  `AP.md`.
- `AP_WORKER.md` adds the ordinary-session and stop-and-report sentences in
  its session-target and independence projections.
- `PROMPT_CONTRACTS.md` adds clarifying sentences at the existing
  `Sub-agents or internal delegation` row and related routing notes; it adds
  no field or record.
- `GLOSSARY.md` carries explanatory entries for the two labels and dispatch.
- This ADR and `CHANGELOG.md` are historical projections.

## Compatibility

The decision is prospective. Historical prompts interpret under their original
AP pins. Read-Only Orchestrators and copy-paste workflows remain fully valid
and unchanged; consumers that never read `INTUITION.md` lose nothing. No
managed block, schema version, executable `ap` behavior, consumer repository,
or Meta path changes. The decision is documentation-first under ADR-0015: it
claims no mechanical prompt or independence validation.

## Consequences

An Orchestrator with a dispatch-capable client can lawfully deliver complete
Worker prompts into fresh sessions when the Cooperator-selected route
authorizes it, without inventing a fourth role or a new record. Opaque
tool-task swarms and parent-context "independent" audits now have explicit
protocol boundaries and stop conditions. Sessions without dispatch capability
are explicitly valid. Proportionate documentation review applies; independent
acceptance of this candidate, publication, consumer adoption, and
logical-whole closure remain separate.

## Relationship to Earlier Decisions

- ADR-0008: this decision refines its session-target and authority-renewal
  model with a delivery mechanism; the target values and renewal contract are
  unchanged.
- ADR-0009: this decision applies its capability/authority separation to the
  Orchestrator side; dispatch capability never expands authority.
- ADR-0011: this decision preserves its risk-routed freshness and independence
  decisions; the disqualifier strengthens them.
- ADR-0013: this decision follows the semantic-owner registry; the invariants
  live only in `AP.md` with deliberate projections.
- ADR-0015: this decision is documentation-first; no conformance suite,
  validator, or test mechanism is added.
- ADR-0017: this decision reuses its compact-grant and delivery-record
  disciplines; dispatch rides existing routing and delivery records.
- ADR-0018: this decision applies its route-binding lesson: the
  Cooperator-selected route, not ambient tool availability, authorizes
  dispatch.

## Rejected Alternatives

- **A new RF family or fourth persistent role**: rejected; the labels describe
  one ORCHESTRATOR role and existing rule families already own the semantics.
- **Advisory-only with no `AP.md` change**: rejected; the parent-context
  disqualifier and dispatch-delivery rule are normative boundaries, not
  optional advice.
- **Vendor-required dispatch runtime**: rejected; AP stays vendor-neutral and
  the functional test is stated in vendor-neutral terms.
- **Executable prompt or independence validator**: rejected; prompt delivery
  and independence are not mechanically enforceable by `ap`.
- **Per-spawn microapproval**: rejected; authorization belongs to the
  Cooperator-selected route or accepted plan, matching bounded-envelope
  precedent.
- **Treating worktree or process isolation as independence**: rejected;
  isolation is a containment dimension, never proof of a fresh session.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../GLOSSARY.md](../../GLOSSARY.md)
- [0008-worker-session-target-and-authority-renewal.md](0008-worker-session-target-and-authority-renewal.md)
- [0009-capability-aware-worker-routing-and-execution-gates.md](0009-capability-aware-worker-routing-and-execution-gates.md)
- [0011-risk-routed-planning-and-bounded-closure.md](0011-risk-routed-planning-and-bounded-closure.md)
- [0013-semantic-ownership-and-convergence.md](0013-semantic-ownership-and-convergence.md)
- [0015-monolithic-ap-test-suite-retirement.md](0015-monolithic-ap-test-suite-retirement.md)
- [0017-cooperator-ergonomics-cost-proportional-execution.md](0017-cooperator-ergonomics-cost-proportional-execution.md)
- [0018-consumer-declared-execution-route-binding.md](0018-consumer-declared-execution-route-binding.md)
- [0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md](0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md)
