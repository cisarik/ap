# ADR-0015: Monolithic AP Test-Suite Retirement

Status: Accepted

## Date

2026-08-10

## Context

At immutable baseline
`81dee2c182322ac95999e5d4ee42072b6040e44a`, the live repository tracked a
single monolithic suite at `tests/ap_tool_tests.sh` (mode `100755`, blob
`679d8532a7d5b7af4c0b6d2aee5c014c81298786`). Observed scale: 9,084 lines and
468,520 bytes, approximately 45.9% of tracked lines and 46.9% of tracked bytes.
It was the only tracked path below `tests/`.

The suite mixed runtime checks, documentation and link checks, exact structural
assertions, semantic relationship validators, mutation fixtures, Git and
topology behavior, security contracts, routing and closure rules, and RF-19
trace checks. That combined working surface duplicated live normative,
structural, operational, advisory, and explanatory documents, and imposed
prohibitive context cost on fresh Workers that already have `AP.md` and its
projections as the durable protocol surface.

Earlier ADRs and live projections named the suite as current enforcement,
including suite-enforcement wording in ADR-0010 and the executable-enforcement
claim for the dependency-free shell suite in ADR-0014. Executable `ap` had no
runtime dependency on invoking the suite.

## Decision

The Cooperator decided to delete the live monolithic suite from the AP source
repository. It must not be split, renamed, preserved, compressed, disabled,
archived, regenerated, or replaced inside the live tree in this logical whole.
No replacement AP protocol conformance suite, validator tree, test runner, CI
mechanism, or equivalent enforcement surface is authorized now.

AP protocol evolution returns to documentation-first proportional validation:

- `AP.md` remains the sole live normative semantic owner;
- `ap` remains the executable projection;
- documentation changes use direct semantic review, ownership and projection
  review, exact diff inspection, link and path inspection, bounded repository
  and Git evidence, independent review when risk warrants it, and practical AP
  use;
- observed friction in real AP work is first-class protocol-evolution evidence
  when reconciled with current repository truth;
- tests remain possible evidence for executable behavior in consuming software
  projects; this decision does not claim that ordinary software should be
  developed without tests.

Immutable Git history is preserved. The deleted blob remains available through
prior commits; no history rewrite is authorized. Schema v1, the stable
integration tuple, the managed consumer block, consumer pins, and consuming
repositories remain unchanged by this decision.

Future reconsideration of an AP-repository conformance mechanism requires its
own logical whole after a concrete failure that direct review and practical use
cannot control proportionately, plus an explicit failure model, bounded scope,
context-cost analysis, maintenance owner, and retirement rule.

## Consequences

Live normative, advisory, and explanatory surfaces no longer claim
`tests/ap_tool_tests.sh` or `tests/` as current AP-repository enforcement. The
semantic-owner map no longer projects nonexistent suite fixtures or tests as
live enforcement. Historical changelog entries that truthfully record when
suite capabilities were added remain intact; addition followed by explicit
retirement is the correct history.

This ADR supersedes only the suite-enforcement details in earlier ADRs,
especially ADR-0010 and ADR-0014. It preserves ADR-0010's substantive
defensive-security profile decision and ADR-0014's substantive RF-19
external-trace and Worker-exchange decision. Those ADR bodies are not
rewritten as though the suite never existed.

## Rejected Alternatives

- **Split, archive, or disable the suite in place**: rejected; it keeps the
  duplicate working surface and context cost.
- **Replace with a smaller conformance suite, CI gate, or hidden validator**:
  rejected for this logical whole; no replacement mechanism is active.
- **Weaken consumer, runtime, security, migration, or acceptance testing**:
  rejected; those remain legitimate evidence surfaces outside AP-repository
  protocol-conformance mirroring.
