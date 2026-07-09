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

## Fresh Implementation Worker

Use this contract for one substantial coherent implementation slice.

Required structure:

```text
You are a fresh Worker instance assigned to the persistent WORKER protocol role.

Task ID:
Task type: fresh implementation slice
Repository:
Working directory:
Branch:
Expected baseline:

Repository gate:
- verify root, remote identity, branch, local/tracking/public refs, status, and untracked files
- stop before mutation if any material gate fails

Mandatory reading:
- project AGENTS.md
- .ap/AP.md
- .ap/AP_WORKER.md
- task-relevant files

Goal:
- one coherent outcome

Accepted decisions:
- ...

Allowed paths:
- ...

Explicit exclusions:
- no unrelated features
- no speculative refactors
- no project-specific AP protocol edits
- ...

Validation:
- ...

Git authority:
- read-only, or exact stage/commit/push authority

Stopping conditions:
- ...

Report:
- begin with ### Report for ORCHESTRATOR_CHAT
```

The prompt may authorize related inspection, implementation, tests,
documentation, one normal commit and push, and evidence reporting when all serve
the same primary outcome.

## Diagnostic Closeout

Use this contract after an implementation pass when one adversarial closeout is
proportionate.

```text
You are a Worker instance assigned to diagnostic closeout for the same completed slice.

Implementation commit:
Original acceptance contract:
Review hypotheses:
- requirement coverage
- prohibited behavior
- negative guarantees
- security and privacy boundaries
- failure cleanup
- documentation truth
- changed-path and Git integrity

Default authority:
- read-only
- no new feature
- no general cleanup
- no broad rewrite

Optional correction authority:
- only if explicitly listed
- exact paths:
- one corrective commit:

Validation:
- ...

Report:
- confirmed defects
- disproven concerns
- unresolved risks
- validation evidence
- correction commit if used
- begin with ### Report for ORCHESTRATOR_CHAT
```

Diagnostic closeout remains inside the original task boundary.

## Fresh Independent Audit

Use this contract when risk justifies a separate fresh Worker instance for
sequential audit.

```text
You are a fresh Worker instance assigned to bounded independent audit.

Implementation commit:
Original task contract:
Evidence hierarchy:
- current repository files
- tests and command output
- public commit and raw content
- durable decisions
- Worker report as claim only

Authority:
- read-only by default
- no implementation changes unless exact correction authority is listed
- no new feature task
- no parallel execution

Report discrepancies with evidence and begin with ### Report for ORCHESTRATOR_CHAT
```

## Fresh Orchestrator Restoration

At a coherent verified boundary, the Orchestrator may produce a restoration
prompt for a fresh Orchestrator instance instead of requiring a repository
handoff file.

The prompt should contain:

- persistent ORCHESTRATOR role identity;
- project and repository identity;
- exact last verified public commit;
- completed logical boundaries;
- accepted decisions and durable source files;
- evidence classification;
- security, secret, network, filesystem, and Git authority boundaries;
- active Worker state;
- unresolved decisions or risks;
- exact recommended next bounded step;
- instruction to verify public truth independently before acting;
- PASS, PARTIAL, or BLOCKED restoration classification;
- explicit statement that restoration text grants no mutation authority.

## Exceptional Repository Handoff

Use this contract only when unreconstructable state exists.

The Orchestrator task must define:

- why durable repository truth and a restoration prompt are insufficient;
- exact handoff path;
- intended consumer;
- classification and authority level;
- required content and exclusions;
- retention or retirement trigger;
- cleanup owner;
- validation;
- exact Git authority;
- public verification requirement.

The Worker-authored handoff is context only. It must not grant task authority or
invent the next task.

## AP Integration Task

For adopting AP in a consuming project, the task should require:

- clean repository baseline;
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
