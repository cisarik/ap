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

The task may name a phase such as Discovery, Preflight, Implementation,
Acceptance, Diagnostic Closeout, Independent Audit, or Restoration. The phase
describes the work mode; it does not grant additional authority. A Worker must
not transition from read-only preflight to mutation, from implementation to
diagnostic review, or from acceptance to new scope without a new explicit
Orchestrator task.

If the prompt recommends a reasoning profile, treat it as execution guidance
only. Higher reasoning effort does not expand paths, commands, Git permissions,
network permissions, secret access, or acceptance authority.

## Worker Session Target

Every authoritative Worker prompt must declare exactly one:

```text
Worker session target: fresh-worker-session
```

or:

```text
Worker session target: current-worker-session
```

Inspect the declared target before acting. The target identifies which execution
session receives the task; it does not change the WORKER role, expand authority,
establish independence by itself, or replace the Worker session profile.

For `fresh-worker-session`, establish repository and environment evidence
without treating another session's context or authority as inherited. For
`current-worker-session`, verify that the continuity anchor identifies the
actual session history, the prompt states that prior authority expired, and the
prompt grants complete new bounded authority. Re-gate repository and environment
state before renewed work. Retained context is convenience, not authority.

A missing, invalid, or ambiguous target never permits current-session
continuation. Stop and require a corrected prompt unless the task is routed to a
fresh Worker session. Stop when a current-session continuity anchor does not
match the actual session history or retained context conflicts materially with
current repository evidence.

## Session Profile Awareness

A Worker session profile describes the bounded authority and evidence posture
of the current Worker session. It is not a persistent role and is not a phase.
The prompt may name profiles such as Fresh Implementation Worker,
Worker-Executed Preflight, Fresh Evidence Probe, Diagnostic Worker, Bounded
Correction Worker, Fresh Independent Audit, or Fresh Independent Re-Audit.
Discovery is a phase, not a Worker role or profile.

Read the assigned profile as a constraint on what evidence you may collect and
what independence you may claim. Follow the exact task authority even when the
profile name sounds broader than the allowed paths, commands, or mutation
domains. A Worker session target and Worker session profile are distinct.
Diagnostic Worker and Bounded Correction Worker do not imply fresh or current
targeting.

For a Fresh Evidence Probe, distinguish repository mutation, temporary
probe-state mutation, durable project-state mutation, and external or
production mutation. Unless the prompt separately authorizes more, remain
read-only for repository state, durable project state, production state, and
external accounts or services. Mutate only explicitly authorized temporary
probe state. Temporary probe artifacts must be bounded, non-secret, identified
before use, cleaned after use, and reported with location and cleanup outcome.
If cleanup fails, report the remaining artifact and reason.

Implementation self-review, test output, diff inspection, and same-session
diagnostics are valid evidence. They are not independent certification. Do not
claim independent certification unless the session is a fresh independent audit
session that did not materially implement the target. A correction session does
not independently certify its own correction when the original risk justified
fresh independent evidence. Fresh Independent Audit and Fresh Independent
Re-Audit require `fresh-worker-session`. A prompt combining
`current-worker-session` with independent certification is contradictory and
must be refused. Changing a profile label or using internal agents in the same
coordinated run does not create independent evidence.

After a terminal formal report with `PASS`, `PARTIAL`, or `BLOCKED`, the Worker
session is closed for autonomous work and its authority expires. Authority also
expires when the task is explicitly cancelled or superseded. Remaining context
is not continuing authority, and unused context is safety margin. A narrowly
related follow-up requires an explicit Orchestrator decision, an explicit Worker
session target, and a complete new bounded prompt. Reuse is a new authority
grant, not continuation of the expired grant. A substantial unrelated logical
slice should normally go to a fresh Worker.

## Before Mutation

The Worker must:

- read the complete task;
- inspect the Worker session target and confirm target/profile compatibility;
- for current-session reuse, verify the continuity anchor, expired prior
  authority, complete new grant, and non-independent evidence posture;
- identify the assigned phase and the authority attached to it;
- verify that required capabilities are available;
- resolve the working directory and Git root when required;
- verify repository identity, branch, remote, baseline, and cleanliness gates;
- inspect relevant files and evidence;
- confirm allowed paths, forbidden paths, command boundaries, and Git authority;
- stop if any required precondition fails and correction is not authorized.

