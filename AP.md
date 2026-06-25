# Analytic Programming Protocol (Version 1)

## 1. Purpose

Analytic Programming is a Coordinator Protocol for software work in which intent clarification, evidence inspection, bounded task shaping, proportional validation, public verification, controlled continuation, and explicit session handoff matter more than conversational momentum.

This document is **AP version 1**. It defines a stable single-Worker model. A complete multi-Worker protocol is available separately as `APv2.md` for projects that adopt it.

## 2. Roles and Instances

Analytic Programming uses three persistent protocol roles:

| Role | Responsibility |
|---|---|
| **COOPERATOR** | Human project owner; strategic intent; approval of significant alternatives; irreversible or security-sensitive actions |
| **ORCHESTRATOR** | Coordination; evidence inspection; bounded task shaping; Worker report evaluation; public commit verification; session continuation or closure |
| **WORKER** | Bounded execution of one authoritative task; inspection before change; proportional validation; honest evidence reporting |

These uppercase names are **persistent protocol abstractions**. They are not applications, chats, models, providers, IDEs, CLIs, or individual sessions.

### 2.1 Concrete instances and sessions

A **concrete instance** is a temporarily initialized entity assigned to a persistent role.

- An **Orchestrator instance** is assigned to the ORCHESTRATOR role.
- A **Worker instance** (for example `Worker_1`) is assigned to the WORKER role.

Use phrasing such as *a fresh Worker instance assigned to the WORKER role*. Do not call a concrete instance "a new WORKER" or "a fresh ORCHESTRATOR."

A **session** is the bounded lifecycle and context of one concrete instance. Context window limits, rate limits, token pressure, tool availability, and session degradation belong to the concrete instance/session, not to the persistent protocol role.

### 2.2 Worker implementation layers

Separate identity layers:

- **execution client** — host tool or environment running the agent;
- **Worker implementation** — concrete system fulfilling the WORKER role;
- **model** — language model used for generation;
- **model provider** — organization or service hosting the model.

Vendor, model, and client names MUST NOT appear as normative requirements in reusable protocol documents.

## 3. Single-Worker Model

Version 1 permits:

- one active Worker instance at a time;
- intentional Worker instance rotation;
- fresh Worker sessions;
- sequential continuation through repository evidence and `NEXT_WORKER.md`.

Version 1 does **not** permit multiple simultaneously assigned Worker workstreams as a normative feature.

Project-specific Worker count for AP v2 projects belongs in `WORKERS.md`, not in this document or in `AP_WORKER.md`.

## 4. Authority

| Actor | Authority |
|---|---|
| COOPERATOR | Strategic direction; approval of topology, irreversible actions, and significant alternatives |
| ORCHESTRATOR | Task shaping; verification design; Worker prompt issuance; report evaluation; integration planning in multi-Worker projects |
| WORKER | Bounded execution within the authoritative task only |

**Task authority** comes only from the current authoritative ORCHESTRATOR task prompt.

`BOOT_ORCHESTRATOR.md`, `BOOT_WORKER.md`, `NEXT_ORCHESTRATOR.md`, and `NEXT_WORKER.md` provide context. They do **not** grant task authority.

Repository documents and accepted ADRs constrain behavior. They do **not** implicitly authorize modification.

## 5. Evidence Hierarchy

When sources conflict, participants MUST identify the conflict rather than silently choosing a convenient source.

Default hierarchy (projects MAY adjust ordering for local needs):

1. current repository implementation;
2. tests and executable verification;
3. accepted decision records;
4. current normative documentation;
5. current public Git state;
6. structured Worker reports;
7. remembered context and assumptions.

Worker reports are structured claims, not proof by themselves. Reports MUST NOT override independently verifiable repository evidence.

## 6. Orchestrator Loop

The minimal Orchestrator cycle:

1. restore context from repository evidence and handoffs;
2. verify source-of-truth state;
3. clarify one unresolved decision with the COOPERATOR when needed;
4. select the smallest coherent task;
5. issue one authoritative Worker prompt;
6. evaluate the Worker report;
7. verify public evidence when commits are claimed;
8. classify outcome as PASS, PARTIAL, or BLOCKED;
9. continue, correct, pause, or close;
10. create handoff when rotating sessions.

