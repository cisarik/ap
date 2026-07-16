# Analytic Programming FAQ

## What is Analytic Programming?

Analytic Programming is a way to run software work with clear roles, bounded
tasks, repository evidence, validation, and deliberate session rotation.

The human owner is the Cooperator. The Orchestrator shapes and verifies work.
The Worker performs one bounded task and reports evidence.

## Is AP software?

AP is primarily a protocol, not an application framework or hosted service.
This repository includes a small dependency-free `ap` integration tool because
the protocol is distributed as a pinned Git submodule.

## Which file is normative?

[AP.md](AP.md) is the single live normative protocol. Earlier generations are
available through Git history, not as parallel current files.

## How do I add AP to a clean Git project?

Run:

```sh
git submodule add https://github.com/cisarik/ap.git .ap
./.ap/ap init
./.ap/ap doctor
```

Review `.gitmodules`, the `.ap` gitlink, and `AGENTS.md`, then commit them in
the consuming project when an explicit project task authorizes that commit.

## What do I run after cloning a project that already uses AP?

Use standard Git submodule initialization:

```sh
git submodule update --init --recursive
./.ap/ap doctor
```

You can also clone with:

```sh
git clone --recurse-submodules <project-url>
```

## Where do project-specific rules live?

In the consuming project's root `AGENTS.md`, outside the managed AP integration
block. The managed block points to `.ap/AP.md` and the universal AP handbooks.
It must not duplicate the protocol.

## Why should I not edit `.ap/` during ordinary project work?

`.ap/` is the pinned AP protocol dependency. Editing it during ordinary project
work creates local protocol changes that are not reviewed as an AP update and
may not be reproducible for other participants.

To change AP behavior for a project, run an explicit AP update task or record
project-specific constraints outside the managed block in root `AGENTS.md`.

## How do I check for an AP update?

Run:

```sh
./.ap/ap update --check
```

This reports the currently pinned AP commit and the available canonical
`main` commit.

## How do I apply an update?

Run:

```sh
./.ap/ap update --apply
./.ap/ap doctor --candidate
git diff --submodule
git add .ap
./.ap/ap doctor
```

Validate the consuming project, then commit the changed `.ap` gitlink under an
explicit project task. The tool never commits or pushes for you.

## How do I roll back AP?

Check out the earlier AP commit inside `.ap/`, validate, and commit the changed
gitlink in the consuming project:

```sh
git -C .ap checkout --detach <previous-ap-sha>
./.ap/ap doctor --candidate
git diff --submodule
git add .ap
./.ap/ap doctor
git commit -m "docs: roll back analytic programming"
```

## How does a fresh Orchestrator start?

The Cooperator supplies a task or restoration prompt. The fresh Orchestrator
reads the project root `AGENTS.md`, the pinned `.ap/AP.md`,
`.ap/AP_ORCHESTRATOR.md`, prompt contracts as needed, and current repository
evidence. The restoration prompt grants no mutation authority; verification
comes first.

## How does a fresh Worker receive authority?

Only through the current authoritative Orchestrator task prompt. The Worker
reads the project rules and pinned AP files, verifies the repository gate, and
acts only inside the task's boundaries. The prompt declares:

```text
Worker session target: fresh-worker-session
```

Freshness does not create a new permanent role. The session is still assigned to
the WORKER role.

## Must every Worker task use a fresh session?

No. Fresh Worker is the safe default and is required for independent
certification, but a current session may be reused for a direct continuation,
missing evidence, bounded self-correction, interrupted-task resumption after
re-gating, or report repair.

## When may the current Worker be reused?

Only when a new authoritative prompt explicitly declares:

```text
Worker session target: current-worker-session
```

The prompt must identify the intended prior task or report, state that old
authority expired, grant complete new bounded authority, require re-gating, and
classify the result as non-independent. Retained context is convenience, not
authority.

## What happens if the Worker session target is missing?

A missing, invalid, or ambiguous target never authorizes current-session reuse.
The task must be routed to a fresh Worker session or corrected before work
continues.

## Why is preflight sometimes separate?

Some work is too risky to authorize for mutation before current state is known:
deployment, real hosts, durable data, credentials, authentication,
authorization, storage, physical devices, destructive actions, or unclear
rollback. In those cases AP uses a separate read-only preflight to verify state,
limits, prerequisites, rollback, and acceptance before deciding whether to
mutate anything.

