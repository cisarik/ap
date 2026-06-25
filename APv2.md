# Analytic Programming Protocol (Version 2)

## 1. Purpose

Analytic Programming is a Coordinator Protocol for software work in which intent clarification, evidence inspection, bounded task shaping, proportional validation, public verification, controlled continuation, and explicit session handoff matter more than conversational momentum.

This document is **AP version 2**. It is complete and standalone. A consuming project MAY copy this file to `AP.md` and operate without reading AP version 1.

## 2. Roles and Instances

Analytic Programming uses three persistent protocol roles:

| Role | Responsibility |
|---|---|
| **COOPERATOR** | Human project owner; strategic intent; approval of Worker topology and significant alternatives |
| **ORCHESTRATOR** | Coordination; topology recommendation; separate Worker prompts; evidence synthesis; integration planning; verification |
| **WORKER** | Bounded execution of one authoritative task; inspection before change; proportional validation; honest evidence reporting |

These uppercase names are persistent protocol abstractions. They are not applications, chats, models, providers, IDEs, CLIs, or individual sessions.

### 2.1 Concrete instances and sessions

- An **Orchestrator instance** is temporarily assigned to the ORCHESTRATOR role.
- A **Worker instance** uses an opaque project-local label such as `Worker_1`, `Worker_2`, or `Worker_3`.

Several Worker instances share the one persistent **WORKER** role.

Use phrasing such as *Worker_2, a Worker instance assigned to the WORKER role*. Do not call a concrete instance "a new WORKER."

A **session** is the bounded lifecycle of one concrete instance. Context pressure belongs to sessions, not to persistent roles.

### 2.2 Worker labels

Worker labels:

- MUST be unique within the current project topology;
- identify concrete Worker lineages or sessions, not vendors;
- MUST NOT imply seniority, trust level, task type, model, or provider.

Implementation identity MAY remain undisclosed. Capability descriptions MAY be recorded without vendor identity.

### 2.3 No additional protocol roles

Do not create persistent protocol roles such as RESEARCHER, REVIEWER, BUILDER, TESTER, or INTEGRATOR.

Those MAY exist as temporary **assignment profiles** applied to concrete Worker instances. They remain Workers assigned to the WORKER role.

## 3. Worker Topology Decision

### 3.1 Default

**One Worker is the default.**

Additional Workers add coordination, integration, and context costs. More Workers are not inherently better.

### 3.2 ORCHESTRATOR recommendation

The ORCHESTRATOR SHOULD evaluate whether additional Workers provide concrete benefit for:

- fresh context after a large phase;
- independent verification;
- specialist capability (research, architecture review, test design, security review);
- isolated research;
- disjoint implementation workstreams;
- deliberate adversarial review;
- large project phase separation.

The ORCHESTRATOR MUST NOT recommend more Workers merely because multiple agents are available.

### 3.3 COOPERATOR approval

The COOPERATOR approves Worker count and major topology changes.

### 3.4 Project record

Worker count, labels, status, and topology MUST be recorded in [WORKERS.md](WORKERS.md). Universal handbooks such as [AP_WORKER.md](AP_WORKER.md) MUST NOT store project-specific count.

## 4. Supported Topologies

### A. Single Worker (default)

One Worker instance executes tasks sequentially. This remains the default for all projects.

### B. Sequential relay (preferred multi-Worker mode)

Example flow:

`Worker_1 → ORCHESTRATOR → Worker_2 → ORCHESTRATOR → Worker_3`

Characteristics:

- only one Worker modifies the repository at a time;
- each later Worker starts with fresh context;
- the ORCHESTRATOR synthesizes prior evidence;
- a later Worker does not need the full raw conversation or raw report of an earlier Worker;
- the repository and verified commits remain primary evidence;
- each Worker receives a separate tailored launch-and-task prompt.

This is the **preferred** v2 multi-Worker topology for most projects.

### C. Specialist chain

