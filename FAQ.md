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
acts only inside the task's boundaries.

## Why is preflight sometimes separate?

Some work is too risky to authorize for mutation before current state is known:
deployment, real hosts, durable data, credentials, authentication,
authorization, storage, physical devices, destructive actions, or unclear
rollback. In those cases AP uses a separate read-only preflight to verify state,
limits, prerequisites, rollback, and acceptance before deciding whether to
mutate anything.

## Why is preflight not mandatory for every task?

Every implementation task still has embedded preflight: inspect first, verify
the repository gate, check capabilities, and confirm boundaries. A separate
preflight is reserved for work where mutation authority would be premature.
Small documentation fixes and ordinary bounded code changes should not become a
ceremony.

## Why does the Orchestrator recommend reasoning effort?

Some execution clients expose a reasoning setting. The Orchestrator recommends
the lowest sufficient profile so the Worker has an appropriate level of care
for the task's risk and ambiguity.

## Why is Extra High not always better?

Extra High reasoning can be useful for protocol architecture, authentication,
cryptography, destructive migration, severe corruption risk, or unusually
ambiguous architecture. For ordinary tasks it can waste resources and slow the
work without adding useful evidence. Standard or High is often more
proportionate.

## Does Worker reasoning grant authority?

No. Reasoning effort is execution guidance only. Authority still comes from the
current Orchestrator task prompt: exact paths, commands, Git operations,
network access, browser scope, secrets, validation, and stopping rules.

## How do browser automation and visual acceptance differ?

Browser automation proves only the tested engine, version, origin, state, and
flow. A Chromium test does not prove Safari behavior. Cooperator rendered
acceptance covers subjective or physical UX judgment after Worker evidence is
verified. The Orchestrator keeps automated evidence, Cooperator observations,
defects, missing evidence, and adjacent ideas separate.

## Why can public verification use different evidence paths?

Direct Git evidence such as `git ls-remote`, exact fetch, or a clean temporary
clone is preferred for proving public refs. If one environment cannot use
direct Git, an official provider API, exact-SHA web content, or branch page may
provide fallback evidence. Those evidence classes are not equal: exact-SHA raw
content can prove a file at a commit, but it does not by itself prove that the
commit is the current branch head.

## When should brainstorming be recorded?

Most brainstorming can stay in the conversation and be summarized by the
Orchestrator. A project-owned Discovery Record is useful only when unresolved
exploration spans sessions, has a future consumer, would be costly to
reconstruct, influences a major decision, or preserves alternatives for later
review. It is not task authority and should not be a hidden transcript archive.

## Why are permanent NEXT files still unnecessary?

At rotation, the normal artifact is a fresh restoration prompt delivered to the
Cooperator, backed by repository truth, public verification, accepted
decisions, and Worker evidence. Permanent NEXT or BOOT files tend to become
stale session state. Repository handoffs remain exceptional for
unreconstructable state with explicit lifecycle authority.

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
