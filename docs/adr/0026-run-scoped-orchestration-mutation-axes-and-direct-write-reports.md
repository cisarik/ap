# ADR-0026: Run-Scoped Orchestration, Mutation Axes, and Direct-Write Report Persistence

Status: Accepted

Date: 2026-11-08

Artifact relationship: **historical** design rationale; retained evidence for AP
maintainers and consumers, discoverable through the ADR index. [AP.md](../../AP.md)
remains the sole semantic owner and [PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
owns exact structural spellings. Retain this decision with its implementation
history; retirement requires separate explicit lifecycle authority.

## Context

Consumer work measured four recurring frictions against AP
`73e20ef80b88700d5fcbc397cd8edd4fc425869f`:

- capable Workers that could write their own trace report still had it routed
  through the Cooperator, because RF-19 permitted capable persistence but named
  no default;
- read-only prompts forbade the Worker's own granted report write, because
  *read-only* was applied to the whole grant rather than to a mutation domain;
- first exchanges stopped on prompt defects that a pre-delivery comparison
  would have caught, and the lawful continuation of their coordinates and
  planning cycle was unclear; and
- protocol friction observed during ordinary project work was not captured
  unless a task happened to ask for it.

The Cooperator also proposed preparing several candidate logical wholes ahead
of time from one Orchestrator session, with handouts written before each whole
opens.

AP already covered part of this: three persistent roles and access profiles;
RF-19's separation of authorship and persistence and the existing
`Report persistence owner` field; §5 side-effect classes and the Fresh Evidence
Probe's mutation domains; §7's requirement that every action fit the grant;
never-reassigned ordinals; the RF-09 ledger with explicit discovery during
Continuation Stage 1; and §14 handout authorship, predecessors and readiness.
Five live passages still named one specific trace implementation.

Accepted design does not certify this implementation candidate, publication,
consumer adoption, or logical-whole closure.

## Decision

1. **Orchestrator session scope.** An Orchestrator session has one scope,
   `logical-whole` (default) or `development-run`, independent of its access
   profile. *Master Orchestrator* is the explanatory name of a
   `development-run` session. A scope is a routing label: it is not a role,
   grants no authority, and by itself never selects, plans, accepts, or closes
   a whole. A run-scoped session prompts only for a whole it opened as that
   whole's Orchestrator after Cooperator selection, recording the departure
   from the fresh-instance default.
2. **Run map.** A run-scoped session keeps one discovery-only run map per
   development run: objective and exclusions, ordered candidate wholes,
   dependencies, statuses, handout locators, and one evidence sentence per
   entry. Only that session changes run status, from each whole's own
   evidence; the run closes when every entry is closed, superseded, or dropped,
   or when the Cooperator ends it.
3. **Provisional handouts and revalidation.** A handout written before its
   whole opens carries `Handout status: provisional`, states questions,
   evidence, risks, and constraints rather than answers, never satisfies the
   initial-Planner requirement, and is frozen once the whole opens. The whole's
   Orchestrator revalidates every material fact in Continuation Stage 1 and
   records a handout revalidation record before the first Planner prompt. The
   write-ahead horizon is advisory.
4. **Mutation axes.** Every newly issued Worker grant declares repository
   mutation, host/remote mutation, and trace persistence, each `none` or one
   exact bounded scope. *Read-only* qualifies an axis, never a whole grant; a
   Worker's own exact report is trace persistence.
5. **Direct-write default.** When an activated delivery record names a report
   destination and the assigned Worker's client permits that exact write, the
   Worker is the default persister. A relay requires an explicit Cooperator
   selection or a recorded missing capability. A Planner whose native planning
   controls block writes keeps the complete report in the plan output and
   writes it once the client permits, within the same grant.
6. **Prompt satisfiability check.** Before delivery the Orchestrator applies
   four comparisons — validation–authority, routing, persistence, and
   spelling — to the complete prompt. A failure is an issuance defect; a Worker
   that finds one stops and reports it as MEASURED critique. The check is a
   review, not a register or attestation field.
7. **Consumed coordinates.** Coordinates are consumed at issue whatever the
   outcome. A blocked first exchange followed by a fresh session continues at
   `02/01`; a planning exchange blocked before any plan exists consumes no
   planning cycle, so the corrected prompt keeps `Planning cycle: initial` and
   names the blocked report. A new logical-whole identity is lawful only for a
   materially changed objective and is never a coordinate-reset mechanism.
8. **Standing ledger maintenance and neutral trace wording.** When project
   rules declare an upgrade ledger, every Orchestrator revalidates it, records
   newly measured friction during any whole, and a whole that changes the
   ledger's target snapshots every active entry of the declared ledgers
   available to it and disposes of each before closure. Storage stays in the
   consuming repository. The five trace-specific passages now refer to the
   activated trace's own documentation or local grammar.

## Semantic Ownership and Projections

- `AP.md` alone owns the meaning: §3 session scope, §5 mutation axes, §7
  satisfiability check, RF-19 consumed coordinates and direct-write default,
  Planning Budget and Expiry, §13 notes and standing ledger maintenance, §14
  Run-Level Handouts and Continuation Bootstrap, §18 stop, and §19
  anti-patterns. Every new normative rule names an artifact-detectable surface.
- `PROMPT_CONTRACTS.md` structurally owns the Mutation Axes Record, the
  delivery-record consistency rules, the session-scope and run-identity fields,
  the Run Map Record, the Provisional Handout Marker, the Handout Revalidation
  Record, the corrected initial Planning Record, the Blocked First Exchange
  Example, the trace-local mapping line, and the AP Update Task items.
- `AP_ORCHESTRATOR.md`, `AP_WORKER.md`, `ARTIFACT_LIFECYCLE.md`,
  `INTEGRATION.md`, and `UPDATING.md` are operational projections that point to
  those owners.
- `README.md`, `FAQ.md`, `GLOSSARY.md`, and `INTUITION.md` are explanatory
  projections.
- This ADR and `CHANGELOG.md` are historical projections.

`PROMPT_ENGINEERING_PATTERNS.md` and `INFOSEC.md` are unchanged.

## Rejected Alternatives

- **A fourth persistent role** for the run-level Orchestrator: rejected because
  labels and capabilities never create roles.
- **An access-profile value**: rejected because a run-scoped session may hold
  either access profile; one field would conflate observation with scope.
- **"Master" as the structural value**: rejected in favour of
  `development-run`; the name stays explanatory.
- **New `Report author` and `Report persister` fields**: rejected because RF-19
  already fixes authorship to the assigned Worker and the existing
  `Report persistence owner` field names the persister.
- **In-place confirmation of a provisional handout**: rejected because it would
  rewrite evidence; adoption is recorded in the revalidation record and a
  material rewrite is a successor handout.
- **Ledger storage outside the consuming repository**: rejected because it
  would reopen ADR-0016's same-repository discovery and public-safety design.
- **A numeric rolling horizon**: rejected, consistent with AP's rejection of
  numeric thresholds.
- **A new prompt-engineering pattern**: deferred until recurring evidence
  exists; the existing closure, handoff, and restoration patterns cover the
  generation of run-level handouts.
- **A satisfiability attestation field or mechanical checker**: rejected
  because the check is a review of the issued prompt, not a register.

## Partial Supersession

- ADR-0023 decisions 6 and 7 established exact, separately authorized artifact
  persistence and separate authorship and persistence owners without a default
  persister. This ADR adds the direct-write default; the rest of those
  decisions is retained.
- The RF-09 activation snapshot in `AP.md` §13 was "a bounded snapshot of the
  candidate observations under consideration", the lifecycle whose optional
  storage ADR-0016 records. It now includes every active entry of the declared
  ledgers available to the activating whole. ADR-0016's storage, discovery,
  and non-authorizing decisions are retained.

The bodies of ADR-0016, ADR-0023, and every other historical ADR are
unchanged.

## Compatibility and Migration

The change is prospective. Historical prompts, reports, handouts, and filenames
keep their meaning under their governing AP pin; a missing session-scope field
in a historical handout means `logical-whole`, and prompts issued before
adoption need no mutation axes. The executable `ap`, the managed `AGENTS.md`
block, schema v1, and the project contract are unchanged, so consumer `doctor`
compatibility is unaffected. Consumers adopt only through an explicit pin
update, with any consumer file that pins the AP commit moved in the same pin
change.

## Consequences

Capable Workers deliver their own reports without a courier step, and
read-only grants no longer forbid the report they require. Prompt defects are
caught before delivery more often, and a blocked first exchange has one lawful
continuation. Several wholes can be prepared ahead of time without a handout
acting as selection, plan, or authority. Protocol friction is captured as
ordinary work.

Every new grant carries three more lines, every provisional handout costs one
revalidation record, and an active run costs run-map maintenance. Practical
improvement in time, token use, and error rate remains unmeasured until
observed in later wholes.

## Validation

Documentation-first proportional validation under ADR-0015 applies: exact
changed-path and historical-byte checks, Git whitespace checks, an executable
smoke check, link, anchor and heading checks, spelling and neutrality checks,
single-owner review, and a walk-through of the accepted plan's fourteen
positive and negative scenarios. Because the sole normative protocol changes,
fresh independent acceptance of the exact candidate is required; the
implementer's review does not supply it.

## Rollback

Before publication, the candidate is simply not published; discarding a local
commit needs its own grant. After publication, rollback is an ordinary revert
commit under a separate grant, never a force push. A consumer that adopted the
pin rolls back through its own explicit pin task.

## Related Documents

- [Orchestrator session scope](../../AP.md#orchestrator-session-scope)
- [Mutation axes](../../AP.md#mutation-axes)
- [Prompt satisfiability check](../../AP.md#prompt-satisfiability-check)
- [Consumed coordinates](../../AP.md#consumed-coordinates)
- [Direct-write report persistence](../../AP.md#direct-write-report-persistence)
- [Standing ledger maintenance](../../AP.md#standing-ledger-maintenance)
- [Run-Level Handouts](../../AP.md#run-level-handouts)
- [Mutation Axes Record](../../PROMPT_CONTRACTS.md#mutation-axes-record)
- [Run Map Record](../../PROMPT_CONTRACTS.md#run-map-record)
- [Handout Revalidation Record](../../PROMPT_CONTRACTS.md#handout-revalidation-record)
- [ADR-0023](0023-practical-workflow-consolidation.md)
- [ADR-0016](0016-universal-continuation-and-upgrade-ledger-storage.md)
- [ADR-0015](0015-monolithic-ap-test-suite-retirement.md)
