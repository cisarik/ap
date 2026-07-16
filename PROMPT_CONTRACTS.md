# Prompt Contracts

This document defines compact structures for AP prompts and reports. It is not a
collection of fixed giant prompts. The Orchestrator generates a task-specific
prompt that matches the repository, risk, and authority of the current work.

## Worker Report Header

Every standard Worker report begins exactly:

```text
### Report for ORCHESTRATOR_CHAT
```

Unless a task requires more detail, the report should include:

1. status: PASS, PARTIAL, or BLOCKED;
2. start and end commit;
3. changed files and purpose;
4. tests and validation;
5. commit and push result when authorized;
6. deviations, risks, or missing evidence;
7. one smallest next step or review request.

Summarize command execution. Include full output only for failures, unexpected
state, safety-critical evidence, or explicit Orchestrator request.

## Common Worker Task Fields

| Field | Purpose |
|---|---|
| Persistent role identity | State that the recipient is a Worker instance assigned to WORKER |
| Worker session target | Mandatory `fresh-worker-session` or `current-worker-session` routing declaration |
| Worker session profile | Fresh Implementation Worker, Worker-Executed Preflight, Fresh Evidence Probe, Diagnostic Worker, Bounded Correction Worker, Fresh Independent Audit, Fresh Independent Re-Audit, or another explicitly defined bounded profile |
| Task identity | Stable task ID, type, and coherent outcome reference |
| Continuity anchor | Required for `current-worker-session`; identifies the previous task, terminal report, accepted commit, or other precise prior authority boundary |
| Reasoning recommendation | Lowest sufficient available reasoning profile and brief rationale for every Worker prompt |
| Communication routing | Project-configured Cooperator-facing language, Worker progress language, Orchestrator-to-Worker prompt language, formal Worker report language, and repository documentation language when relevant |
| Repository identity | URL, branch, accepted URL spellings, expected refs |
| Working directory | Exact path or discovery rule |
| Baseline | Expected commit, parent, subject, changed paths, or empty-state rule |
| Mandatory reading | Project `AGENTS.md`, `.ap/AP.md`, `.ap/AP_WORKER.md`, and task-relevant files |
| Repository gate | Root, remote, branch, status, public ref, and untracked-state checks |
| Goal | One coherent outcome |
| Accepted decisions | Decisions already made by the Cooperator or durable project records |
| Positive authority | Exact allowed paths and permitted command or mutation domains |
| Negative authority | Exact excluded paths, forbidden commands, and prohibited scope |
| Commands | Allowed and forbidden command classes |
| Dependency authority | Install, update, lockfile, and runtime authority |
| Git authority | Exact fetch, stage, commit, push, or read-only rule |
| Network authority | Public verification, provider calls, or no network |
| Secret authority | Whether secret access is allowed; normally none |
| Browser authority | Allowed origins, interactions, storage, screenshots, and cleanup |
| Validation | Required checks and expected evidence |
| Stopping conditions | Conditions that require stopping without improvisation |
| Completion and report contract | Concrete pass conditions, terminal status, required report sections, and header |
| Context-pressure rule | Whether visible usage must be reported |

Omitted permission is not implied.

## Worker Session Target Contract

Every authoritative Worker task prompt declares exactly one:

```text
Worker session target: fresh-worker-session
```

or:

```text
Worker session target: current-worker-session
```

The target identifies the intended execution session into which the prompt must
be delivered. It is distinct from persistent role identity and Worker session
profile. It does not expand authority or establish independence by itself.

Fresh Worker is the safe default. A missing, invalid, or ambiguous target never
authorizes current-session reuse. Route the task to a fresh Worker session or
stop and obtain a corrected prompt.

For `current-worker-session`, the prompt must provide a continuity anchor, state
that prior authority expired, grant complete new bounded authority, explain why
reuse is appropriate, preserve the WORKER role, require repository and
environment re-gating, state that retained context is convenience rather than
authority, classify the evidence as non-independent, stop on conflict with
current repository evidence, and require a new terminal report.