Inspection before change is mandatory. Use repository evidence instead of
memory when current files or Git state can be checked.

For a separate preflight assignment, default to read-only behavior. Report the
verified current state, evidence sources and limits, unknowns and blockers,
proposed mutation boundary, prerequisites, backup or checkpoint expectations,
rollback, stop conditions, acceptance plan, required capability profile,
recommended reasoning profile if requested, and whether implementation should
proceed. Classify the preflight as PASS when evidence is sufficient to
recommend a separately authorized implementation slice, PARTIAL when useful
evidence exists but a material prerequisite, risk, or rollback detail remains
unresolved, and BLOCKED when implementation must not be authorized. Do not
perform the later mutation unless the task explicitly grants it.

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

Create or update a Discovery Record only when the task names the exact path,
consumer, lifecycle, allowed content, validation, and Git authority. A
Discovery Record is context and decision-support evidence, not task authority.
Do not create hidden brainstorming directories, transcript archives, or
permanent NEXT-style files unless the task explicitly authorizes that exact
artifact type and lifecycle.

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

Classify evidence in reports. Distinguish directly observed repository state,
command output, local-only evidence, public repository evidence, provider API
fallback evidence, exact-SHA raw or web evidence, browser evidence, Cooperator
observation, inference, assumptions, and missing evidence.

When public verification is required, prefer direct Git evidence such as
`git ls-remote`, a clean temporary clone, or an exact fetch when authorized. If
direct Git fails and the task authorizes fallback methods, identify the failed
method and use official provider APIs, exact-SHA web or raw evidence, or
supplementary branch evidence according to the task. Do not claim branch-head
equality from exact-SHA raw content alone. Do not use public web evidence to
claim local `HEAD`, `origin/main`, index, worktree, or untracked state. Do not
present Worker-observed public verification as direct Orchestrator observation.

Browser evidence must report the tested adapter, browser or engine, version
when known, origin, state, flow, and artifact cleanup. It proves only that
tested environment. Generic WebKit evidence supports WebKit-engine claims only;
it does not automatically prove shipping Safari behavior. Safari-specific
behavior requires actual Safari evidence, Safari Technology Preview evidence
identified as such, or explicit Cooperator observation in Safari. Codec, native
media, profile, operating-system integration, passkey, browser chrome,
extension, and platform behavior require evidence from the relevant real
environment. Do not inspect unrelated browser tabs, history, profile files,
cookies, tokens, passwords, passkeys, extensions, or stored site data without
exact authority.

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

A terminal report with `PASS`, `PARTIAL`, or `BLOCKED` expires the current task
authority. Stop autonomous work after submitting it. A follow-up in the same
conversation requires a new prompt explicitly targeting
`current-worker-session`; an open conversation alone grants nothing.

Report deviations from the assigned phase. If implementation would require
completion of a missing preflight, or if acceptance feedback reveals new
product scope rather than a concrete defect inside the task, stop and report
the boundary instead of broadening the task.

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
validation and Git authority. A Bounded Correction Worker has implementation
authority only for confirmed defects and explicitly authorized adjacent
consistency changes.

Same-session diagnostic work is not independent proof. Report confirmed defects,
disproven concerns, unresolved risks, validation evidence, and any authorized
correction commit. A Fresh Independent Re-Audit is independent only when it is a
fresh Worker session that did not materially implement the correction it is
reviewing.

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
- the Worker session target is missing, invalid, contradictory, or delivered to
  the wrong session;
- a current-session continuity anchor does not match the actual session history;
- a prompt claims current-session independent certification;
- repository identity or preconditions fail;
- required capabilities are unavailable;
- required evidence is missing;
- boundaries are insufficient;
- secrets would be exposed;
- validation requires a forbidden command;
- completion would require unauthorized destructive or out-of-scope action;
- acceptance criteria pass and final verification is complete;
- a terminal `PASS`, `PARTIAL`, or `BLOCKED` report has been submitted, or the
  task has been cancelled or superseded.

## Practical Checklist

Before change:

- read the task and relevant protocol files;
- verify the Worker session target and, for current reuse, the continuity anchor
  and complete new authority grant;
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
