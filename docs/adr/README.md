# Architecture Decision Records

This directory contains accepted architecture decisions for Analytic
Programming.

## Status Meanings

| Status | Meaning |
|---|---|
| Accepted | Current durable decision |
| Implementation candidate | Accepted rationale in a local candidate; no public acceptance, publication, or closure claim |
| Superseded | Replaced by a later ADR; preserved only when still useful in the live tree |

## Index

| ADR | Title | Status | Relationship |
|---|---|---|---|
| [0004](0004-fresh-slice-diagnostic-lifecycle.md) | Fresh-slice implementation and diagnostic closeout lifecycle | Accepted | Absolute sequential wording partially superseded by ADR-0009; sequential independent audit retained |
| [0005](0005-single-live-protocol-and-pinned-submodule-distribution.md) | Single live protocol and pinned submodule distribution | Accepted | Unchanged |
| [0006](0006-adaptive-orchestration-and-preflight-lifecycle.md) | Adaptive orchestration and preflight lifecycle | Accepted | Unchanged |
| [0007](0007-worker-session-evidence-and-restoration-lifecycle.md) | Worker session evidence and restoration lifecycle | Accepted | Absolute sequential wording partially superseded by ADR-0009; evidence and restoration decisions retained |
| [0008](0008-worker-session-target-and-authority-renewal.md) | Worker session target and authority renewal | Accepted | Extended by ADR-0009; universal fresh-default wording prospectively refined by ADR-0011 |
| [0009](0009-capability-aware-worker-routing-and-execution-gates.md) | Capability-aware Worker routing and execution gates | Accepted | Routing and execution gates retained; planning, freshness, and closure refined by ADR-0011 |
| [0010](0010-defensive-security-profile.md) | Defensive-security profile and finding contract | Accepted | Advisory INFOSEC.md profile with a small normative AP.md anchor; suite-enforcement detail superseded by ADR-0015; substantive defensive-security decision retained |
| [0011](0011-risk-routed-planning-and-bounded-closure.md) | Risk-routed planning and bounded closure | Accepted | Current planning, freshness, evidence-tier, anti-stall, authority-envelope, operational-evidence, and human-governance decision |
| [0012](0012-baseline-bound-project-execution.md) | Baseline-bound project execution envelope | Accepted | Adds the project contract, sanitized direct execution, and CPython provenance boundary without changing protocol authority |
| [0013](0013-semantic-ownership-and-convergence.md) | Semantic ownership and finite convergence | Accepted | Establishes the semantic-owner registry, projection taxonomy, structural-field ownership, and bounded convergence contract |
| [0014](0014-external-analytic-trace-and-worker-exchange-identity.md) | External analytic trace and Worker exchange identity | Accepted | Originated as an implementation candidate at `f117457a1e346278ad3fe6c22c3ab57db2217374`; the unchanged RF-19 decision was later independently accepted and published at corrected tip `81dee2c182322ac95999e5d4ee42072b6040e44a`; ORCHESTRATOR logical-whole closure recorded separately by the successor-handout closure record; suite-enforcement detail superseded by ADR-0015 only; AP.md remains the sole live semantic owner |
| [0015](0015-monolithic-ap-test-suite-retirement.md) | Monolithic AP test-suite retirement | Accepted | Deletes the live monolithic suite; documentation-first proportional validation; supersedes suite-enforcement details in ADR-0010 and ADR-0014 only |
| [0016](0016-universal-continuation-and-upgrade-ledger-storage.md) | Universal continuation and upgrade-ledger storage | Accepted | Adds the two-stage continuation bootstrap, optional consumer-owned RF-09 storage projection, and bounded planner-report completion repair; AP.md remains the sole live semantic owner |
| [0017](0017-cooperator-ergonomics-cost-proportional-execution.md) | Cooperator ergonomics and cost-proportional execution | Accepted | Extends existing RF families with compact Worker grants, activatable ladder/loop/envelope/delivery records, and project-owned Cooperator presentation; AP.md remains the sole live semantic owner |
| [0018](0018-consumer-declared-execution-route-binding.md) | Consumer-declared execution route and capability-gate binding | Accepted | Extends RF-06/RF-16 so an applicable consumer-declared route is resolved before prompt issuance, made canonical, protected from silent ambient parallel routes, and deviated from only through explicit bounded authority |
| [0019](0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md) | Subagent delivery of Worker sessions and Orchestrator capability profiles | Implementation candidate | Historical rationale for Agent/Read-Only capability-profile labels of one ORCHESTRATOR role, dispatch as one complete Worker prompt into one concrete session, and the parent-context independent-audit disqualifier; publication and independent acceptance remain separate |
| [0020](0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md) | Intuitive mode, the Orchestrator intuition boundary, and the intuition projection | Implementation candidate | Historical rationale for the RF-02 Orchestrator-direct/Worker-required boundary, dense grants by citation, the brief optional `INTUITION.md` projection, and opt-in signaling; publication and independent acceptance remain separate |