Fresh Independent Audit, Fresh Independent Re-Audit, and independent
certification require `fresh-worker-session`. A prompt combining
`current-worker-session` with independent certification is invalid. A profile
name alone never supplies the target.

### Concise Valid Examples

Fresh implementation:

```text
Worker session target: fresh-worker-session
Worker session profile: Fresh Implementation Worker
Task identity: implement one bounded catalog endpoint
```

Current-session continuation:

```text
Worker session target: current-worker-session
Worker session profile: Diagnostic Worker
Continuity anchor: terminal PASS report for task CATALOG-17
Authority renewal: prior authority expired; this prompt grants a new read-only diagnostic task
Evidence posture: non-independent
```

Fresh independent audit:

```text
Worker session target: fresh-worker-session
Worker session profile: Fresh Independent Audit
Task identity: independently audit commit <exact-sha>
```

### Invalid Combinations

- `current-worker-session` with independent certification;
- omitted target used to continue mutation in an open conversation;
- a Fresh Implementation Worker, Diagnostic Worker, or Bounded Correction
  Worker profile treated as session routing without an explicit target.

## Communication Routing Fields

Universal AP defines routing fields, not project-specific values. A prompt may
state:

- Cooperator-facing language;
- Worker progress language;
- Orchestrator-to-Worker prompt language;
- formal Worker report language;
- repository documentation language.

Consuming project rules, normally in `AGENTS.md`, supply the actual values.
The universal contract must not hardcode a project, person, vendor, execution
client, natural language, host, or shell label.

## Worker Session Profile Contracts

Profiles constrain the authority and evidence posture of a Worker session. They
are not persistent roles and are not AP phases.

### Fresh Evidence Probe

- **Profile**: Fresh Evidence Probe.
- **Worker session target**: `fresh-worker-session`.
- **Phase**: the phase named by the task, often Preflight, Diagnostic Closeout,
  Acceptance, or Restoration support; Fresh Evidence Probe itself is not a
  phase.
- **Authority**: collect narrow fresh evidence only inside explicit mutation
  domains. The prompt must distinguish repository mutation, temporary
  probe-state mutation, durable project-state mutation, and external or
  production mutation.
- **Temporary probe-state mutation**: allowed only when explicitly authorized.
  Temporary artifacts must be bounded, non-secret, outside protected project
  state where practical, identified before use, cleaned after use, and reported
  with location and cleanup outcome.
- **Read-only default**: repository state, durable project state, production
  state, external accounts, and external services remain read-only unless
  separately authorized.
- **Evidence**: synthetic fixtures, temporary migration databases, bounded
  stress or concurrency probes, process-state inspection, schema comparison,
  failure reproduction, bounded browser or host observation, or narrow external
  evidence when authorized.
- **Output**: evidence classification, exact temporary locations, cleanup
  result, limitations, and whether findings require a separately authorized
  implementation or correction task.
- **Stopping rule**: stop if evidence collection would require unauthorized
  repository, durable project, production, external, or secret access.

### Bounded Correction Worker

- **Profile**: Bounded Correction Worker.
- **Worker session target**: explicit fresh or current target; the profile alone
  does not select the execution session.
- **Authority**: implementation authority only for confirmed defects and
  explicitly authorized adjacent consistency changes.
- **Evidence**: independent finding, Orchestrator-confirmed defect, exact
  correction boundary, tests, diff, and public verification when authorized.
- **Output**: correction, validation, one corrective commit when authorized,
  and a report that does not claim independent certification of its own change.
- **Stopping rule**: stop when a proposed change is outside the confirmed
  defect or explicitly authorized consistency boundary.

### Fresh Independent Re-Audit

