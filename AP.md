# Analytic Programming Protocol

Analytic Programming (AP) is a protocol for software work where intent,
evidence, bounded authority, validation, public verification, and deliberate
session rotation matter more than conversational momentum.

This is the single live normative protocol file for the AP source repository.
Previous protocol generations are historical material in Git history, not
parallel live files.

## 1. Distribution Model

The canonical AP repository owns the universal protocol, universal handbooks,
prompt contracts, artifact lifecycle rules, glossary, and integration tooling.

A consuming project normally integrates AP as a pinned Git submodule at:

```text
.ap/
```

The protocol read by that project is:

```text
.ap/AP.md
```

The consuming project must not copy and customize universal AP documents into
its own root. It may keep project-specific rules in its own `AGENTS.md`, with a
managed AP integration block created by `./.ap/ap init`.

The submodule gitlink records the exact AP commit that governs the project.
Updates are explicit: check the available AP commit, move the submodule pointer
only through a reviewable update command, validate compatibility, then commit
the changed gitlink in the consuming project.

## 2. Roles

AP uses three persistent protocol roles.

The **COOPERATOR** is the human project owner. The Cooperator owns strategic
intent, approves important alternatives, performs physical-device and
account-level actions, executes explicitly assigned human steps, returns
complete outputs, and approves irreversible or security-sensitive operations.

The **ORCHESTRATOR** is the coordination layer. The Orchestrator preserves
project coherence, understands Cooperator intent, inspects source-of-truth
evidence, shapes the smallest safe Worker task, defines boundaries and
acceptance criteria, reviews Worker reports, verifies public commits when
available, detects scope expansion, and decides whether to accept, correct,
continue, pause, rotate, or close a session.

The **WORKER** is the execution role. A Worker executes one bounded
authoritative task, validates the result, and returns evidence. The Worker
inspects before modifying, maintains task boundaries, runs permitted checks,
reports evidence honestly, and stops when required evidence is missing or the
task is complete.

The uppercase names are protocol abstractions. They are not chats, models,
providers, IDEs, CLIs, hosted services, or concrete sessions.

## 3. Instances, Sessions, and Capability Profiles

An Orchestrator instance is one concrete initialized entity temporarily assigned
to the ORCHESTRATOR role. A Worker instance is one concrete initialized entity
temporarily assigned to the WORKER role. A session is the bounded lifecycle and
context of one concrete instance.

Execution clients, agent implementations, models, and providers are separate
identity layers. AP is vendor-neutral and does not require a particular tool,
context size, model family, or hosted service.

A Worker capability profile describes what the active Worker implementation can
do in the current session: repository access, filesystem writes, shell access,
Git access, network access, test execution, browser automation, multimodal
inspection, visible context telemetry, or internal delegation.

Required capabilities must be stated functionally in the task. Tool
availability does not grant permission. If a required capability is unavailable,
the Worker must stop before modification and report the limitation.

A multi-agent Worker implementation is still one accountable WORKER at the AP
boundary. Internal delegation must not expand authority, hide commands, or split
responsibility. The reporting Worker remains accountable for one consolidated
report.

## 4. Source of Truth and Evidence

Repository files describe documented and implemented state.

Tests and executable checks describe verified behavior.

Git history describes committed changes.

Public committed state is stronger shared evidence than local uncommitted
state.

Architecture decision records, specifications, and project rules are durable
source material when the project uses them.

Worker reports are structured claims supported by evidence. They are not proof
by themselves.

When sources conflict, participants must identify the exact conflict and decide
whether a source is stale, incomplete, misunderstood, or intentionally
superseded. Strategic conflicts are escalated to the Cooperator.

## 5. Task Authority

The current authoritative Orchestrator task prompt is the only source of
concrete Worker task authority.

Repository documents, ADRs, issue text, handoff artifacts, roadmaps, previous
reports, and remembered context may provide evidence or constraints, but they
do not authorize current modification by themselves.

A strong Worker task names the goal, working directory, repository identity,
preconditions, required reading, allowed paths, forbidden paths, allowed
commands, forbidden commands, Git authority, dependency authority, network and
secret authority, validation, acceptance criteria, stopping conditions, and
report format.

Omitted permission is not implied permission.

## 6. Orchestrator Responsibilities

The Orchestrator should:

- restate Cooperator intent in operational terms;
- inspect repository evidence before shaping implementation work;
- select the lightest artifact that can answer the current question;
- ask one strategic or security-sensitive question at a time;
- define one coherent Worker task with explicit boundaries;
- distinguish assumptions from verified facts;
- review Worker reports against the original task contract;
- verify public commits when available;
- classify outcomes as PASS, PARTIAL, or BLOCKED;
- decide whether a diagnostic closeout, correction task, rotation, or pause is
  proportionate.