A preflight can be performed by a read-only Worker, or led by the Orchestrator
with the Cooperator executing one small command or observation at a time in the
real environment. The second mode is useful for real hosts, sudo, SSH, local
console, browser, storage, account, or physical-device evidence. A PASS
preflight only means implementation can be recommended in a new bounded prompt;
it does not grant mutation authority.

## Why is preflight not mandatory for every task?

Every implementation task still has embedded preflight: inspect first, verify
the repository gate, check capabilities, and confirm boundaries. A separate
preflight is reserved for work where mutation authority would be premature.
Small documentation fixes and ordinary bounded code changes should not become a
ceremony.

## Why does not every commit need an independent audit?

Independent audit is evidence, not ceremony. The Orchestrator chooses the
lowest sufficient evidence profile for the risk, uncertainty, and evidence
cost. Direct acceptance, implementation evidence review, diagnostic closeout,
Fresh Evidence Probe, fresh independent audit, bounded correction, and fresh
independent re-audit form a selection ladder, not a mandatory sequence.

Fresh independence is more appropriate for durable-data migration, security or
trust boundaries, concurrency, authentication, secret handling, deployment,
production mutation, difficult rollback, ambiguous repository or runtime state,
large cross-cutting diffs, weak or heavily mocked tests, implementation Worker
context pressure, previous independent audit failure, or correction after an
independently discovered defect.

## Why can fresh sessions improve evidence quality?

A fresh Worker session starts with a bounded prompt instead of accumulated
implementation assumptions. That can make it easier to notice contradictions,
test gaps, stale state, or overbroad claims. Freshness is useful when the added
independence is proportionate; AP does not require a new session for every tiny
follow-up.

## What is the difference between self-review and independent certification?

Implementation self-review, tests, diff inspection, and same-session diagnostic
work are valid evidence. They help prove what was changed and checked. They
are not independent certification because the same session materially shaped or
implemented the target. Independent certification requires a fresh Worker
session that did not materially implement what it is certifying. An
implementation Worker cannot independently audit itself, and changing its
profile label does not create independence.

## What may a Fresh Evidence Probe mutate?

Only explicitly authorized temporary probe state. A probe prompt must
distinguish repository mutation, temporary probe-state mutation, durable
project-state mutation, and external or production mutation. Unless separately
authorized, the probe is read-only for repository state, durable project state,
production state, and external accounts or services. Temporary artifacts must
be bounded, non-secret, identified before use, cleaned after use, and reported
with their location and cleanup result.

## Why is remaining Worker context not authority?

A Worker receives authority from the current Orchestrator task prompt, not from
unused context capacity. After a terminal `PASS`, `PARTIAL`, or `BLOCKED`
report, the authority expires and the Worker session is closed for autonomous
work. Cancellation or supersession also expires authority. A related follow-up
requires a new prompt with an explicit Worker session target and a complete new
bounded grant; a substantial unrelated slice should normally use a fresh
Worker.

## Does an open chat retain Worker authority?

No. An open conversation, retained repository context, or remaining context
capacity does not preserve expired authority. Reuse of that chat requires a new
prompt targeting `current-worker-session`.

## When does a correction need re-audit?

When independent evidence found a defect, the normal proportional sequence is
independent finding, bounded correction, and fresh independent re-audit when
the original risk still justifies fresh evidence. Re-audit is not universal.
The Orchestrator may directly accept genuinely trivial, low-risk, mechanical
corrections when evidence is strong enough.

## Why does the Orchestrator recommend reasoning effort?

Some execution clients expose a reasoning setting. Before every Worker prompt,
the Orchestrator recommends the lowest sufficient profile and briefly explains
why, so the Worker has an appropriate level of care for the task's risk and
ambiguity. No recommendation is needed when the Orchestrator acts directly
without a Worker.

## Why is Extra High not always better?

Extra High reasoning can be useful for protocol architecture, authentication,
cryptography, destructive migration, severe corruption risk, or unusually
ambiguous architecture. For ordinary tasks it can waste resources and slow the
work without adding useful evidence. Standard or High is often more
proportionate.

## Does Worker reasoning grant authority?

No. Reasoning effort is execution guidance only, and the Cooperator keeps final
control over available client settings. Authority still comes from the current
Orchestrator task prompt: exact paths, commands, Git operations, network
access, browser scope, secrets, validation, and stopping rules.

## How do browser automation and visual acceptance differ?