- **Profile**: Fresh Independent Re-Audit.
- **Worker session target**: `fresh-worker-session`.
- **Phase**: Independent Audit. Fresh Independent Re-Audit is a form of
  Independent Audit, not a persistent role and not a new AP phase.
- **Authority**: fresh Worker session independent of the correction, normally
  read-only unless the task explicitly says otherwise.
- **Evidence**: correction diff, original independent finding, original risk
  claim, tests, public commit, durable decisions, and remaining limitations.
- **Output**: whether the correction resolves the defect and original risk
  claim, residual risks, and evidence classification.
- **Stopping rule**: stop when audit evidence is complete or correction would
  require new authority.

## Adaptive Phase Contracts

Each Worker prompt must name its Worker session target, Worker session profile,
phase, reasoning recommendation, authority, evidence, output, transition owner,
and stopping rule. A `current-worker-session` prompt must also name its
continuity anchor and complete authority renewal. Orchestrator-only actions do
not require Worker reasoning recommendations. Keep contracts compact; increase
detail only when risk, cross-cutting scope, or safety requires it.

### Discovery Or Intent Synthesis

- **Phase**: Discovery.
- **Reasoning recommendation**: lowest sufficient profile for ambiguity and
  stakes; High or Extra High only for substantial architecture uncertainty.
- **Authority**: read, analyze, synthesize, and ask bounded questions; no
  repository mutation unless separately authorized.
- **Evidence**: latest Cooperator intent, repository truth when relevant,
  accepted decisions, tentative ideas, rejected options, and evidence limits.
- **Output**: intent synthesis with accepted direction, explored ideas, open
  questions, risks, recommended default, approvals needed, and proposed next
  phase.
- **Transition owner**: Orchestrator recommends; Cooperator decides strategic
  or safety-sensitive questions.
- **Stopping rule**: stop when a decision-ready synthesis or exact next Worker
  task boundary is available.

### Separate Read-Only Preflight

- **Phase**: Preflight.
- **Reasoning recommendation**: usually High for operational, durable-state, or
  security-adjacent preparation; lower for simple state checks.
- **Authority**: read-only unless a minimal probe is explicitly approved; no
  implementation mutation.
- **Evidence**: current verified state, source limitations, unknowns,
  prerequisites, rollback, backups or checkpoints, environment constraints, and
  acceptance plan.
- **Output**: PASS when evidence is sufficient to recommend a separately
  authorized implementation slice, PARTIAL when a material prerequisite, risk,
  or rollback detail remains unresolved, or BLOCKED when implementation must
  not be authorized. Include exact proposed mutation boundary and whether
  implementation should proceed.
- **Transition owner**: Orchestrator, with Cooperator approval when authority,
  safety, or strategy changes.
- **Stopping rule**: stop if required state cannot be verified or mutation
  authority would be premature.

### Orchestrator-Led Cooperator-Executed Preflight

- **Phase**: Preflight.
- **Reasoning recommendation**: no Worker recommendation unless a Worker is
  later assigned; recommend reasoning in the later Worker prompt.
- **Authority**: Orchestrator issues one read-only command or observation
  request at a time for the Cooperator to execute in the authorized
  environment. Universal AP does not prescribe shell labels or host names.
- **Evidence**: complete Cooperator-returned output, command context,
  environment label from project rules when available, evidence limits, and
  Orchestrator classification before the next step.
- **Output**: stepwise PASS, PARTIAL, or BLOCKED preflight conclusion with
  threat, benefit, limitation, non-mutation guarantee, rollback or no-rollback
  relevance, and expected implementation readiness.
- **Transition owner**: Orchestrator, with Cooperator approval for any later
  safety-sensitive, irreversible, account-level, physical-device, or production
  mutation.
- **Stopping rule**: stop if evidence is incomplete, a step would mutate state
  without authority, or implementation would require a separate prompt.

### Fresh Implementation Worker

- **Worker session target**: `fresh-worker-session`.
- **Phase**: Implementation.
- **Reasoning recommendation**: lowest sufficient profile for the slice;
  choose separately from any later diagnostic.