Different Worker instances receive assignment profiles such as research, architecture review, implementation, test design, verification, or documentation.

They remain concrete Workers in the same persistent WORKER role. The ORCHESTRATOR decides sequencing and information exposure.

### D. Independent verification

One Worker performs implementation. A separate fresh Worker performs bounded review or verification without silently modifying the implementation unless explicitly authorized.

### E. Parallel workstreams (exceptional)

Parallel execution is **exceptional**. It requires:

- genuinely independent tasks;
- explicit path ownership;
- explicit branch or worktree ownership;
- a common verified baseline;
- no overlapping migration numbers;
- no overlapping generated files;
- no shared mutable external resource unless coordinated;
- explicit integration owner;
- explicit merge order;
- explicit conflict policy;
- explicit validation after integration;
- no direct push race to the same branch;
- a stop condition when independence assumptions fail.

Do not present parallelism as the default AP v2 benefit.

## 5. Authority

| Actor | Authority |
|---|---|
| COOPERATOR | Strategic direction; topology approval; irreversible actions |
| ORCHESTRATOR | Task shaping; topology recommendation; separate prompts; evidence synthesis; integration planning |
| WORKER | Bounded execution within the authoritative task only |

**Task authority** comes only from the current authoritative ORCHESTRATOR task prompt addressed to that Worker instance.

BOOT and NEXT files provide context. They do **not** grant task authority.

## 6. Separate Prompts

Every Worker instance MUST receive its own authoritative prompt.

Do not broadcast one generic prompt to several Workers.

Each prompt MUST include only the context required for that Worker's assignment.

The ORCHESTRATOR MAY synthesize earlier Worker evidence instead of pasting full raw reports.

The ORCHESTRATOR MUST NOT misrepresent synthesized claims as independently verified facts.

## 7. Worker-to-Worker Communication

Direct unstructured Worker-to-Worker conversation is not required.

Default communication path:

`Worker → ORCHESTRATOR → Worker`

Shared state SHOULD travel through:

- committed repository evidence;
- accepted decision records;
- bounded handoff artifacts;
- structured Worker reports;
- explicit ORCHESTRATOR synthesis.

A project MAY authorize structured Worker-to-Worker artifacts. They MUST have a named consumer, owner, retention rules, scope boundaries, and no implicit task authority.

## 8. Integration Authority

The ORCHESTRATOR owns integration planning.

A Worker MUST NOT assume that another Worker's branch, artifact, or report is safe to merge.

Integration MUST verify: baseline, changed paths, task compatibility, tests, migrations, generated artifacts, conflict resolution, and final combined behavior.

## 9. Evidence Hierarchy

Default hierarchy (projects MAY adjust):

1. current repository implementation;
2. tests and executable verification;
3. accepted decision records;
4. current normative documentation;
5. current public Git state;
6. structured Worker reports;
7. remembered context and assumptions.

Worker reports MUST NOT override independently verifiable repository evidence.

## 10. Orchestrator Loop

1. restore context;
2. verify source-of-truth state;
3. review `WORKERS.md`;
4. clarify one unresolved decision;
5. recommend or confirm topology;
6. select the smallest coherent task;
7. issue one authoritative prompt per assigned Worker;
8. evaluate Worker reports;
9. verify public evidence;
10. classify PASS, PARTIAL, or BLOCKED;
11. plan integration when multiple Workers contributed;
12. continue, correct, pause, or close;
13. create handoffs when rotating.

## 11. Worker Execution Loop

1. read the complete authoritative task;
2. determine concrete Worker label from task and `WORKERS.md`;
3. verify repository identity and preconditions;
4. inspect relevant evidence;
5. stop on contradiction;
6. modify only authorized scope;
7. do not modify another Worker's workstream without authority;
8. validate proportionally;
9. verify diff and Git state;
10. commit or push only when authorized;
11. report evidence;
12. stop when acceptance criteria pass.