Browser automation proves only the tested browser or engine, version, origin,
state, and flow. A Chromium test proves only that Chromium environment. A
Firefox test proves only that Firefox environment. Generic WebKit automation is
WebKit-engine evidence, not automatic proof of the shipping Safari browser.
Safari-specific claims need actual Safari evidence, Safari Technology Preview
evidence identified as such, or explicit Cooperator observation in Safari.
Cooperator rendered acceptance covers subjective or physical UX judgment after
Worker evidence is verified.

## Why can public verification use different evidence paths?

Direct Git evidence such as `git ls-remote`, exact fetch, or a clean temporary
clone is preferred for proving public refs. If one environment cannot use
direct Git, an official provider API, exact-SHA web content, or branch page may
provide fallback evidence. Those evidence classes are not equal. A Worker
mutation gate that requires public-ref equality is BLOCKED if no authorized
method proves the ref. Independent Orchestrator acceptance can PASS from
fallback evidence only when branch ref identity, exact commit identity, and
committed content at that SHA are all established. Exact-SHA raw content can
prove a file at a commit, but it does not by itself prove that the commit is
the current branch head.

## When should brainstorming be recorded?

Most brainstorming can stay in the conversation and be summarized by the
Orchestrator. A project-owned Discovery Record is useful only when unresolved
exploration spans sessions, has a future consumer, would be costly to
reconstruct, influences a major decision, or preserves alternatives for later
review. It is not task authority and should not be a hidden transcript archive.
It must not be the sole live source of an accepted product, architecture,
security, or operating decision; accepted conclusions belong in ADRs,
specifications, project rules, roadmaps, or security artifacts.

## Why are permanent NEXT files still unnecessary?

At rotation, the normal artifact is a professional self-contained restoration
prompt delivered to the Cooperator, backed by repository truth, public
verification, accepted decisions, and Worker evidence. It includes PASS,
PARTIAL, or BLOCKED classification, identity, last verified public commit or
limitation, AP pin when applicable, completed boundary, accepted decisions,
authority boundaries, active Worker and mutation state, unresolved risks,
current phase, next step, next Worker reasoning recommendation or premature
statement, verification requirements, and a no-mutation-authority statement.
Permanent NEXT or BOOT files tend to become stale session state. Repository
handoffs remain exceptional for unreconstructable state with explicit lifecycle
authority.

## Why is rotation qualitative rather than token-percentage based?

AP cannot assume every client exposes reliable context telemetry. The
Orchestrator watches qualitative signals instead: session duration, closed
logical blocks, superseded state, Worker report complexity, unresolved
decisions, repeated reconstruction effort, contradictions between memory and
repository truth, loss of precision, and quality drift. The goal is to signal a
restoration boundary before reliability degrades, not to rotate mechanically
after every commit.

## When is a diagnostic pass used?

After a substantial or risky implementation slice, the Orchestrator may issue
one diagnostic closeout prompt about the same slice. It is read-only by default
and is not a second feature task.

## When is a handoff artifact needed?

Only when material state cannot be safely reconstructed from committed
repository truth, public verification, durable decisions, and the next task. A
handoff is exceptional context, not task authority.

## Who commits a required repository handoff?

A Worker commits it only under an explicit Orchestrator task that names the
path, lifecycle, validation, and Git authority. The Cooperator is not required
to manually edit and commit handoffs by default.

## How do I migrate a project that contains copied old AP files?

Use [INTEGRATION.md](INTEGRATION.md#migrating-from-copied-ap-files). The short
version is: start from a clean baseline, inventory copied files, preserve any
real project-specific constraints in root `AGENTS.md`, add `.ap` as a
submodule, run `./.ap/ap init`, remove superseded universal copies only after
review, validate, and commit one reviewable migration.

## Where are previous protocol generations?

In Git history. The live tree intentionally contains one current protocol so
new users and tools have one clear source of truth.

## Does AP require a public repository?

No. Public remotes make independent commit verification easier. Private or
local-only projects can still use AP, but the Orchestrator must rely on
available repository evidence and Worker-supplied local evidence when public
inspection is impossible.

## Can several Workers run at the same time?

The current protocol is sequential at the AP boundary. Use one accountable
Worker assignment at a time. A separate fresh audit Worker may be used
sequentially for high-risk review.

## Related Reading

- [AP.md](AP.md)
- [INTEGRATION.md](INTEGRATION.md)
- [UPDATING.md](UPDATING.md)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