- **Authority**: one fresh Worker, one coherent primary outcome, exact paths,
  commands, dependency, network, browser, secret, filesystem, and Git authority.
- **Evidence**: repository gate, mandatory reading, accepted decisions, tests,
  direct behavior, diff, and public verification when authorized.
- **Output**: implementation, validation, one commit and push when authorized,
  and a report beginning `### Report for ORCHESTRATOR_CHAT`.
- **Transition owner**: Orchestrator accepts, corrects, requests diagnostic, or
  starts another phase.
- **Stopping rule**: stop on failed gates, missing authority, unsafe secrets,
  out-of-scope needs, validation failure that cannot be corrected inside
  authority, or completed acceptance criteria and verification.

The implementation prompt may combine related inspection, research,
architecture recording, tests, documentation, one normal commit and push, and
evidence reporting only when all serve the same primary outcome.

After a separate preflight PASS, the implementation prompt includes exact
verified state, approved mutation boundary, checkpoint or backup, rollback,
step ordering, stop conditions, acceptance plan, required capabilities,
reasoning recommendation, and exact Git, host, filesystem, account, or service
authority.

### Automated And Cooperator Acceptance Plan

- **Phase**: Acceptance.
- **Reasoning recommendation**: normally Standard; High when evidence classes,
  media behavior, device state, or accessibility risk are complex.
- **Authority**: define automated checks, browser scope, screenshots,
  environment observations, Cooperator checklist, and cleanup rules; no new
  feature authority.
- **Evidence**: test output, browser or engine and version, origin and state,
  screenshots or logs, accessibility or media evidence, physical observation,
  and Cooperator responses. Engine-level and browser-product evidence are
  labelled separately.
- **Output**: acceptance matrix or numbered checklist with PASS, FAIL, NOT
  TESTED, defects, missing evidence, and adjacent ideas separated.
- **Transition owner**: Orchestrator classifies evidence and feedback.
- **Stopping rule**: stop when acceptance status and any bounded correction
  need are clear.

### Diagnostic Closeout

- **Worker session target**: explicit `fresh-worker-session` or
  `current-worker-session`; Diagnostic Worker does not imply either target.
- **Phase**: Diagnostic Closeout.
- **Reasoning recommendation**: choose independently; often High for a
  substantial slice.
- **Authority**: read-only by default; any correction must name exact paths,
  defect class, validation, Git authority, and normally one corrective commit.
- **Evidence**: original task, implementation commit, Worker report as claim,
  repository files, tests, public commit and raw content, security boundaries,
  documentation truth, changed paths, and Git integrity.
- **Output**: confirmed defects, disproven concerns, unresolved risks,
  validation evidence, and correction commit if authorized.
- **Transition owner**: Orchestrator decides acceptance, correction, audit,
  continuation, or closure.
- **Stopping rule**: stop outside the original task boundary or when no
  authorized correction remains.

### Fresh Independent Audit

- **Worker session target**: `fresh-worker-session`.
- **Phase**: Independent Audit.
- **Reasoning recommendation**: High or Extra High only when impact, risk,
  uncertainty, or evidence cost justifies a separate fresh review.
- **Authority**: separate fresh Worker, sequential execution, normally
  read-only; no parallel Worker topology and no new feature task.
- **Evidence**: current repository files, tests and command output, public
  commit and raw content, durable decisions, and Worker report as claim only.
- **Output**: discrepancies, confirmations, residual risks, and evidence
  classification.
- **Transition owner**: Orchestrator.
- **Stopping rule**: stop when audit evidence is complete or correction would
  require authority not granted.

A Fresh Independent Audit prompt targeting `current-worker-session` is
contradictory and invalid. Internal agents used within one accountable Worker run
are not separate independent auditors.

### Fresh Orchestrator Restoration