The Orchestrator is not a passive prompt relay and must not treat a Worker
report as proof without evidence.

## 7. Worker Responsibilities

The Worker must:

- read the complete task before acting;
- verify working directory, repository identity, branch, baseline, and relevant
  preconditions before mutation;
- inspect relevant files and state before changing them;
- change only authorized paths;
- run only authorized or task-compatible commands;
- avoid unrelated refactors and adjacent features;
- avoid accessing secrets, private data, credential stores, browser profiles, or
  unrelated filesystem paths without explicit authority;
- avoid dependency, toolchain, migration, or package-manager changes without
  explicit authority;
- validate proportionally;
- report deviations, failures, missing evidence, and risks honestly;
- stop after acceptance criteria pass and final verification is complete.

## 8. Git and Remote Safety

Git write operations require explicit task-specific authority. Git writes
include staging, committing, pushing, fetching, pulling, merging, rebasing,
resetting, restoring, checking out, switching branches, cleaning, stashing,
tagging, branch creation or deletion, remote modification, and Git configuration
writes.

When Git writes are authorized, the task should name the expected starting
commit, branch, remote identity, exact stage/commit/push authority, commit
subject, pre-commit remote gate, and post-push verification.

Workers must not use `git add .`, `git add -A`, force-push, destructive history
rewriting, reset, clean, stash, or remote rewriting as silent recovery unless
the task names that operation exactly.

Remote identity checks compare meaningful dimensions such as host, owner,
repository name, branch, and refs. Cosmetic spelling differences such as an
optional `.git` suffix should not fail a gate unless the task requires exact URL
text for a specific reason. Workers must not modify Git configuration merely to
normalize spelling.

## 9. Security Boundaries

Workers must not inspect, print, copy, transform, commit, or transmit secrets
unless a task explicitly authorizes the minimum necessary access.

Repository authority does not imply authority over unrelated home-directory
files, private media, browser profiles, credential stores, external accounts,
mounted devices, cloud storage, production systems, or other repositories.

Network access, external provider calls, deployment, publication, uploads, and
remote service mutations require explicit authority and must remain bounded.

Destructive or difficult-to-reverse operations require explicit approval.
Examples include deleting durable data, removing files, applying destructive
migrations, rewriting published history, rotating credentials, changing access
controls, and altering production infrastructure.

## 10. Browser and Rendered Acceptance Automation

Browser automation is an optional Worker capability, not an inherent protocol
power.

Any task using browser automation should define the permitted adapter, origins,
URLs, interactions, observations, network access, account state, storage
inspection, screenshots, logs, temporary artifacts, and cleanup.

Workers must not inspect unrelated tabs, browser history, bookmarks, passwords,
passkeys, cookies, tokens, extensions, profile files, or website storage outside
the authorized scope. Workers must not change browser, operating-system,
accessibility, automation, remote-control, or security settings without
Cooperator authorization.

Reports must distinguish rendered browser evidence, synthetic intercepted
responses, automated non-browser tests, static inspection, and Cooperator
observations.

## 11. Validation and Public Verification

Validation is proportional to risk.

Documentation work may require formatting, link, semantic, and Git status
checks. Code work usually requires automated tests or direct behavioral
evidence. Security-sensitive, data-integrity, migration, and destructive work
requires stricter negative-path validation and sanitization.

A Worker must not claim success without evidence. A report should distinguish
directly observed facts, command output, local-only evidence, public repository
evidence, inference, and unresolved assumptions.

When a public remote is available, the Orchestrator should independently inspect
the public commit SHA, tree, changed paths, diff, and raw content before
accepting a pushed Worker result.

## 12. Artifact Lifecycle and Repository Hygiene

Committed documentation and evidence artifacts require a clear lifecycle:
classification, authority level, intended consumer, discoverability, retention
or cleanup trigger, and cleanup owner.

AP uses five artifact classes:

1. transient evidence;
2. temporary committed evidence;
3. retained evidence;
4. normative durable artifacts;
5. operational lifecycle artifacts.

Use the lightest sufficient artifact. Prefer an evidence-dense Worker report
over a committed research file when the report is enough.

Git history is the historical archive. The live tree should represent current,
usable project knowledge. Do not retain obsolete protocol copies, consumed
evidence, stale handoffs, or orphan templates merely for traceability.

Deleting temporary, retained, or normative artifacts still requires explicit
task authority. A retention trigger identifies when cleanup may be appropriate;
it does not authorize deletion by itself.

## 13. Session Rotation and Dynamic Prompts

Conversational context is temporary. Repository files, tests, commits, ADRs,
and verified public state are durable source material.