ADR-0009 permits only an explicit bounded parallel exception. It does not
supersede fresh sequential independent audit or the remaining decisions in
ADR-0004 and ADR-0007. Their bodies remain unchanged historical decisions.

ADR-0010 adds an advisory defensive-security profile. It does not supersede
ADR-0009 or make the profile normative; `AP.md` remains the sole live
normative protocol. ADR-0015 supersedes only its suite-enforcement detail.

ADR-0011 prospectively replaces the universal fresh-default bias and extends
ADR-0009's Plan-to-Execution gate. It preserves current-session authority
renewal, fresh sequential independent audit, the bounded parallel exception,
and the stricter activated `INFOSEC.md` rules.

ADR-0013 consolidates current semantic ownership in `AP.md` and classifies all
other live artifacts as projections or enforcement. It refines planning and
acceptance budgets without changing the roles, stable variant tuple, executable
runtime, or earlier ADR bodies.

ADR-0014 records the historical rationale for the unchanged RF-19
logical-whole/session/exchange coordinates and an optional subordinate external
trace. It originated as an implementation candidate and was later
independently accepted and published at corrected tip
`81dee2c182322ac95999e5d4ee42072b6040e44a`; ORCHESTRATOR logical-whole closure
is recorded separately on the basis of the successor-handout closure record.
Its live meaning is owned only by
[RF-19](../../AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity);
`AP.md` remains the sole semantic owner and this ADR remains a historical
projection. ADR-0015 supersedes only its suite-enforcement detail.

ADR-0015 retires the live monolithic AP repository suite, records
documentation-first proportional validation, and leaves no replacement
conformance mechanism active. It does not weaken consumer or software testing
evidence, alter executable `ap`, or rewrite earlier ADR bodies.

ADR-0016 records an accepted decision. It extends RF-09
and existing restoration/report-completion rules without adding a rule family,
runtime, schema, managed-block migration, fixed ledger filename, consumer
adoption, or new semantic owner. Publication and logical-whole closure remain separate.

ADR-0017 records an accepted decision. It extends existing RF families
so an Orchestrator can emit a compact cost-proportional Worker grant plus a
project-owned Cooperator delivery package. It does not add a rule family,
runtime, schema, managed-block migration, Meta grammar, FrameNest envelope, or
new semantic owner. Publication and logical-whole closure remain separate.

ADR-0018 records an accepted decision. It extends RF-06 and RF-16 so an
applicable consumer-declared execution route or project-owned capability gate
is resolved before prompt issuance, made canonical in the authoritative Worker
prompt, protected from silent equivalent-looking ambient parallel routes, and
deviated from only through explicit bounded task-specific authority. It adds no
rule family, record, field, runtime, schema, managed-block migration,
validator, or new semantic owner. Publication, consumer
adoption, and logical-whole closure remain separate.

ADR-0019 and ADR-0020 are recorded as implementation candidates, not public
acceptances. They clarify existing RF-02, RF-05, and RF-06 semantics and add
brief explanatory and advisory projections with no rule family, field, record,
schema, executable surface, or managed-block change. Publication and
independent acceptance of their shared candidate remain separate, as do
consumer adoption and logical-whole closure.

## Lifecycle Rule

Accepted ADRs are not silently rewritten to change their decision. When a
decision changes, create a new ADR that records the new decision and update this
index. Git history preserves removed or superseded records that no longer have
current value in the live tree.
