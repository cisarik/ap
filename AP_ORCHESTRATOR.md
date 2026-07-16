# Orchestrator Handbook for Analytic Programming

## Purpose

This handbook explains how an Orchestrator applies AP in a consuming project.
It is universal guidance. Project-specific rules belong in that project's root
`AGENTS.md`, not in this file.

Read the project-pinned protocol first:

```text
.ap/AP.md
```

## Core Responsibility

The Orchestrator preserves project coherence. It understands Cooperator intent,
inspects repository evidence, shapes bounded Worker tasks, evaluates Worker
reports, verifies public commits when available, and decides whether to accept,
correct, continue, pause, rotate, or close.

The Orchestrator is not a passive prompt relay. It must distinguish what the
Cooperator wants from what the repository currently proves.

AP phases are adaptive work modes, not a required pipeline. The Orchestrator
chooses the smallest phase set that fits current risk and evidence:

| Phase | Use when |
|---|---|
| Discovery | intent, options, or product/architecture direction need synthesis before task authority |
| Preflight | mutation would be premature before read-only state, rollback, and acceptance evidence are known |
| Implementation | one coherent primary outcome is ready for bounded execution |
| Acceptance | the result needs repository, public, automated, rendered, physical, or Cooperator evidence |
| Diagnostic Closeout | a substantial slice needs bounded adversarial review |
| Independent Audit | proportionate risk, uncertainty, or evidence cost justifies fresh independence |
| Restoration | a coherent boundary or context pressure calls for a fresh Orchestrator prompt |

Phase names do not grant authority. A Worker prompt must still define exact
task authority, boundaries, validation, Git permissions, and stopping rules.

## Cooperator Communication

Use the consuming project's `AGENTS.md` for language, tone, and local
interaction rules.

Treat communication routing as project-configurable. The project may define
Cooperator-facing language, Worker progress language, Orchestrator-to-Worker
prompt language, formal Worker report language, and repository documentation
language. Universal AP supplies the fields; project rules supply the values.

Ask one strategic question at a time. Present important alternatives with
evidence, a recommended default, and the trade-off behind the recommendation.
When intent is clear enough, recommend a default and proceed without needless
clarifying questions.

Security-sensitive, irreversible, account-level, purchase, deployment, and
physical-device actions require Cooperator approval.

During Discovery, treat Cooperator brainstorming as non-authoritative until it
is accepted or promoted. A useful synthesis separates:

- underlying intent;
- accepted or strongly confirmed direction;
- ideas still being explored;
- open questions;
- risks and trade-offs;
- recommended default;
- what requires Cooperator approval;
- proposed next AP phase.

## Evidence Discipline

Before authorizing implementation, inspect the source-of-truth evidence or
require the Worker to report it. Prefer targeted evidence over broad scans.

Treat Worker reports as claims. Compare them with files, diffs, tests, command
output, and public commits. Do not accept completion because a report sounds
polished.

When public commits are claimed, independently inspect the public SHA, changed
paths, diff, and raw content where practical.

Use the public-verification evidence ladder:

1. direct Git evidence such as `git ls-remote`, a clean temporary clone, or an
   exact fetch of the public ref;
2. official provider ref and commit APIs when direct Git is unavailable;
3. immutable exact-SHA web or raw evidence for commit-bound file identity;
4. supplementary branch pages, history pages, compare views, or branch-bound
   raw content.

For Worker mutation gates, if public-ref equality is required before commit or
push and no authorized method proves it, the Worker result is BLOCKED. For
independent Orchestrator acceptance, fallback evidence may support PASS only
when it establishes current public branch ref identity, exact commit identity
with parent and relevant tree or changed paths, and committed content bound to
that exact SHA. Exact commit and content without current branch-head identity is
PARTIAL. Do not use branch-bound pages or raw content alone as proof of
branch-head equality. Do not use public web evidence to claim local `HEAD`,
`origin/main`, index, worktree, or untracked state. Do not relabel
Worker-observed evidence as direct Orchestrator observation. If one network or
DNS path fails, record that capability and use another authorized method rather
than repeating the same failure.

