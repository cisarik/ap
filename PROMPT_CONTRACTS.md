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
| Task ID and type | Stable reference and task class |
| Reasoning recommendation | Lowest sufficient available reasoning profile and brief rationale for every Worker prompt |
| Repository identity | URL, branch, accepted URL spellings, expected refs |
| Working directory | Exact path or discovery rule |
| Baseline | Expected commit, parent, subject, changed paths, or empty-state rule |
| Mandatory reading | Project `AGENTS.md`, `.ap/AP.md`, `.ap/AP_WORKER.md`, and task-relevant files |
| Repository gate | Root, remote, branch, status, public ref, and untracked-state checks |
| Goal | One coherent outcome |
| Accepted decisions | Decisions already made by the Cooperator or durable project records |
| Allowed paths | Exact write scope |
| Exclusions | Scope that must not change |
| Commands | Allowed and forbidden command classes |
| Dependency authority | Install, update, lockfile, and runtime authority |
| Git authority | Exact fetch, stage, commit, push, or read-only rule |
| Network authority | Public verification, provider calls, or no network |
| Secret authority | Whether secret access is allowed; normally none |
| Browser authority | Allowed origins, interactions, storage, screenshots, and cleanup |
| Validation | Required checks and expected evidence |
| Acceptance criteria | Concrete pass conditions |
| Stopping conditions | Conditions that require stopping without improvisation |
| Report format | Required sections and header |
| Context-pressure rule | Whether visible usage must be reported |

Omitted permission is not implied.

## Adaptive Phase Contracts

Each Worker prompt must name its phase, reasoning recommendation, authority,
evidence, output, transition owner, and stopping rule. Orchestrator-only
actions do not require Worker reasoning recommendations. Keep contracts compact;
increase detail only when risk, cross-cutting scope, or safety requires it.

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

- **Phase**: Independent Audit.
- **Reasoning recommendation**: High or Extra High only when impact justifies a
  separate fresh review.
- **Authority**: separate fresh Worker, sequential execution, normally
  read-only; no parallel Worker topology and no new feature task.
- **Evidence**: current repository files, tests and command output, public
  commit and raw content, durable decisions, and Worker report as claim only.
- **Output**: discrepancies, confirmations, residual risks, and evidence
  classification.
- **Transition owner**: Orchestrator.
- **Stopping rule**: stop when audit evidence is complete or correction would
  require authority not granted.

### Fresh Orchestrator Restoration

- **Phase**: Restoration.
- **Reasoning recommendation**: recommend the likely profile for the next
  substantial Worker task, not for every future action.
- **Authority**: synthesis only; restoration text grants no repository, host,
  account, browser, credential, or Git mutation authority.
- **Evidence**: verified public commit, current AP pin when present, completed
  boundaries, accepted decisions, evidence classification, active Worker state,
  current mutation state, unresolved questions, risks, and materially relevant
  Cooperator intent separated from brainstorming.
- **Output**: self-contained restoration prompt with PASS, PARTIAL, or BLOCKED
  classification, project and repository identity, exact last verified public
  commit or limitation, AP pin when applicable, completed boundary, accepted
  decisions, authority boundaries including account and browser, current phase,
  exact next bounded step, next Worker reasoning recommendation or premature
  statement, public-verification requirement, and no-mutation-authority
  statement. Fields may be not applicable, unavailable, or unresolved, but not
  omitted silently.
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
