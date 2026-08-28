# ADR-0022: Default Agent Dispatch, Trace Companion Integrity, and Pin-Time Presentation Hook

Status: Accepted

## Date

2026-08-28

## Context

Field testing of AP with an Agent Orchestrator client exposed three concrete
friction points and near-misses:

1. **Observation A (Dispatch Default & Courier Friction):**
   ADR-0019 introduced Agent Orchestrator capability profiles and subagent
   dispatch but stated that "the default stays not-used." When an Orchestrator's
   client functionally exposes direct session-dispatch capabilities, defaulting
   to "not-used" imposed unnecessary copy-paste courier labor on the Cooperator
   for ordinary tasks, contrary to the Cooperator ergonomics principles of
   ADR-0017. A clear default to direct dispatch for Agent Orchestrators is
   needed, alongside a lawful model-opt-out route (under P14 model rotation)
   when the Cooperator chooses to rotate models or act as manual messenger.
2. **Observation B (Trace Companion Integrity & Courier Archival Error):**
   In exchange 01 of the field test, an issued prompt was duplicated into the
   trace destination under the name `01_report_00.md` instead of the actual
   terminal Worker report. Because trace archival was mediated by manual
   ferrying rather than direct Orchestrator archival upon dispatch return, the
   trace became invalid. A strict Companion Integrity Invariant is required: a
   report companion must be a valid terminal report (or authorized
   interruption) and must never be byte-identical to or a duplicate of the
   issued prompt. Furthermore, when dispatch is used, the Orchestrator must
   directly archive the prompt and outcome pair upon report return.
3. **Observation C (Pin-Time Presentation Discoverability):**
   Consuming projects such as FrameNest lacked optional presentation profile
   declarations in root `AGENTS.md` because `INTUITION.md` is reference-on-demand
   and not on the minimum reading spine. To make optional presentation
   profiles, development envelopes, and upgrade ledgers discoverable during
   submodule pin updates without relying on out-of-spine reading, an explicit
   review item belongs in `UPDATING.md`'s Review Checklist, supported by a
   ready-to-use non-normative example in `INTEGRATION.md`.

## Decision

Keep [AP.md](../../AP.md) as the sole live semantic owner. Record three
coordinated improvements across `AP.md` and its structural and operational
projections; add no fourth role, no emoji-as-AP-field, no mechanical doctor
validators, and no consumer managed-block changes.

### 1. Agent Orchestrator Default Dispatch & Model Opt-Out (P14)

- **Default dispatch for Agent Orchestrators:** An Agent Orchestrator (an
  Orchestrator instance whose client functionally exposes session-dispatch or
  tool-routing capabilities) defaults to dispatching one complete authoritative
  Worker prompt into one concrete Worker session, unless the Cooperator
  explicitly opts out.