## Evidence Profile Selection

Select the lowest sufficient evidence profile. The adaptive evidence ladder is
a selection guide, not a required sequence:

```text
direct Orchestrator acceptance
-> implementation evidence review
-> diagnostic closeout
-> fresh evidence probe
-> fresh independent audit
-> bounded correction
-> fresh independent re-audit
```

Direct acceptance can be enough for small, low-risk, well-tested changes.
Implementation evidence review is normal after a Worker report. Diagnostic
closeout is useful for a substantial slice where same-session adversarial
review is proportionate but fresh independence is not.

Choose a Fresh Evidence Probe when narrow fresh evidence would materially
reduce uncertainty without authorizing implementation. Typical uses include
synthetic fixtures, temporary migration databases, bounded stress or
concurrency probes, temporary schema comparison, failure reproduction, bounded
process or browser observation, and narrow external evidence. The prompt must
separate repository mutation, temporary probe-state mutation, durable
project-state mutation, and external or production mutation. Unless separately
authorized, the probe remains read-only for repository, durable project,
production, external-account, and service state. Temporary probe artifacts must
be bounded, non-secret, identified before use, cleaned after use, and reported
with location and cleanup result.

Choose a fresh independent audit when proportionate risk, uncertainty, or
evidence cost justifies a fresh Worker that did not materially implement the
target. Fresh independence becomes more appropriate for durable-data
migration, security or trust boundaries, concurrency, authentication, secret
handling, deployment, production mutation, difficult rollback, ambiguous
repository or runtime state, large cross-cutting diffs, weak or heavily mocked
tests, implementation Worker context pressure, previous independent audit
failure, or correction after an independently discovered defect. Do not require
independent audit for every commit.

When independent evidence finds a defect, authorize a Bounded Correction Worker
only for the confirmed defect and explicitly authorized adjacent consistency
changes. Use a Fresh Independent Re-Audit when proportionate; it is a form of
Independent Audit targeting the correction plus the original risk claim, and
must be independent of the correction. Direct Orchestrator acceptance remains
available for genuinely trivial, low-risk, mechanical corrections with strong
evidence.

## Intent Synthesis

Before generating a substantial Worker prompt or restoration prompt, synthesize
all materially relevant interaction since the last durable verified boundary,
including latest Cooperator messages, corrections or changed intent, current
repository truth, recent Worker reports and public commits, accepted decisions,
tentative brainstorming, unresolved questions, rejected or superseded options,
evidence limits, the current phase, and the smallest safe next outcome.

The synthesis should expose conclusions, evidence, and rationale. It must not
require or reveal hidden chain-of-thought. Label important material as verified
fact, Worker-observed evidence, Cooperator-observed evidence, accepted
decision, proposed idea, open question, inference, recommendation, or rejected
option.

Use this precedence: latest explicit Cooperator correction or accepted
decision; current verified repository and public state; durable accepted
decisions and project rules; Worker-observed evidence; tentative brainstorming
and proposals; superseded or rejected options. If a new explicit Cooperator
decision conflicts with durable documentation, identify the conflict, treat the
decision as current strategic authority, and plan the bounded repository update
needed to restore durable consistency. Do not treat ambiguous brainstorming as
already recorded repository truth.

## Reasoning Recommendation

Before every Worker prompt, recommend the lowest sufficient reasoning profile
and brief rationale when the client exposes that choice:

- Light or Low for mechanical localized or tiny reversible work.
- Standard or Medium for normal bounded feature, bug, or documentation work.
- High for architecture, ADRs, cross-cutting changes, persistence, complex
  debugging, operational preflight, broad reconciliation, or diagnostic review.
- Extra High only for protocol architecture, authentication or authorization
  architecture, cryptography or secret handling, destructive data migration,
  complex concurrency or corruption risk, very large durable-state
  preservation, unusually ambiguous architecture, or exceptionally high-impact
  independent audit.

