# ADR-0016: Universal Continuation and Upgrade-Ledger Storage

Status: Accepted

## Date

2026-08-14

## Context

AP already made repository truth, durable decisions, restoration precedence,
Worker authority expiry, and RF-09 observation states normative. The remaining
continuation gap was narrower than a new handoff or memory architecture: after
a pause or minimal resume seed, the required Orchestrator handbook did not
offer one early named route from read-only restoration to Cooperator selection
of the next bounded logical whole.

RF-09 also defined a complete active/terminal lifecycle without specifying an
optional durable storage projection. Projects that need observations to survive
session rotation require deterministic discovery, canonical-target identity,
staleness handling, public-safety, and terminal reconciliation. That need does
not justify a mandatory file, global filename, parser, roadmap, task queue, or
second semantic owner.

Repeated repository-grounded planning provided a further narrow completion
failure: an otherwise healthy planning exchange can freeze a decision-complete
client-native planner artifact yet omit AP's separately required terminal
Worker report. Treating the artifact as the report would weaken exchange and
authority expiry; restarting planning would spend another cycle without a new
decision.

The broader framing—new continuation document, managed-block migration,
runtime schema, consumer mutation, or external trace as operational state—was
not supported by these gaps.

## Decision

Adopt disposition B: extend existing AP projections. [AP.md](../../AP.md)
remains the sole live semantic owner. No new RF family or continuation file is
introduced.

Continuation uses two stages under existing restoration and authority rules:

1. restore and reconcile read-only from root project rules, the governing AP
   pin, canonical repository/current external truth, accepted durable
   decisions, and then subordinate optional trace or narrative evidence; and
2. present restored state, active observations, uncertainty, and one
   evidence-backed recommendation so the Cooperator selects exactly one
   bounded next logical whole or requests more evidence before any mutation
   authority is issued.