- **P14 Model-Opt-Out exception:** When the Cooperator explicitly opts out of
  direct dispatch — specifically to rotate to another model family, another
  client, or to act manually as the messenger
  ([P14](../../PROMPT_ENGINEERING_PATTERNS.md#p14--model-rotation-and-evidence-equivalence)) —
  copy-paste prompt delivery is the lawful selected route, not a protocol
  failure.
- **Parent-Context Disqualifier preserved:** A session spawned inside the
  parent Orchestrator's conversation, or inheriting its conversation history or
  reasoning, is not a fresh session and cannot provide independent acceptance
  ([RF-05](../../AP.md#rf-05-freshcurrent-routing-and-independent-acceptance)).
  Default dispatch applies to ordinary non-independent Worker sessions.
- **Authority boundary:** Dispatch capability remains a delivery mechanism and
  never expands task authority
  ([RF-06](../../AP.md#rf-06-capability-reasoning-permission-containment-and-authority)).

### 2. Direct Trace Archival & Companion Integrity Invariant

- **Direct Orchestrator archival:** Trace archival is owned exclusively by the
  Orchestrator after the outcome exists
  ([RF-19](../../AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity)).
  When default dispatch is used, the Orchestrator receives the terminal report
  directly in-session and must archive the exact prompt and actual outcome pair
  together into the activated trace destination without imposing courier or
  archivist labor on the Cooperator.
- **Companion Integrity Invariant:** An archived companion named
  `*_report_*.md` (or `NN_report.md` / `NN_report_XX.md`) must be a valid
  terminal report (commencing with `### Report for ORCHESTRATOR_CHAT` and
  containing the compact core) or an authorized interruption companion, and
  must **never** be byte-identical to or a duplicate of the issued prompt. An
  archived companion identical to the prompt is invalid and must be rejected
  before reconciliation or closure.
- **Manual ferry reconciliation:** In the P14 opt-out case (copy-paste), the
  Cooperator ferries the report back, and the Orchestrator reconciles and
  archives the pair, verifying companion integrity and rejecting any duplicate
  prompt masquerading as a report.
- **Worker boundary:** The Worker remains strictly prohibited from
  self-archiving or granting itself trace writes.

### 3. Pin-Time Discoverability Hook in `UPDATING.md`

- **Update Checklist hook:** Add an explicit review item to `UPDATING.md`'s
  Review Checklist instructing Orchestrators performing pin updates to verify
  or refresh optional project-owned declarations in `AGENTS.md` outside the
  managed block (such as a Cooperator presentation profile, development
  envelope, or upgrade ledger per `INTEGRATION.md`).
- **Illustrative presentation capsule:** Provide a ready-to-use non-normative
  project-owned presentation capsule in `INTEGRATION.md` illustrating status
  marks (🟢🟡🔴), delivery capsule, and natural-language separation (e.g.
  Slovak for chat, English for prompts/code), clearly labelled as not AP
  semantics.
- **Continuation Bootstrap discovery:** Note discovering optional project-owned
  presentation declarations alongside upgrade ledgers in root `AGENTS.md`
  outside the managed block during Stage 1 of Continuation Bootstrap.

### 4. Orchestrator Initialization Signal in Restoration Handouts

- **Explicit profile directive:** When generating a restoration prompt or
  handout for a successor Orchestrator instance, the Orchestrator must declare
  the target capability profile (`Capability profile: Agent Orchestrator | Read-Only Orchestrator`)
  and emit an explicit **Orchestrator initialization signal** in the metadata
  and Cooperator presentation.
- **No initialization guessing:** This signal clearly informs the Cooperator
  whether to initialize a session with session-dispatch/subagent capabilities
  enabled (Agent Orchestrator) or an interactive read-only / messenger
  session (Read-Only Orchestrator).
- **Trace filename convention:** The trace filename convention explicitly
  reflects this directive: `00_handout_agent.md` for Agent Orchestrator and
  `00_handout_readonly.md` for Read-Only Orchestrator (`00_handout.md` remains
  the generic baseline alias).

## Semantic Ownership and Projections

- `AP.md` alone owns the dispatch default (§3, RF-02), the parent-context
  disqualifier (RF-05), the dispatch-capability authority boundary (RF-06), the
  companion integrity invariant (RF-19), and trace archival duties (RF-02,
  RF-19).
- `AP_ORCHESTRATOR.md` projects operational default dispatch, direct trace
  archival upon dispatch completion, companion-integrity checking, and
  Continuation Bootstrap declaration discovery.
- `AP_WORKER.md` reaffirms ordinary Worker session semantics under dispatch and
  Worker non-archival.
- `PROMPT_CONTRACTS.md` projects companion integrity in the standard exchange
  and delivery records, and records P14 opt-out routing in the session-and-mode
  contract.
- `PROMPT_ENGINEERING_PATTERNS.md` adapts P14 for manual messenger model
  rotation and dispatch opt-out.
- `INTEGRATION.md` carries the non-normative project-owned presentation capsule
  example.
- `UPDATING.md` carries the pin-time review checklist item.
- `INTUITION.md` aligns its quick-rules with default dispatch, P14 opt-out, and
  companion integrity.
- `GLOSSARY.md` aligns explanatory entries for Agent Orchestrator, Subagent
  dispatch, and the Companion Integrity Invariant.
- This ADR and `CHANGELOG.md` are historical delivery projections.

## Compatibility

The decision is prospective. Historical prompts and pins interpret under their
original AP pins. Read-Only Orchestrators and manual copy-paste workflows
remain fully valid under P14 opt-out. No executable `ap` behavior, schema
version, or managed-block changes are introduced. The decision is
documentation-first under ADR-0015.

## Consequences

Agent Orchestrators default to seamless prompt dispatch and direct trace
archival, eliminating courier friction for the Cooperator. Trace companion
integrity is strictly guarded against duplicate prompt archiving. Consuming
projects discover optional presentation profiles during pin updates via the
`UPDATING.md` checklist rather than missing them due to out-of-spine reference.

## Rule Detectability and Detection Surfaces

Per [ADR-0021](0021-followable-spine-and-restatement-conversion.md), the
normative rules added or revised by this decision are classified below:

| Rule | Detection surface | Class | Notes |
|---|---|---|---|
| Agent Orchestrator default dispatch | Orchestrator chat / trace notes | Behavioral-normative (Class 2) with trace artifacts (Class 1) | Violation visible if an agent-capable Orchestrator demands copy-paste without P14 opt-out |
| Companion Integrity Invariant | Trace directory / Git commit (`*_report_*.md` vs prompt) | Artifact-detectable (Class 1) | Violation visible if report companion is byte-identical to prompt or lacks report header |
| Direct Orchestrator trace archival | Trace commit author / timing / chat interaction | Behavioral-normative (Class 2) | Violation visible if Orchestrator asks Cooperator to archive after dispatch |
| Pin-time presentation review | `UPDATING.md` Review Checklist in consumer commits | Artifact-detectable (Class 1) / Behavioral-normative (Class 2) | Visible in consumer `AGENTS.md` and pin-update review steps |

## Relationship to Earlier Decisions

- ADR-0014 / RF-19: Trace coordinates and prompt/outcome pair archival;
  ADR-0022 adds the Companion Integrity Invariant and direct Orchestrator
  archival for dispatch.
- ADR-0017: Cooperator ergonomics and presentation profiles; ADR-0022 makes
  presentation discoverable at pin time and removes courier toil.
- ADR-0019: Subagent delivery and capability profiles; ADR-0022 sets the
  default for Agent Orchestrators to dispatch while retaining the P14 opt-out
  and parent-context disqualifier.
- ADR-0020: Intuition boundary; ADR-0022 preserves Orchestrator-direct bounds
  for trace staging and archival.
- ADR-0021: Reading spine and detectability classes; ADR-0022 anchors
  discoverability in the spine-governed update checklist and names detection
  surfaces for all new rules.

## Rejected Alternatives

- **Fourth persistent role (e.g. DISPATCHER or AGENT)**: Rejected; Agent
  Orchestrator remains a capability profile of the ORCHESTRATOR role.
- **Emoji status marks as universal AP fields**: Rejected; emoji and localized
  capsules remain project-owned presentation outside universal AP semantics.
- **Automatic doctor check parsing prompt prose**: Rejected; prompt delivery
  and presentation prose are operational and normative, not mechanically
  checked by `ap doctor` (ADR-0015).
- **Parent-context subagent as independent audit**: Rejected; parent reasoning
  inheritance strictly invalidates fresh independence under RF-05.
- **Mandatory presentation profile in `ap init`**: Rejected; `ap init` strictly
  manages the canonical integration block; project-owned text outside the block
  must not be templated or overwritten by CLI automation.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../PROMPT_ENGINEERING_PATTERNS.md](../../PROMPT_ENGINEERING_PATTERNS.md)
- [../../INTEGRATION.md](../../INTEGRATION.md)
- [../../UPDATING.md](../../UPDATING.md)
- [../../INTUITION.md](../../INTUITION.md)
- [../../GLOSSARY.md](../../GLOSSARY.md)
- [0014-external-analytic-trace-and-worker-exchange-identity.md](0014-external-analytic-trace-and-worker-exchange-identity.md)
- [0017-cooperator-ergonomics-cost-proportional-execution.md](0017-cooperator-ergonomics-cost-proportional-execution.md)
- [0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md](0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md)
- [0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md](0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md)
- [0021-followable-spine-and-restatement-conversion.md](0021-followable-spine-and-restatement-conversion.md)