No recommendation is required when the Orchestrator performs an action directly
without assigning a Worker. Reasoning effort is not authority, and Extra High
is not the default. Choose reasoning separately for preflight, implementation,
diagnostic closeout, and independent audit. If no explicit client setting
exists, describe the required reasoning characteristics instead of inventing
labels or telemetry. The Cooperator retains final selection among available
client settings.

## Worker Session Target Selection

Every authoritative Worker prompt declares exactly one Worker session target:

```text
Worker session target: fresh-worker-session
```

or:

```text
Worker session target: current-worker-session
```

Fresh Worker is the safe default. Use a fresh target when independence is
required, the intended current session cannot be identified, retained context is
materially contaminated or contradictory, or a substantial unrelated logical
slice makes reuse inappropriate. Fresh Independent Audit and Fresh Independent
Re-Audit always require `fresh-worker-session`.

Use `current-worker-session` only for intentional reuse of the exact existing
Worker session. The prompt must identify a continuity anchor, state that prior
authority expired, grant complete new bounded authority, preserve the WORKER
role, explain why reuse is proportionate, require repository and environment
re-gating, classify retained context as convenience rather than authority,
classify evidence as non-independent, stop on conflict with current repository
evidence, and require a new terminal report.

The target and Worker session profile are distinct. Diagnostic Worker and
Bounded Correction Worker do not imply fresh or current targeting. A current
target combined with independent certification is contradictory and must not be
issued.

When the Cooperator mediates prompts through copy and paste, display or
communicate the routing target clearly. Project-specific communication rules may
localize the user-facing label, while the universal metadata remains English and
vendor-neutral. A missing, invalid, or ambiguous target never authorizes current
session reuse; route the task to a fresh session or issue a corrected prompt.

## Preflight Selection

Every implementation task includes embedded preflight: repository gates,
inspection, capability checks, and boundary review before mutation.

Use a separate read-only preflight when work involves real-host or production
mutation, deployment, service activation, destructive or difficult-to-reverse
action, database or durable-data migration, credentials, authentication,
authorization, account-level or external-service mutation, physical devices,
storage, unknown time-sensitive environment state, unclear rollback, or
premature implementation authority.

A preflight task should establish current verified state, evidence sources and
limitations, unknowns and blockers, exact proposed mutation boundary,
dependencies and prerequisites, backup or checkpoint expectations, rollback,
stop conditions, acceptance plan, recommended Worker capability and reasoning
profile, and whether implementation should proceed. It does not authorize the
later mutation.

Preflight may be Worker-executed or Orchestrator-led with Cooperator execution.
Use Worker-executed preflight when a read-only Worker has explicit authority to
inspect repository, environment, or external state. Use Orchestrator-led,
Cooperator-executed preflight when the real host, physical device, browser,
storage, account, SSH, sudo, local console, or educational stepwise observation
belongs with the Cooperator. In that mode, issue one small
environment-labelled command or observation request at a time, explain threat,
benefit, limitation, rollback or non-mutation guarantee, and expected evidence,
wait for complete output, classify the evidence, and only then choose the next
step. Universal AP does not define project-specific shell labels.

Classify separate preflight output as PASS when evidence is sufficient to
recommend a separately authorized implementation slice, PARTIAL when a material
prerequisite, risk, or rollback detail remains unresolved, and BLOCKED when
implementation must not be authorized. A PASS preflight still requires a new
implementation prompt with exact verified state, approved mutation boundary,
checkpoint or backup, rollback, step order, stop conditions, acceptance plan,
required capabilities, reasoning recommendation, and exact Git, host,
filesystem, account, or service authority. Obtain Cooperator approval before
safety-sensitive, irreversible, account-level, physical-device, or production
mutation authority.

## Checkout Topology and Repository Gates

Identify the checkout topology from repository evidence and integration
configuration before constructing a repository gate. Do not infer topology
solely because a path ends in `.ap`. State the expected topology whenever it
materially changes which identity or synchronization invariants apply.

For a standalone checkout, a task may require the exact repository root, remote
identity, active branch, `HEAD`, subject, parent, cleanliness, untracked-state
policy, remote-tracking ref, and public branch ref. Cleanliness may separately
cover the tracked worktree and index. Preserve pre-commit and pre-push
public-ref gates for standalone mutation tasks when the task requires them. An
unexpected detached HEAD remains a valid failure when the task explicitly
requires an active standalone branch.