The already-required
[Orchestrator handbook](../../AP_ORCHESTRATOR.md#continuation-bootstrap)
provides the early named operational checklist and a non-normative minimal
seed. A seed, handout, planner artifact, stale grant, ledger, trace, previous
prompt, or conversational memory never grants current authority.

Extend RF-09 with an optional consumer-owned storage projection. Project-owned
root `AGENTS.md` text outside the unchanged AP-managed block explicitly
declares one committed Markdown ledger for one exact canonical target. Multiple
targets use multiple declaration blocks and files. The consuming project's
durable rules establish the target identity; declaration and header repeat it
byte-for-byte. There is no fixed filename, scan fallback, presentation-ordinal
identity, or new canonicalization algorithm.

The [structural contract](../../PROMPT_CONTRACTS.md#upgrade-observation-ledger-contract)
owns exact declaration, header, entry, path, allowed-value, and malformed-state
spellings. The file retains only active `untriaged`, `accepted`, and `parked`
observations. It is public-safe, non-authorizing discovery evidence, not a
roadmap, issue tracker, current-task file, Worker registry, transcript, memory,
specification, ADR, project-rule substitute, or second owner. Observation and
revalidation evidence remain explicit; stale entries are revalidated against
current truth, and contradiction invalidates them with durable evidence.

Terminal `implemented`, `rejected`, `duplicate`, and `invalidated` entries are
removed from the live file only after immutable provenance is named. Git
history and the promoted durable owner preserve history; no second growing
archive is created. Absence of a declaration preserves existing behavior and
makes no claim about observations elsewhere. Malformed declared storage remains
non-authorizing and prevents completed ledger reconciliation or mutation
authority that relies on it, while unrelated read-only restoration may
continue.

A frozen decision-complete planner artifact without a separate terminal report
is a structurally incomplete planning exchange, not planning PASS. The
Orchestrator may issue the same healthy session a complete next exchange with
the next exchange ordinal, `Native planning mode: not-used`, the frozen
artifact as continuity anchor, and report-rendering-only authority. The repair
renders the report prospectively. It does not overwrite the earlier exchange,
alter or reopen planning, consume another planning cycle, implement, mutate,
accept, publish, or close. Native mode remains routing metadata and never
implementation authority.

## Semantic Ownership and Projections

- `AP.md` alone owns live continuation, RF-09 storage/lifecycle meaning, and
  planner-report completion semantics.
- `PROMPT_CONTRACTS.md` structurally owns exact ledger and repair spellings.
- `AP_ORCHESTRATOR.md`, `ARTIFACT_LIFECYCLE.md`, and `INTEGRATION.md` are
  operational projections.
- `PROMPT_ENGINEERING_PATTERNS.md` extends only advisory P11.
- `README.md`, `FAQ.md`, and `GLOSSARY.md` are explanatory projections.
- this ADR and `CHANGELOG.md` are historical projections.

`AP_WORKER.md` remains unchanged because its terminal-report and authority
rules are sufficient; duplicating the new route there would create another
operational owner.

## Consequences

A fresh or resumed Orchestrator has one discoverable, vendor-neutral route from
verified current state to a Cooperator-selected next whole. Projects may retain
active upgrade observations durably without turning them into work authority or
forcing storage on every consumer. Stable identities, explicit revalidation,
safe malformed handling, promotion, and terminal removal keep the live ledger
small and trustworthy without destroying provenance.

The narrow planning repair preserves a frozen artifact and AP's standard report
boundary without manufacturing an extra planning cycle or execution grant.
Structural examples can link to one contract rather than recopying field
spellings into handouts.

Documentation-first proportional validation under ADR-0015 applies. This
decision adds no parser, validator, conformance suite, runtime, or consumer
migration.

## Rejected Alternatives

- **`CONTINUATION.md`, `MEMORY.md`, BOOT/NEXT, or another session-state file**:
  rejected because the existing required-reading path can expose the bootstrap
  and durable project truth already owns continuation state.
- **Managed-block pointer or consumer re-init migration**: rejected because the
  existing block already requires the Orchestrator handbook and optional
  project rules belong outside it.
- **YAML, JSON, TOML, front matter, schema file, CLI/schema change,
  `extension.*.*`, parser, validator, executable check, or replacement suite**:
  rejected because the projection is line-oriented documentation and current
  evidence does not justify runtime semantics.
- **Fixed `AP_UPGRADE_LEDGER.md`, AP-specific root location, or mandatory
  filename**: rejected because targets and project layouts vary and discovery
  is explicitly declared.
- **Global `owner/name` target normalization**: rejected because consuming
  project rules already own canonical repository identity.
- **AP-wide entry-ID regular expression or presentation ordinal identity**:
  rejected because stable opaque public-safe identifiers and per-ledger
  uniqueness are sufficient.
- **Ledger as roadmap, issue tracker, current-task/NEXT file, archive,
  transcript, specification, ADR, or project-rule owner**: rejected because it
  would duplicate established durable owners and risk granting implied work.
- **Meta or another trace as runtime, discovery, or authority source**:
  rejected because optional historical evidence remains subordinate to AP and
  current repository truth.
- **FrameNest adoption, AP pin update, or other consumer mutation in this
  decision**: rejected as a separate logical whole requiring its own authority
  and evidence.
- **Treat the planner artifact as the terminal report, reopen planning, or
  authorize implementation through report repair**: rejected because each
  weakens the standard exchange and Plan-to-Execution boundary.

## Compatibility and Migration

Existing consumers remain byte-unchanged and governed by their current AP pins
until a separate explicit update. After that update, durable ledger storage is
still optional and requires a separate project-local declaration and file
adoption. No declaration preserves prior behavior.

The managed `AGENTS.md` block, `ap` CLI, schema v1, `ap.project.conf`, tests,
stable integration tuple, provider behavior, deployment, production, Meta, and
FrameNest are unchanged. A future executable ledger-shape check or consumer
adoption is a separate decision and task.

## Related Documents

- [RF-09 semantic owner](../../AP.md#rf-09-upgrade-ledger-lifecycle)
- [Continuation semantic owner](../../AP.md#continuation-bootstrap)
- [Structural ledger contract](../../PROMPT_CONTRACTS.md#upgrade-observation-ledger-contract)
- [Structural report-repair contract](../../PROMPT_CONTRACTS.md#planner-artifact-report-completion-repair)
- [Orchestrator continuation entry point](../../AP_ORCHESTRATOR.md#continuation-bootstrap)
- [Lifecycle projection](../../ARTIFACT_LIFECYCLE.md#upgrade-observation-ledgers)
- [Integration projection](../../INTEGRATION.md#optional-consumer-upgrade-ledger)
