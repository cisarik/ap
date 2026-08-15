# ADR-0017: Cooperator Ergonomics and Cost-Proportional Execution

Status: Implementation candidate

## Date

2026-08-15

## Context

AP already had compact-prompt permission, lowest-sufficient reasoning, evidence
tiers, pre-existing-failure classification, optional external-trace activation,
and project-owned communication routing. Those pieces were dispersed. They did
not require an Orchestrator, without hidden chat context, to emit:

- a project-owned Cooperator presentation package after the copyable,
  structurally English Worker prompt;
- one downloadable authoritative prompt filename;
- the activated-trace archival destination using that trace's local grammar;
- archival wait-for-report versus allow-now;
- a selected validation ladder with a repeated-gate stop;
- declared project tooling or a development envelope by reference; and
- named working-copy topology that is not universally mandatory.

Field evidence showed operational failures that current text did not prevent:
Common Worker Task Fields used as a dump; High or Extra High recommended
without a named missing-evidence trigger; E2 wording "affected full suite"
read as repository-wide suite-always; isolation treated as virtue; canonical
tooling reconstructed or abandoned; and ceremonial extra Workers inside one
healthy whole.

Disposition A (a new RF family, continuation protocol, ledger, BOOT/NEXT file,
memory database, token or currency cap, or Meta-grammar-as-AP) was unnecessary.
Disposition C (no documentation change) cannot deterministically produce the
Cooperator-facing workflow. This ADR records Disposition B.

## Decision

Keep [AP.md](../../AP.md) as the sole live semantic owner. Extend existing RF
families with bounded semantic clarifications. Add four activatable structural
records in [PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md), inactive by
default:

- Validation Ladder;
- Repeated-Gate and Reasoning-Loop Stop;
- Development Envelope Activation (`not-used` | `activated`);
- Cooperator Delivery and Trace Destination.

Presentation profile, development envelope, and optional local-trace grammar
pointer are declared in consuming-project rules outside the managed `AGENTS.md`
block. Absence preserves current behavior. Presentation marks are not task
authority. Local trace filename grammar is storage, not AP meaning; the
interoperable unsuffixed exchange-`01` grammar remains the AP default.

Medium is the default reasoning profile for ordinary bounded work. High needs a
named risk. Extra High is exceptional. Client maximum or enhanced mode is never
inferred and never recommended merely because it is available. A full suite is
not an automatic Worker tax. Working-copy topology is selected with a why;
canonical checkout, isolated worktree, and contained clone are alternatives.

No executable `ap`, schema, managed-block, Meta, or FrameNest mutation is
authorized by this decision. A future FrameNest envelope remains a separate
logical whole.

## Semantic Ownership and Projections

- `AP.md` alone owns RF-02 presentation-emission duty, RF-06 reasoning
  stop/escalation/downgrade, RF-07 selected validation ladder, §5 envelope
  activation, RF-19 destination-versus-authority, compact-catalog, and the
  named anti-patterns.
- `PROMPT_CONTRACTS.md` owns exact record spellings and the trace-local mapping
  example labelled as not AP grammar.
- `AP_ORCHESTRATOR.md`, `AP_WORKER.md`, `ARTIFACT_LIFECYCLE.md`, and
  `INTEGRATION.md` are operational projections.
- `PROMPT_ENGINEERING_PATTERNS.md` extends advisory P04 and P08 and adds
  bounded fixtures.
- `README.md`, `FAQ.md`, and `GLOSSARY.md` are explanatory projections.
- this ADR and `CHANGELOG.md` are historical projections.

## Consequences

An Orchestrator can emit a compact, cost-proportional Worker grant plus a
project-owned Cooperator delivery package from current AP plus optional project
declarations. Existing consumers remain unchanged until they update the AP pin
and optionally declare envelope, presentation, or local-trace grammar.

Documentation-first proportional validation under ADR-0015 applies. Independent
acceptance of this candidate remains a separate fresh Worker. Publication and
logical-whole closure remain separate.

## Rejected Alternatives

- **Disposition C / no change**: rejected because current AP at
  `17b7e085139e9bcbb0e4953d26aef9b6687d541c` cannot deterministically produce
  the Cooperator-facing workflow without hidden chat context.
- **A new RF family, continuation protocol, ledger, BOOT/NEXT file, or memory
  database**: rejected because existing RF families are sufficient.
- **Meta-grammar-as-AP**: rejected because replaceable traces own storage;
  AP keeps the interoperable unsuffixed exchange-`01` default.
- **FrameNest envelope in this whole**: rejected as a separate consumer
  mutation requiring its own authority.
- **Executable validators, conformance suite, CI, or `ap`/schema change**:
  rejected because this is documentation-first protocol evolution.
- **Token, currency, or numerical cost caps**: rejected as vendor-specific
  and as a substitute for evidence.
- **Slovak, emoji, or a particular trace implementation as required AP
  fields**: rejected because presentation and storage remain project-owned.
