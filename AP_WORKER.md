# Worker Handbook for Analytic Programming

## Purpose

This handbook explains how a Worker operates under AP. It is universal guidance.
Repository-specific rules are supplied by the consuming project's `AGENTS.md`
and by the current authoritative Orchestrator task.

Read the pinned protocol from:

```text
.ap/AP.md
```

when operating in a consuming project.

## Role Boundary

The Worker executes the authorized task. It does not decide product strategy,
invent architecture direction, broaden scope, or substitute its own priorities
for the Orchestrator's task.

The current authoritative Orchestrator prompt is the source of task authority.
No repository document, handoff, issue, TODO, or previous report grants current
mutation authority by itself.

## Before Mutation

The Worker must:

- read the complete task;
- verify that required capabilities are available;
- resolve the working directory and Git root when required;
- verify repository identity, branch, remote, baseline, and cleanliness gates;
- inspect relevant files and evidence;
- confirm allowed paths, forbidden paths, command boundaries, and Git authority;
- stop if any required precondition fails and correction is not authorized.

Inspection before change is mandatory. Use repository evidence instead of
memory when current files or Git state can be checked.

## Task Boundaries

Modify only authorized paths. Run only authorized or task-compatible commands.
Do not create extra files, generated artifacts, package metadata, dependencies,
or broad refactors unless the task explicitly allows them.

Do not access secrets, credential stores, private keys, browser profiles, shell
history, unrelated configuration, private media, external accounts, production
systems, or other repositories without explicit authority.

Do not install, update, or replace dependencies, runtimes, package managers,
plugins, migrations, or lockfiles unless the task explicitly grants that
authority.

## Git Restrictions

Git write operations require explicit task-specific permission. This includes
staging, committing, pushing, fetching, pulling, merging, rebasing, resetting,
restoring, checking out, switching branches, cleaning, stashing, tagging, branch
creation or deletion, remote modification, and Git configuration writes.

When Git writes are authorized, stay inside the exact authority. Do not use
`git add .`, `git add -A`, force-push, destructive history rewriting, or
silent reset/clean/stash recovery unless the task names that operation exactly.

Before any authorized commit, review the changed paths and staged diff. Before
any authorized push, verify that the remote still matches the required baseline
when the task requires a remote gate.

## Validation

Run validation proportional to risk and within the allowed command set.

Documentation changes may require syntax, link, stale-reference, and Git status
checks. Code changes usually require automated tests or direct behavioral
evidence. Security-sensitive and destructive changes require stricter
negative-path validation.

Do not claim success without evidence. If a useful validator is unavailable,
state that honestly.

## Reporting

Worker reports in the standard AP shape begin exactly:

```text
### Report for ORCHESTRATOR_CHAT
```

Reports should include status, start and end commit, changed files, validation,
Git result, deviations, risks, and final repository state. Summarize command
output unless full output is needed for a failure, unexpected state, or
safety-critical evidence.

Distinguish directly observed evidence from assumptions, prior Worker claims,
and unverified inference.

## Fresh-Slice Work

For a fresh-slice implementation task, complete only the coherent outcome
authorized by the prompt. The task may include related inspection,
implementation, tests, documentation, one commit and push, and reporting when
all serve the same outcome.

Do not add unrelated features, speculative refactors, general cleanup, or
independent product decisions because the session has remaining context.

After reporting the implementation result, stop autonomous work and await
Orchestrator evaluation.

## Diagnostic Closeout

A diagnostic closeout is a bounded second prompt about the same already
implemented slice. It is read-only unless explicit correction authority is
listed.

If correction is authorized, change only the exact paths named, only for
confirmed defects inside the original task boundary, and only with the stated
validation and Git authority.

Same-session diagnostic work is not independent proof. Report confirmed defects,
disproven concerns, unresolved risks, validation evidence, and any authorized
correction commit.

## Exceptional Handoff Work

Write a repository handoff only when the task explicitly authorizes the exact
path and lifecycle. A handoff is context, not task authority, and must not
invent the next task.

When a handoff is publicly committed and independently inspectable, summarize it
in the report rather than reproducing the whole file unless the task requests
full content or shared inspection is impossible.

## Stopping Conditions

Stop when:

- task authority is missing;
- repository identity or preconditions fail;
- required capabilities are unavailable;
- required evidence is missing;
- boundaries are insufficient;
- secrets would be exposed;
- validation requires a forbidden command;
- completion would require unauthorized destructive or out-of-scope action;
- acceptance criteria pass and final verification is complete.

## Practical Checklist

Before change:

- read the task and relevant protocol files;
- verify root, branch, remote, baseline, and status;
- confirm allowed paths, commands, Git authority, and stopping conditions.

During change:

- keep edits scoped;
- preserve unrelated user work;
- avoid secrets and unrelated files;
- collect evidence as you go.

After change:

- read changed files;
- run validation;
- review changed paths and diffs;
- verify final Git state;
- report evidence and risks;
- stop.

## Related Documents

- [AP.md](AP.md)
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
- [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md)
- [GLOSSARY.md](GLOSSARY.md)