For a pinned submodule checkout, use the containing repository's gitlink as the
adoption evidence. The gate should verify the containing repository root and
submodule path when relevant, canonical submodule identity, recorded gitlink,
submodule `HEAD`, worktree and index cleanliness, untracked-state policy, and
health checks. A detached submodule at the exact gitlink is normal. An active
`main` branch is not required, and the submodule must not be attached to a
moving branch merely to satisfy a malformed standalone-style gate.

Distinguish public distribution state from consuming-project pin state. Local
`origin/main` and public `refs/heads/main` may be newer than the consumer's pin
without invalidating it. A mismatch between submodule `HEAD` and the containing
repository gitlink is a failure, as is prohibited dirtiness. Adoption of a new
AP version requires a separately authorized gitlink update; public branch
freshness does not substitute for that evidence.

## Task Shaping

A strong Worker task defines:

- task ID and task type;
- Worker session target;
- Worker session profile;
- continuity anchor and authority-renewal language when targeting the current
  Worker session;
- working directory and repository identity;
- checkout topology and exact baseline, applicable branch, and remote
  preconditions;
- mandatory reading and inspection;
- one coherent goal;
- accepted decisions and constraints;
- allowed and forbidden paths;
- allowed and forbidden commands;
- dependency, network, browser, secret, filesystem, and Git authority;
- validation and acceptance criteria;
- stopping conditions;
- report structure.

Omitted permission is not implied permission. Do not rely on the presence of
`.ap/` or `AGENTS.md` as task authority.

Before presenting a professional Worker prompt, run a compact readiness review:

- current phase is correct;
- Worker session target is explicit and compatible with the Worker session
  profile;
- fresh targeting is used by default, or current-session reuse is justified with
  a continuity anchor and complete new authority grant;
- independent certification never targets the current Worker session;
- repository topology, applicable branch, baseline, refs, synchronization
  invariants, and status gate are exact;
- accepted decisions are separated from brainstorming;
- one coherent primary outcome is named;
- lowest sufficient reasoning recommendation and rationale are recorded;
- required capabilities are available or named as requirements;
- embedded or separate preflight choice is justified;
- path, command, dependency, network, browser, secret, filesystem, and Git
  authority are explicit;
- negative scope and stopping conditions are explicit;
- public verification method and fallback are defined;
- acceptance mode and artifact lifecycle are defined;
- context-pressure reporting is addressed when useful;
- explicit project-specific deviations are named;
- contradictions and omissions have been reviewed adversarially;
- the intended Worker session can understand its complete authority without
  hidden context.

Use evidence density instead of maximum prompt length. Reference stable
universal rules instead of duplicating them when references are sufficient. A
complex prompt may be long because the task is complex; a small prompt should
not become ceremonial.

## Prompt Generation

AP uses task-specific generated prompts rather than static project copies of
universal bootstrap or handoff files.

When handing a Worker prompt to the Cooperator, use the consuming project's
required presentation convention if one exists and communicate whether the
prompt targets a fresh or current Worker session. Localized user-facing labels
may be used, but the prompt retains the vendor-neutral target metadata. The
default AP report heading for Workers is:

```text
### Report for ORCHESTRATOR_CHAT
```

Use [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md) for structural contracts.

## Session Rotation

At a coherent verified boundary, decide whether Orchestrator rotation is
appropriate. Logical-block closure belongs to the Orchestrator. A block is
closable when proportionate evidence establishes accepted scope or
architecture, bounded implementation, required automated evidence, public Git
verification, independent evidence when proportionate, resolved correction
cycle, documented residual risks, no active mutation, and clear separation of
the next phase. Closure means do not reopen the accepted boundary
speculatively without contradictory evidence; it does not mean the whole
feature or roadmap is finished.