- **Phase**: Restoration.
- **Reasoning recommendation**: recommend the likely profile for the next
  substantial Worker task, not for every future action.
- **Authority**: synthesis only; restoration text grants no repository, host,
  implementation, deployment, production, account, filesystem, external-service,
  browser, credential, or Git mutation authority.
- **Evidence**: verified public commit, current AP pin when present, completed
  boundaries, accepted decisions, evidence classification, active Worker state,
  current mutation state, unresolved questions, risks, and materially relevant
  Cooperator intent separated from brainstorming.
- **Output**: evidence-dense synthesis with PASS, PARTIAL, or BLOCKED
  restoration readiness classification; operational continuity; strategic
  continuity; development narrative; forward horizon; authority boundaries
  including account, browser, filesystem, Git, production, and external-service
  boundaries; current phase; exact next bounded step; next Worker reasoning
  recommendation or premature statement; public-verification requirement; and
  no-mutation-authority statement. Fields may be not applicable, unavailable,
  or unresolved, but not omitted silently.
- **Readiness review**: contradiction review, omission review, stale-state
  review, authority review, active-mutation review, active-Worker review,
  security-boundary review, strategic-direction review, and next-step
  executability review. PASS means the synthesis is complete enough for a fresh
  Orchestrator to continue after verification. PARTIAL means useful continuity
  exists but material uncertainty remains. BLOCKED means the state cannot be
  restored responsibly.
- **Transition owner**: fresh Orchestrator verifies truth before acting.
- **Stopping rule**: stop if public state or active mutation cannot be
  classified honestly.

### Optional Discovery Record Creation

- **Phase**: Discovery.
- **Reasoning recommendation**: match the decision complexity; Standard for
  routine records, High for architecture exploration.
- **Authority**: exact path, consumer, lifecycle, allowed content, validation,
  and Git authority; no hidden transcript archive.
- **Evidence**: topic, status, observation date, Cooperator intent summary,
  verified context, options, benefits, risks, rejected alternatives, open
  questions, promotion targets, and retention triggers.
- **Output**: visible project-owned Discovery Record that states it is not task
  authority. It may describe an accepted decision only when the same bounded
  change promotes the decision to the authoritative durable destination or the
  record links to an existing authoritative artifact; otherwise decision-like
  items are proposed, candidate, recommended, or open.
- **Transition owner**: Orchestrator promotes accepted conclusions to ADR,
  product, specification, roadmap, security, or project-rule artifacts.
- **Stopping rule**: stop if the record lacks a concrete consumer or lifecycle.

### Exceptional Repository Handoff

- **Phase**: Restoration or operational lifecycle support.
- **Reasoning recommendation**: Standard to High depending on unreconstructable
  state and risk.
- **Authority**: exact handoff path, classification, consumer, required content,
  exclusions, retention or retirement trigger, cleanup owner, validation, Git
  authority, and public verification.
- **Evidence**: why durable repository truth and restoration prompt are
  insufficient, what state is unreconstructable, and what must be excluded.
- **Output**: Worker-authored handoff context only; it must not grant task
  authority or invent next work.
- **Transition owner**: Orchestrator.
- **Stopping rule**: stop if ordinary restoration or durable repository truth is
  sufficient.

## AP Integration Task

For adopting AP in a consuming project, the task should require:

- clean repository baseline;
- reasoning recommendation for the Worker performing the integration;
- `git submodule add https://github.com/cisarik/ap.git .ap`;
- `./.ap/ap init`;
- `./.ap/ap doctor`;
- review of `.gitmodules`, `.ap` gitlink, and `AGENTS.md`;
- no copied universal AP files;
- one reviewable project commit when authorized.

For updating AP, use [UPDATING.md](UPDATING.md) and require an explicit update
task.

## Related Documents

- [AP.md](AP.md)
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
- [INTEGRATION.md](INTEGRATION.md)
- [UPDATING.md](UPDATING.md)