The Orchestrator MUST NOT implement repository changes when acting purely in the ORCHESTRATOR role.

## 7. Worker Execution Loop

The minimal Worker cycle:

1. read the complete authoritative task;
2. verify repository identity and preconditions;
3. inspect relevant evidence;
4. stop on contradiction or missing authority;
5. modify only authorized scope;
6. validate proportionally;
7. verify diff and Git state;
8. commit or push only when explicitly authorized;
9. report evidence;
10. stop when acceptance criteria pass.

## 8. Task Prompt Contract

Authoritative Worker prompts MUST follow the contract in [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md).

At minimum, a strong prompt normally includes: task ID, task type, working directory, verified baseline, context, exact goal, authorized paths, forbidden paths, command boundaries, Git authority, validation commands, acceptance criteria, stopping conditions, and required report format.

## 9. Git and Security

### 9.1 Git write authorization

Git write operations MUST NOT be performed without explicit task-specific authorization.

Git writes include: staging, committing, pushing, pulling, fetching, merging, rebasing, resetting, restoring, checking out, switching branches, cleaning, stashing, tagging, branch creation or deletion, remote modification, and Git configuration writes.

### 9.2 Secret boundaries

Participants MUST NOT inspect, print, or commit credentials, private keys, or environment values that may contain secrets unless explicitly authorized.

### 9.3 Dependency authority

Installing or updating dependencies requires explicit task authorization.

### 9.4 Migration authority

Database or schema migrations require explicit task authorization with named scope.

### 9.5 Filesystem authority

Creating, renaming, or deleting paths outside authorized scope is forbidden.

### 9.6 Network and provider authority

External network calls and provider API usage require explicit authorization.

### 9.7 Destructive action authority

Force-push, hard reset, irreversible deletion, and privileged system operations require explicit COOPERATOR approval unless the task names them exactly.

## 10. Reports

Worker reports MUST begin exactly with:

`### Report for ORCHESTRATOR_CHAT`

Reports MUST be compact and evidence-dense. They MUST distinguish verified facts from assumptions and MUST include validation results, Git state, deviations, and risks when applicable.

## 11. Handoffs

### 11.1 BOOT files

`BOOT_ORCHESTRATOR.md` and `BOOT_WORKER.md` are stable bootstrap context. They do not grant task authority.

### 11.2 NEXT files

`NEXT_ORCHESTRATOR.md` and `NEXT_WORKER.md` are replaceable session handoffs. They describe current state for the next instance. They do not grant task authority.

### 11.3 Worker closeout

When instructed, the Worker updates `NEXT_WORKER.md` at a clean committed boundary and stops.

### 11.4 Orchestrator closeout

At intentional Orchestrator session close, the COOPERATOR MAY manually commit `NEXT_ORCHESTRATOR.md` with subject `handout`. The next Orchestrator instance MUST verify the public commit independently.

### 11.5 Public verification

Handoffs and Worker claims MUST be verified against public repository evidence when available.

## 12. Context Pressure

Context pressure belongs to concrete sessions, not to persistent roles.

- Frequent rotation at clean commit boundaries MAY improve quality.
- Repeated summarization is not a substitute for an authoritative repository handoff.
- No fixed universal token percentage is normative.
- Actual client telemetry and observed output quality SHOULD guide rotation decisions.

## 13. Artifact Lifecycle

Committed and temporary artifacts MUST follow [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md).

Every meaningful artifact SHOULD have classification, intended consumer, authority level, retention trigger, and cleanup owner.

## 14. Capability Awareness

Required capabilities MUST be stated functionally in the task, not by naming a vendor.

A Worker MUST stop and report before modification when a required capability is unavailable.

Tool availability does not grant permission.

## 15. Non-Goals

AP version 1 does **not**:

- choose a programming language, IDE, or agent vendor;
- guarantee correctness;
- require public repositories;
- replace testing or human judgment;
- define multi-Worker parallel orchestration (see `APv2.md`).

## Related Documents

- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md) — Orchestrator operating handbook
- [AP_WORKER.md](AP_WORKER.md) — Worker operating handbook
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md) — Task prompt and report structure
- [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md) — Artifact classification and cleanup
- [GLOSSARY.md](GLOSSARY.md) — Term definitions
- [VERSIONING.md](VERSIONING.md) — Protocol version policy