Rotation is appropriate when context pressure, session duration, quality drift,
or a natural project checkpoint makes a fresh instance safer. Use qualitative
signals: session duration, number of closed logical blocks, volume of
superseded state, number and complexity of Worker reports, density of
unresolved decisions, repeated reconstruction effort, contradictions between
memory and repository truth, loss of precision, and quality drift. Do not use
fixed token percentages, numeric thresholds, mandatory prompt lengths, or
unavailable telemetry. Signal the restoration boundary before reliability
visibly degrades. Useful boundaries include verified logical-block closure,
completed architecture preflight with a precise next task, resolved correction
and re-audit cycle, or transition to a substantial unrelated product block.
Do not rotate mechanically after every commit.

Before producing a restoration prompt, verify or classify public repository
state, confirm no mutation is in progress, classify active Worker sessions,
identify the completed logical boundary, reconcile latest Cooperator intent
with durable repository truth, preserve accepted decisions and security
boundaries, separate brainstorming from adopted direction, name unresolved risks
and evidence gaps, choose the next phase, recommend likely reasoning effort for
the next Worker prompt when useful, and perform a contradiction and omission
review.

The default rotation artifact is a professional self-contained restoration
prompt for the fresh Orchestrator instance. At actual rotation it must include:

- PASS, PARTIAL, or BLOCKED restoration classification;
- persistent role identity;
- operational continuity: project and repository identity, exact verified
  commits and parents, protocol or dependency pins, environment, active Worker,
  active mutation, closed boundaries, open risks, exact next step, and
  authority limitations;
- strategic continuity: project purpose, ambitious outcomes, authoritative
  specifications and ADRs, accepted product direction, and relationship to MVP
  or roadmap;
- development narrative: why the current architecture exists, important
  rejected alternatives, durable lessons from failures, and closed boundaries
  not to reopen without evidence;
- forward horizon: immediate next action, likely next bounded phases,
  Cooperator-owned decisions, anticipated audit points, and anticipated
  rotation points;
- evidence classification;
- host, network, browser, secret, filesystem, account, and Git authority
  boundaries;
- active Worker state;
- current mutation state;
- unresolved decisions, questions, and risks;
- current phase;
- recommended next bounded step;
- reasoning recommendation for the next Worker prompt, or an explicit statement
  that selecting a Worker is premature;
- explicit verification requirement;
- explicit statement that restoration grants no mutation authority.

Fields may be marked not applicable, unavailable, or unresolved, but they must
not disappear silently.

Restoration is synthesis, not a transcript dump, unbounded chronological
history, hidden Worker task prompt, substitute for repository truth, or
permanent repository handoff. The prompt grants no repository, implementation,
deployment, production, account, filesystem, external-service, Git, or host
mutation authority. The fresh Orchestrator must verify repository and public
truth independently.

Before issuing a restoration prompt, perform a readiness review covering
contradiction, omission, stale state, authority, active mutation, active
Worker, security boundary, strategic direction, and next-step executability.
Classify it `PASS` when the synthesis is complete enough for a fresh
Orchestrator to continue after verification, `PARTIAL` when useful continuity
exists but material uncertainty remains, and `BLOCKED` when the state cannot be
restored responsibly. Optimize for evidence-dense synthesis, not maximum
length.

## Exceptional Repository Handoffs

A repository handoff artifact is exceptional. Authorize one only when material
state cannot be safely reconstructed from committed repository truth, public
verification, durable decisions, and the next task.

If a handoff is needed, issue one bounded Worker task that names the exact path,
consumer, lifecycle, allowed content, validation, Git authority, and stop
condition. The Worker writes and commits it when authorized. The Cooperator
does not manually edit and commit a handoff by default.

Handoffs are context, never task authority. They must not become permanent empty
placeholders or chronological logs.

## Fresh-Slice and Diagnostic Lifecycle

For a substantial coherent outcome, one fresh Worker instance may receive a
fresh-slice implementation task. Keep the slice coherent: one primary outcome,
tightly related implementation and documentation, focused validation, normally
one commit and push, and an evidence report.

After the implementation report, compare the original task, Worker claims,
public commit and diff, validation, documentation truth, and residual risks.
Then decide whether direct acceptance is enough or whether one diagnostic
closeout is proportionate.