## 12. WORKERS.md

`WORKERS.md` is mandatory for active AP v2 projects.

Each Worker entry SHOULD include:

| Field | Purpose |
|---|---|
| label | Opaque identifier such as `Worker_1` |
| status | `PLANNED`, `READY`, `ACTIVE`, `BLOCKED`, `CLOSING`, `CLOSED` |
| current assignment | Bounded task description or idle state |
| assignment profile | Optional specialist profile |
| authorized workstream | Path, branch, or worktree scope |
| capability profile | Functional capabilities without vendor identity |
| active branch or worktree | When applicable |
| last verified baseline | Commit SHA or empty-state marker |
| current session state | Open, closing, or closed |
| handoff path | e.g. `NEXT_WORKER_1.md` |
| integration dependency | Other Workers this instance depends on |
| notes and blockers | Operational detail |

Vendor, model, and provider fields are not required.

## 13. Multi-Worker Handoffs

- one root `NEXT_ORCHESTRATOR.md`;
- one root `NEXT_WORKER.md` for single-Worker projects;
- when multiple active Worker lineages need persistent handoffs, labels such as `NEXT_WORKER_1.md`, `NEXT_WORKER_2.md` MAY be used;
- `WORKERS.md` MUST point to the applicable handoff;
- handoffs are context, not task authority;
- one-shot verification Workers MAY not need a persistent handoff;
- inactive handoff artifacts MUST be cleaned or archived per [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md).

## 14. Fresh Launch Prompt

A fresh Worker launch prompt is one coherent prompt that MAY combine:

- instance identity and label;
- repository identity;
- required reading;
- baseline verification;
- concrete task;
- authority boundaries;
- validation;
- report contract.

The launch prompt does not replace stable `BOOT_WORKER.md`. The launch prompt is the current task authority.

The ORCHESTRATOR MAY generate different launch prompts for `Worker_1`, `Worker_2`, and `Worker_3`.

## 15. Context-Aware Rotation

The ORCHESTRATOR SHOULD monitor:

- available context telemetry;
- rate limits;
- session duration;
- report quality;
- lost constraints;
- repeated mistakes;
- task size;
- clean commit boundaries.

Frequent handoffs at clean boundaries MAY improve precision. No universal percentage threshold is normative.

## 16. Task Prompt Contract

See [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md).

## 17. Git and Security

### 17.1 Git write authorization

Git write operations MUST NOT be performed without explicit task-specific authorization.

### 17.2 Boundaries

Preserve all v1 safety boundaries:

- explicit authority;
- exact repository identity;
- exact paths;
- no secret exposure;
- no silent scope expansion;
- no unsupported completion claims;
- no destructive action without approval;
- no parallel writes to shared state without an integration plan.

See [AP.md](AP.md) sections on dependency, migration, filesystem, network, and destructive action authority for the same rules (this document incorporates them by full restatement above).

Additional v2 rule: a Worker MUST NOT push to a branch owned by another Worker unless the task explicitly authorizes integration.

## 18. Reports

Worker reports MUST begin exactly with:

`### Report for ORCHESTRATOR_CHAT`

Reports MUST use the concrete Worker label when ambiguity is possible.

## 19. Handoffs and Public Verification

BOOT files are stable. NEXT files are replaceable. Orchestrator closeout MAY use commit subject `handout` where the project adopts that convention.

Public commits MUST be independently verified.

## 20. Artifact Lifecycle

See [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md).

## 21. Non-Goals

AP version 2 does **not**:

- guarantee correctness;
- require public repositories;
- replace testing or human judgment;
- make parallelism the default;
- require vendor disclosure in normative documents.

## Related Documents

- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
- [WORKERS.md](WORKERS.md) — project-specific topology (template in consuming projects)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
- [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md)
- [GLOSSARY.md](GLOSSARY.md)
- [VERSIONING.md](VERSIONING.md)
