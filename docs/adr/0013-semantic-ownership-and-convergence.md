# ADR-0013: Semantic Ownership and Finite Convergence

Status: Accepted

## Context

AP has one live protocol, but repeated semantic statements across handbooks,
contracts, advisory profiles, public explanations, and validators obscured which
artifact owned a rule. Exact schema spelling in `PROMPT_CONTRACTS.md` also
created a legitimate structural responsibility that needed to be distinguished
from semantic ownership. Existing planning, correction, acceptance,
publication, deployment, and closure rules were coherent but distributed,
making accidental recursion and phase-result conflation harder to reject.

## Decision

`AP.md` remains the sole live normative protocol and canonical semantic owner.
It contains a stable rule-family registry. Every subordinate artifact declares
one or more relationships: structural, operational, advisory, explanatory,
historical, executable, or consumer.

`PROMPT_CONTRACTS.md` owns exact field names, allowed values, and fixture shapes
as a structural projection. `AP.md` owns what they mean. This split preserves
exact compatibility without creating a second semantic protocol.

AP adopts a finite convergence contract:

- one initial implementation-planning cycle and at most one evidence-based
  targeted revision;
- a changed objective starts a new bounded logical whole;
- execution always requires a separate complete Orchestrator prompt;
- one primary fresh acceptance and at most one correction re-acceptance when
  the selected risk route requires independence;
- one smallest coherent correction for a concrete finding, followed by scoped
  or full fresh re-acceptance according to explicit semantic boundaries;
- repeated same-assumption failure escalates with
  `NEEDS_ORCHESTRATOR_DECISION` rather than recursing;
- missing evidence permits only a targeted probe for a named required claim;
  and
- phase/surface gates activate only when the task touches their trigger.

The Cooperator owns material human decisions, objectives, subjective
acceptance, irreversible/public trade-offs, and residual-risk choices. The
ORCHESTRATOR owns the deterministic closure transition after required evidence,
Cooperator-owned decisions, risk disposition, ledger reconciliation, and
no-active-mutation conditions are satisfied. A Worker never closes a logical
whole.

Implementation PASS, Acceptance PASS, Publication PASS, Deployment PASS,
Production acceptance PASS, and ORCHESTRATOR closure remain separately
representable. No phase PASS alone closes a logical whole.

Operational and explanatory documents are compressed into deliberate
role-specific projections with canonical links. The prompt-pattern library
remains first-class universal advisory guidance. INFOSEC remains the activated
advisory security profile under AP precedence, with its activated procedures
unchanged. ADRs and the changelog remain historical rationale and delivery
records.

Relationship validators replace favored-sentence assertions where this change
touches them. Exact-text checks remain appropriate for structural fields,
allowed values, managed blocks, and executable output that is itself the
contract.

## Consequences

Readers can identify one semantic owner for every durable rule family and can
choose a smaller role-appropriate projection. Prompts remain self-contained
because task-specific boundaries and activated annexes are retained. Stable
consumer pins, the managed block, executable behavior, schema v1, and protocol
variant selection do not change.

Compression is measured on the fixed twelve-document comparison set. Lower
word and byte totals are required, but no arbitrary percentage target can
justify semantic loss. Material consolidation is reviewable through an
owner/projection/enforcement ledger.

This decision does not authorize runtime changes, consumer updates,
publication, deployment, a second protocol variant, or changes to earlier ADR
bodies.