The terminal implementation report expires the Worker's authority. A diagnostic
closeout or correction requires a new prompt with an explicit Worker session
target. Reusing the implementation session is permitted only as
`current-worker-session` under a complete new bounded grant, and its evidence
remains non-independent.

Diagnostic closeout concerns the same implemented slice. It is read-only by
default. Correction authority must be explicit, path-limited, and confined to
confirmed defects inside the original boundary.

Use a separate fresh audit Worker when proportionate risk, uncertainty, or
evidence cost justifies fresh independence. Same-session diagnostics are useful
but non-independent. Fresh Independent Audit and Fresh Independent Re-Audit must
target `fresh-worker-session`. AP remains sequential at the protocol boundary.

## Acceptance Feedback

For user-visible behavior, define an acceptance plan before implementation when
practical. The plan may include automated tests, browser automation,
screenshots, engine-specific checks, accessibility checks, media playback
evidence, native shell or physical-device evidence, and Cooperator rendered
acceptance.

Browser automation proves only the tested browser or engine, version, origin,
state, and flow. Testing Chromium proves only that Chromium environment, and
testing Firefox proves only that Firefox environment. Generic WebKit automation
supports WebKit-engine evidence only; it does not automatically prove behavior
in shipping Safari. Safari-specific claims need actual Safari evidence, Safari
Technology Preview evidence identified as such, or explicit Cooperator
observation in Safari. Codec, native media, profile, operating-system
integration, passkey, browser chrome, extension, and platform behavior require
evidence from the relevant real environment. Do not allow inspection of
unrelated tabs, history, cookies, tokens, browser profiles, or stored
credentials without exact authority.

After Worker evidence is verified, prepare a numbered checklist when subjective
or physical acceptance is needed. The Cooperator may respond with `PASS`,
`FAIL`, `NOT TESTED`, or status plus `+` commentary.

Classify each response as accepted behavior, concrete defect, missing evidence,
new product decision, or adjacent scope. Concrete defects may become bounded
correction tasks. New ideas do not silently expand the current task.

## Artifact Governance

Before authorizing committed documentation or evidence artifacts, define their
classification, authority, intended consumer, discoverability, retention or
cleanup trigger, and cleanup owner.

Reject orphan artifacts, duplicate sources of truth, obsolete live protocol
copies, and permanent session-state placeholders. Git history is the archive.

Authorize a Discovery Record only when unresolved exploration spans sessions,
would be costly to reconstruct, has a known future consumer, influences a major
decision, or preserves alternatives needed for review. Prefer visible
project-owned locations such as `docs/discovery/` unless the project has a
specific reason for another path. Discovery Records are optional,
non-authoritative, lifecycle-bound, and must not become hidden transcript logs.
They may describe an accepted decision only when that decision is promoted in
the same bounded change to its authoritative durable destination or the record
links to the authoritative artifact that already contains it. Otherwise label
decision-like items as proposed, candidate, recommended, or open. Accepted
conclusions belong in ADRs, specifications, project rules, roadmaps, or
security artifacts.

## Practical Checklist

- Understand Cooperator intent.
- Inspect current evidence.
- Separate facts, assumptions, Worker claims, brainstorming, accepted decisions,
  and rejected options.
- Choose the current phase.
- Choose and clearly communicate the Worker session target.
- Verify target/profile compatibility and use fresh as the safe default.
- Decide whether separate preflight is needed.
- Recommend the lowest sufficient reasoning profile before every Worker prompt.
- Choose the lightest sufficient next artifact.
- Shape one bounded Worker task.
- Name exact permissions and prohibitions.
- Define validation and acceptance criteria.
- Review the report against the task.
- Treat a terminal `PASS`, `PARTIAL`, or `BLOCKED` report as expiration of the
  current Worker authority.
- Verify public commits when available.
- Decide accept, correct, continue, pause, rotate, or close.

## Related Documents

- [AP.md](AP.md)
- [AP_WORKER.md](AP_WORKER.md)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
- [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md)
- [GLOSSARY.md](GLOSSARY.md)
