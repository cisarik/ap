# ADR-0014: External Analytic Trace and Worker Exchange Identity

## Status

Historical projection of the unchanged RF-19 decision. The decision originated
as an implementation-candidate decision record at
`f117457a1e346278ad3fe6c22c3ab57db2217374`, was later corrected to exact tip
`81dee2c182322ac95999e5d4ee42072b6040e44a`, received fresh independent
acceptance for that exact candidate, and was published at that exact corrected
tip. Acceptance, publication, and ORCHESTRATOR logical-whole closure remain
distinct lifecycle events; closure is recorded only on the basis of the durable
successor-handout ORCHESTRATOR closure record. This convergence changes
lifecycle status, not decision content. `AP.md` remains the sole live normative
semantic owner.

## Context

Repeated routing across planning, implementation, correction, and independent
acceptance exposed a missing identity layer. Fresh/current targeting described
where a prompt should go, but durable evidence could not always distinguish one
concrete Worker session from another or multiple renewed authority exchanges in
the same session. Restoring state could therefore depend too heavily on private
memory or conversational continuity.

An earlier self-hosting route also showed that placing an externally delivered
implementation prompt inside a mutation-gated worktree before its outcome
exists can make the launch itself dirty and block the authorized work. A side
archive may preserve useful history, but universal protocol semantics cannot
depend on that archive, one storage system, or one implementation identity.

## Decision

[RF-19](../../AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity)
adds three AP-native coordinates to every newly issued authoritative Worker
prompt and echoed terminal report: stable logical-whole identity, two-digit
Worker-session ordinal, and two-digit Worker-exchange ordinal. Current-session
renewal preserves the whole/session coordinates and increments exchange; a
fresh session advances session and resets exchange; a changed objective resets
both under a new logical-whole identity. Coordinates record routing but grant
no authority and do not prove independence.

AP also defines an explicitly activated external analytic-development trace as
optional, subordinate historical evidence. It records a selective causal chain
rather than a raw transcript and is public-safe by default when public. It is
not task, Git, provider, acceptance, publication, deployment, production, or
closure authority and is not required for ordinary AP correctness.

The standard interoperable Markdown/Git projection uses unsuffixed filenames
for exchange `01` and `_02` onward for later exchanges. Each exchange has one
prompt and one mutually exclusive report or interruption companion. An exact
prompt/report pair is first archived atomically after the report exists; in Git
both have the same unique first-add commit. A prompt remains outside a
mutation-gated worktree until then unless another authorized workflow owns a
safe staging location.

Interruption companions never impersonate a Worker. Late or contradictory
reports, corrections, redactions, and supersession are reconciled
prospectively without silent replacement or history rewriting. Historical
artifacts remain governed by their original immutable AP pin.

Fresh restoration proceeds from immutable AP, current project and external
truth, and accepted durable decisions before optional trace evidence and
tentative narrative. Accepted meaning is promoted to its live canonical owner;
the trace remains historical.

## Semantic Ownership and Projections

`AP.md` is the sole semantic owner. `PROMPT_CONTRACTS.md` structurally owns
exact coordinate, activation-record, and Markdown/Git grammar spellings.
`AP_ORCHESTRATOR.md`, `AP_WORKER.md`, and `ARTIFACT_LIFECYCLE.md` operationalize
routing, archival, reconciliation, promotion, and cleanup. README, FAQ, and the
glossary are explanatory projections. This ADR and the changelog are historical
projections. The dependency-free shell suite is executable enforcement. A
concrete trace owns only its local layout and validation under AP precedence.

## Consequences

Prompts and outcomes gain stable vendor-neutral coordinates, repeated grants to
one healthy session remain explicit, and independent acceptance has a distinct
fresh-session coordinate without treating freshness as proof. Optional traces
can preserve useful causal history while current repositories and durable
owners remain authoritative. Atomic after-outcome archival prevents the normal
trace route from blocking its own mutation-gated task.

Orchestrators must allocate contiguous ordinals and reconcile exceptional
outcomes. Workers must validate and echo coordinates. Activated archive owners
must preserve public-safety, provenance, and lifecycle boundaries. Historical
material is not retroactively renamed or validated.

## Rejected Alternatives

- **Meta-only semantics**: rejected because universal AP meaning belongs in the
  canonical protocol, not a particular historical trace repository.
- **Raw transcripts or hidden reasoning archives**: rejected for privacy,
  signal, authority, and lifecycle reasons.
- **Mandatory external service or database**: rejected because AP correctness
  must remain vendor-neutral and work without a side system.
- **Fresh Worker after every report**: rejected because healthy same-session
  renewal preserves useful repository understanding when independence is not
  required.
- **Archive as authority**: rejected because historical evidence cannot grant
  task, acceptance, publication, or closure status.
- **Pre-archiving prompts in mutation-gated worktrees**: rejected because the
  launch artifact can invalidate its own clean-baseline gate.
- **Hardcoded project, vendor, model, provider, or client identity**: rejected
  because universal coordinates and trace semantics must be portable.

## Compatibility and Migration

The decision is prospective. Historical prompts, reports, and bootstrap
artifacts remain interpretable under their governing immutable AP pin and are
not renamed, renumbered, squashed, or retroactively rejected. Existing
consumers remain on their current gitlinks until a separate update task.
Projects may activate a conforming trace through project/task rules, but no
trace migration is required.

The `ap` CLI, schema v1 project contract, managed consumer block, stable variant
selection, integration workflow, and consumer pins are unchanged. Concrete
trace directory layouts and validators are separate project decisions after an
accepted governing AP identity exists.

## Related Documents

- [RF-19 semantic owner](../../AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity)
- [Prompt structural projection](../../PROMPT_CONTRACTS.md#worker-exchange-identity-and-external-trace-contract)
- [Orchestrator operational projection](../../AP_ORCHESTRATOR.md#worker-exchange-coordinates-and-optional-trace)
- [Worker operational projection](../../AP_WORKER.md#worker-exchange-coordinates-and-trace-boundary)
- [Artifact lifecycle projection](../../ARTIFACT_LIFECYCLE.md#external-analytic-development-trace)
