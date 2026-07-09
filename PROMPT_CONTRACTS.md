# Prompt Contracts

Reusable structure for authoritative ORCHESTRATOR task prompts and Worker reports.

## Report format (required)

Every Worker report MUST begin exactly with:

`### Report for ORCHESTRATOR_CHAT`

Reports SHOULD include: Status (PASS / PARTIAL / BLOCKED), evidence sections, validation results, Git state, deviations, risks, and session state.

### Compact communication mode

Repositories MAY use compact communication mode (see [APv3.md](APv3.md) §36). Under compact mode, unless a task requires more detail, a report SHOULD contain:

1. status;
2. start and end HEAD;
3. changed files and short purpose;
4. tests and validation results;
5. commit and push result;
6. deviations or risks;
7. one proposed next step.

Target approximately 800–1,000 words. Summarize command execution instead of listing every command. Include full output only for failures, unexpected state, safety-critical evidence, or explicit Orchestrator request. Safety-relevant evidence MUST NOT be omitted for brevity.

## Authoritative task prompt fields

A strong Worker prompt SHOULD normally include:

| Field | Purpose |
|---|---|
| Concrete Worker label | When AP v2 or ambiguity exists (e.g. `Worker_1`) |
| Persistent role identity | WORKER |
| Task ID | Stable identifier |
| Task type | Bootstrap, implementation, verification, documentation, etc. |
| Repository URL | Canonical remote |
| Working directory | Absolute path |
| Branch | Target branch |
| Exact baseline | Commit SHA or empty-state description |
| Expected commit metadata | When verifying existing state |
| Mandatory reading order | Files to read before acting |
| Precondition gates | Checks that must pass before modification |
| Context | Background the Worker needs |
| Exact goal | What done looks like |
| Authorized paths | Files or directories MAY be changed |
| Forbidden paths | Explicit exclusions |
| Allowed commands | Command allow list or classes |
| Forbidden commands | Explicit exclusions |
| Dependency authority | Whether install/update is permitted |
| Migration authority | Whether schema migrations are permitted |
| Git authority | Exact Git operations permitted |
| Secret authority | Whether secret access is permitted |
| Network/provider authority | External calls permitted |
| Browser automation authority | Permitted adapter or browser capability; allowed origins, URL boundaries, interactions, observations, external-network use, profile/session boundaries, private-data limits, interception or synthetic-response authority, screenshot/log authority, temporary artifacts, and cleanup |
| Private-data authority | Private media, DB, logs access |
| Filesystem mutation authority | Create/rename/delete outside repo |
| Test-first expectations | When tests must precede or follow change |
| Validation commands | Commands Worker MUST run |
| Acceptance criteria | Concrete pass conditions |
| Stopping conditions | When to stop without finishing |
| Pre-commit remote gate | Remote state checks before commit |
| Exact commit subject | When commit is authorized |
| Push verification | How to verify push success |
| Report format | Reference this document |
| Required session state | Open, closeout, handoff update |

Omitted permission is not implied permission.

## Single-Worker launch prompt outline

```
You are {worker-label}, a concrete Worker instance assigned to the persistent WORKER protocol role.

Task ID: {task-id}
Task type: {task-type}
Repository: {repository-url}
Working directory: {absolute-working-directory}
Branch: {primary-branch}
Baseline: {commit-sha-or-empty-state}

Mandatory reading:
1. AGENTS.md
2. AP.md
3. AP_WORKER.md
4. WORKERS.md (if present)
5. NEXT_WORKER.md

Precondition gates (integrated read-only bootstrap gate):
- Verify Git root equals working directory
- Verify origin URL
- Verify baseline / empty-state expectations
- Stop on mismatch unless correction authorized

For low- or medium-risk continuation, the bootstrap gate MAY be integrated into the first implementation prompt. Use a separate bootstrap-only task when repository identity, cleanliness, environment state, or security sensitivity is uncertain.

Goal: {exact-goal}

Authorized paths: {path-list}
Forbidden paths: {path-list}
Allowed commands: {command-list}
Forbidden commands: {command-list}
Browser automation authority: {none-or-exact-browser-boundaries}
Git authority: {none-or-exact-operations}
Validation: {validation-commands}
Acceptance criteria: {criteria-list}
Stopping conditions: {condition-list}

Report MUST begin with: ### Report for ORCHESTRATOR_CHAT
```

## Fresh-slice implementation prompt outline

Use this outline when a substantial coherent slice should be handled by one fresh Worker instance. Keep one primary outcome.

```
You are {worker-label}, a fresh Worker instance assigned to the persistent WORKER protocol role.

Task ID: {task-id}
Task type: fresh-slice implementation
Repository: {repository-url}
Working directory: {absolute-working-directory}
Branch: {primary-branch}
Pinned baseline: {commit-sha}

Goal: {one-coherent-outcome}

Mandatory inspection:
- {files-or-evidence-to-read}

Allowed path authority:
- {path-list}

Explicit exclusions:
- no unrelated features
- no speculative refactors
- no operational mutations
- no independent product decisions
- {project-specific-exclusions}

Validation:
- {commands-or-checks}

Git authority:
- {exact-stage-commit-push-authority-or-none}
- commit subject: {subject-if-authorized}

Stopping rules:
- stop on failed precondition
- stop after reporting this slice
- do not start a new product slice

Report MUST begin with: ### Report for ORCHESTRATOR_CHAT
```

## Diagnostic closeout prompt outline

Use this outline after an implementation pass when one adversarial closeout pass is proportionate. It remains inside the same implemented slice.

```
You are {worker-label}, continuing or freshly assigned to the WORKER role for diagnostic closeout.

Task ID: {task-id}
Task type: diagnostic closeout for {prior-task-id}
Implementation commit: {exact-sha}
Original acceptance contract or requirement summary:
- {requirement-summary}

Review scope:
- {audit-hypotheses-or-risk-areas}

Default authority:
- read-only unless the correction authority below is explicit
- no new product feature
- no general cleanup
- no broad rewrite

Optional correction authority:
- authorized only for confirmed defects within the original task boundary
- exact paths: {path-list-or-none}
- Git authority: {none-or-one-corrective-commit-details}

Validation:
- {commands-or-checks}

Report:
- confirmed defects
- disproven concerns
- unresolved risks
- validation evidence
- correction commit, if explicitly authorized and used

Stop after this diagnostic closeout report.
Report MUST begin with: ### Report for ORCHESTRATOR_CHAT
```

## Independent fresh audit outline

```
You are {worker-label}, a fresh Worker instance assigned to bounded independent audit.

Implementation commit: {exact-sha}
Original task or requirement summary: {summary-or-link}

Goal: Verify {review-scope} against the original acceptance criteria.

Authority:
- read-only by default
- no implementation changes unless explicit correction paths and Git authority are listed
- no parallel execution
- no new feature task

Report discrepancies with evidence. Distinguish independent observations from prior Worker claims.
```

Independent fresh audit is sequential under AP v3. It is used only when the Orchestrator decides that same-session diagnostic closeout is not sufficient for the risk class.

## Orchestrator presentation

When showing the prompt to the COOPERATOR, precede it with:

`Toto pošli WORKEROVI ako jeden prompt:`

## Related documents

- [APv3.md](APv3.md) — active protocol (also reachable via [AP.md](AP.md))
- [APv2.md](APv2.md) — superseded experimental reference
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
- [ADR-0004: Fresh-slice implementation and diagnostic closeout lifecycle](docs/adr/0004-fresh-slice-diagnostic-lifecycle.md)
