# Prompt Contracts

Reusable structure for authoritative ORCHESTRATOR task prompts and Worker reports.

## Report format (required)

Every Worker report MUST begin exactly with:

`### Report for ORCHESTRATOR_CHAT`

Reports SHOULD include: Status (PASS / PARTIAL / BLOCKED), evidence sections, validation results, Git state, deviations, risks, and session state.

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

Precondition gates:
- Verify Git root equals working directory
- Verify origin URL
- Verify baseline / empty-state expectations
- Stop on mismatch unless correction authorized

Goal: {exact-goal}

Authorized paths: {path-list}
Forbidden paths: {path-list}
Allowed commands: {command-list}
Forbidden commands: {command-list}
Git authority: {none-or-exact-operations}
Validation: {validation-commands}
Acceptance criteria: {criteria-list}
Stopping conditions: {condition-list}

Report MUST begin with: ### Report for ORCHESTRATOR_CHAT
```

## Sequential Worker_2 continuation outline

For sequential relay after Worker_1:

```
You are `Worker_2`, a fresh Worker instance assigned to the WORKER role.

Prior work summary (ORCHESTRATOR-synthesized — verify against commits):
- {verified-conclusions-from-public-commits}
- {open-items}

Do NOT assume raw Worker_1 conversation. Verify repository evidence.

Baseline: {commit-sha-after-prior-worker}
Goal: {bounded-continuation-task}

Authorized paths: {narrow-scope-list}
...
```

Include only context Worker_2 needs. Label synthesized claims as synthesized.

## Independent verification Worker outline

```
You are `Worker_N`, assigned to bounded verification/review.

Implementation baseline: {commit-sha}
Authorizing task: review only unless explicit fix paths listed

Goal: Verify {review-scope} against acceptance criteria from task {prior-task-id}.

Authorized paths: {review-only-or-explicit-fix-paths}
Git authority: none (unless explicit fix authorization)

Report discrepancies with evidence. Do not silently modify implementation.
```

## Parallel workstream prompt checklist

When parallel execution is authorized, each Worker prompt MUST include:

- [ ] Worker label and distinct workstream ID
- [ ] Exclusive path ownership list
- [ ] Exclusive branch or worktree name
- [ ] Common verified baseline commit
- [ ] Forbidden overlap with other Workers' paths/migrations/generated files
- [ ] Integration owner (ORCHESTRATOR)
- [ ] Merge order and conflict policy
- [ ] Stop condition if independence fails
- [ ] No push to shared branch without integration task
- [ ] Post-integration validation owner and commands

Parallel prompts MUST NOT be identical broadcast copies.

## Orchestrator presentation

When showing the prompt to the COOPERATOR, precede it with:

`Toto pošli WORKEROVI ako jeden prompt:`

## Related documents

- [AP.md](AP.md)
- [APv2.md](APv2.md)
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