At a coherent logical boundary, an Orchestrator may decide that rotation is
appropriate. The normal rotation output is a professional, self-contained
restoration prompt for a fresh Orchestrator instance. The Cooperator may paste
that prompt into a fresh session.

The restoration prompt should include role identity, repository identity, exact
last verified public commit, completed logical boundaries, accepted decisions,
evidence classification, security and authority boundaries, active Worker
state, unresolved decisions, a recommended next bounded step, an explicit
verification requirement, and a PASS, PARTIAL, or BLOCKED restoration
classification.

Restoration text grants no repository or host mutation authority. The fresh
Orchestrator must verify repository and public truth independently before
continuing.

Permanent session-state files are not a default AP distribution artifact. A
repository handoff is exceptional and belongs in a consuming project only when
material state cannot be safely reconstructed from durable repository evidence
and the next authoritative task. If required, a Worker writes it under an exact
Orchestrator task with explicit consumer, lifecycle, and Git authority. The
Cooperator is not required to manually edit and commit such a handoff.

## 14. Fresh-Slice Implementation and Diagnostic Closeout

For a substantial coherent task, the Orchestrator may assign one fresh Worker
instance to one implementation slice. The task may combine tightly related
inspection, research, architecture recording, implementation, tests,
documentation, one normal commit and push, and evidence reporting when all serve
one primary outcome.

The task must not combine unrelated features, speculative refactors,
independent product decisions, broad cleanup, or operational mutations merely
because the Worker has remaining context capacity. Context consumption is not a
goal.

After the implementation report, the Orchestrator compares the original task
contract, Worker report, public commit and diff when available, tests,
documentation claims, and unresolved risks. The Orchestrator then decides
whether direct acceptance is sufficient or one diagnostic closeout is
proportionate.

A diagnostic closeout is a second authoritative prompt about the same already
implemented slice. It is read-only by default. Correction authority must be
explicit, limited to confirmed defects inside the original task boundary,
constrained by exact paths, and normally completed in one corrective commit.

For exceptionally high-risk areas, the Orchestrator may use a separate fresh
Worker instance for sequential independent audit. This is not parallel
execution.

## 15. Numbered Cooperator Acceptance Feedback

For user-visible work where rendered behavior, media playback, physical
interaction, device state, or native UI matters, the Orchestrator should prepare
a numbered checklist of independently observable outcomes after Worker evidence
is verified.

The Cooperator may answer each item with `PASS`, `FAIL`, `NOT TESTED`, or a
status plus `+` commentary. The `+` marker adds evidence or adjacent feedback;
it does not silently change the item status.

The Orchestrator classifies responses as accepted behavior, concrete defects,
missing evidence, new product decisions, or adjacent scope. Concrete defects may
become bounded correction tasks. New ideas do not automatically expand the
current task.

## 16. Compact Communication

Repositories may use compact communication when stable protocol documents
already define safety rules.

A compact Worker prompt may reference `.ap/AP.md`, `.ap/AP_WORKER.md`, and
project-specific `AGENTS.md` instead of repeating them. It must still define the
task-specific goal, repository gate, allowed paths, prohibitions, Git authority,
validation, acceptance criteria, stopping conditions, and report format.

Worker reports should be evidence-dense. Unless a task requires more detail, a
report should include status, start and end commit, changed files, validation,
commit and push result, deviations or risks, and one proposed next step.

Every Worker report using the standard AP format begins exactly:

```text
### Report for ORCHESTRATOR_CHAT
```

## 17. Stopping Conditions

A Worker must stop when repository identity fails, a precondition fails,
authority is missing, required evidence is missing, required capabilities are
unavailable, secrets would be exposed, validation requires a forbidden command,
the task would require unauthorized destructive action, authentication fails in
an unsafe way, or completion would require out-of-scope changes.

The Worker also stops when acceptance criteria and focused validation pass and
authorized Git operations and verification are complete.

## 18. Anti-Patterns

AP rejects:

- implementation before inspection;
- silent scope expansion;
- treating reports as proof;
- conflating local uncommitted state with public committed state;
- hidden dependency or toolchain changes;
- Git writes without task authority;
- retaining obsolete protocol generations in the live tree;
- copying and customizing universal AP protocol files in each project;
- unpinned remote-main consumption;
- silently updating AP behavior in consuming projects;
- permanent empty session handoff files as ceremony;
- manual Cooperator handoff commits as the default rotation mechanism;
- using a diagnostic pass as a hidden second feature task;
- intentional context exhaustion;
- vendor-specific normative requirements.

## Related Documents

- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
- [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md)
- [GLOSSARY.md](GLOSSARY.md)
- [INTEGRATION.md](INTEGRATION.md)
- [UPDATING.md](UPDATING.md)
- [CHANGELOG.md](CHANGELOG.md)
- [docs/adr/](docs/adr/)
