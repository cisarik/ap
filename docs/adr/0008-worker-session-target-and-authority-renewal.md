# ADR-0008: Worker Session Target and Authority Renewal

## Status

Accepted

## Date

2026-07-16

## Context

ADR-0007 established that a Worker session closes for autonomous work after its
formal report, remaining context is not continuing authority, related reuse
requires a new bounded prompt, and independent certification requires a fresh
Worker session.

The protocol did not require every Orchestrator-to-Worker prompt to declare
whether it was intended for a fresh Worker session or the current Worker
session. Worker session profile names sometimes implied freshness, but profiles
such as Diagnostic Worker and Bounded Correction Worker could legitimately be
used in either a fresh or current session. Profile names therefore could not
reliably route prompts.

The ambiguity created practical failure modes:

- an independent audit could be delivered to the implementation author;
- a continuation could be sent to an unintended fresh session;
- an open conversation could be mistaken for continuing authority;
- a current Worker could infer reuse from retained repository context;
- a changed profile label could be mistaken for fresh independence;
- Cooperator-mediated copy-and-paste workflows could route a correct task to the
  wrong session without an explicit declaration.

AP needed a small vendor-neutral routing contract that preserved authority
expiration, safe current-session reuse, and genuine independent verification.

## Decision

Every authoritative Orchestrator-to-Worker task prompt declares exactly one
Worker session target:

```text
Worker session target: fresh-worker-session
```

or:

```text
Worker session target: current-worker-session
```

The target identifies the intended execution session into which the prompt must
be delivered. It does not change the permanent WORKER role, expand authority,
establish independence by itself, replace the Worker session profile, or identify
a vendor, model, or execution client.

The Worker session target and Worker session profile are distinct:

- the target answers which new or existing execution session receives the task;
- the profile answers what bounded kind of work the session performs.

Diagnostic Worker and Bounded Correction Worker do not imply either target.
Fresh Independent Audit and Fresh Independent Re-Audit require fresh targeting
because their evidence posture requires independence.

## Fresh Safe Default

Fresh Worker is the safe default.

A missing, invalid, or ambiguous target never authorizes reuse of the current
session. The Orchestrator must route the task to a fresh Worker session or issue
a corrected authoritative prompt.

A fresh Worker session:

- did not receive the previous task authority;
- inherits no continuing authority from another Worker session;
- independently establishes required repository and environment evidence;
- receives complete authority only from the new prompt.

Fresh targeting is required for independent certification, Fresh Independent
Audit, Fresh Independent Re-Audit, review that claims independence from the
implementation author, uncertain current-session identity, and materially
contaminated or contradictory context. It is strongly preferred for substantial
unrelated logical slices and new high-risk security, migration, durable-data,
publication, deployment, or unreliable-restoration boundaries.

AP does not require a fresh session for every task.

## Current-Session Reuse

`current-worker-session` means intentional reuse of the exact existing Worker
execution session under a new authoritative prompt.

The prompt must:

- include a continuity anchor;
- state that prior authority expired;
- grant complete new bounded authority;
- preserve the permanent WORKER role;
- explain why reuse is appropriate;
- require repository and environment re-gating;
- state that retained context is convenience, not authority;
- classify the resulting evidence as non-independent;
- stop on conflict between retained context and current repository evidence;
- require a new terminal report.

A continuity anchor may identify the previous task ID, terminal report, accepted
commit, or another precise prior authority boundary. AP does not require one
serialization format for that anchor.

Legitimate reuse includes direct continuation of the same bounded
implementation, collection of missing evidence, correction of the Worker's own
implementation, interrupted-task resumption after re-gating, and report-format
repair without changing evidence.

## Authority Expiration

Worker authority expires when the Worker submits a terminal formal report.
Terminal statuses include `PASS`, `PARTIAL`, and `BLOCKED`.

Authority also expires when the task is explicitly cancelled or superseded.

Reuse of the same session requires a new authoritative prompt and a complete new
bounded grant. Authority renewal is new authority, not continuation of the
expired grant. An open conversation, unused context, retained repository
knowledge, a related task, or a repeated profile name grants no authority.

## Independence

Independent certification requires a fresh Worker session that did not
materially implement the target.

The following mappings are mandatory:

```text
Fresh Independent Audit -> fresh-worker-session
Fresh Independent Re-Audit -> fresh-worker-session
```

A prompt combining `current-worker-session` with independent certification is
contradictory and invalid. The same implementation Worker may self-review,
collect diagnostics, correct its implementation, and report validation evidence,
but it may not independently certify that work. Changing a profile label or
using internal agents within one coordinated Worker run does not create
independence.

## Compatibility

Existing consuming projects remain pinned to their current AP commit until they
explicitly update the AP gitlink.

After adopting this decision, newly generated Worker prompts must include the
target field. A legacy prompt without a valid target must never be interpreted as
permission for current-session reuse. It may be routed to a fresh Worker session
or corrected and reissued.

Project-specific communication rules may localize Cooperator-facing routing
labels. Universal AP metadata remains English and vendor-neutral.

## Consequences

Prompt routing becomes explicit in manual, API-based, and agent-mediated
workflows. Current-session reuse remains efficient for bounded continuation while
authority expiration stays intact. Independent audit becomes harder to route
accidentally to the implementation author.

Orchestrators must select and communicate the target, justify current-session
reuse, and verify target/profile compatibility. Workers must inspect the target,
reject ambiguous continuation, and stop when a continuity anchor does not match
their actual session history.

Prompts gain one mandatory metadata field and, for current-session reuse, a
continuity anchor and authority-renewal statement. Fresh prompts do not need
meaningless continuity placeholders.

## Rejected Alternatives

- **Fresh session for every task**: rejected because direct bounded continuation
  can preserve useful context without weakening authority when a new grant is
  explicit.
- **Profile names as routing**: rejected because several profiles can run in
  either fresh or current sessions.
- **Open conversation as continuation authority**: rejected because retained
  context is convenience, not authority.
- **Current-session independent audit**: rejected because relabeling the
  implementation session cannot create independence.
- **Implicit current-session default**: rejected because omission would recreate
  the original routing ambiguity.
- **Vendor-specific session identifiers**: rejected because AP must support
  different clients, APIs, and manual copy-and-paste workflows.
- **Permanent new roles for fresh and current Workers**: rejected because session
  targeting does not change AP's three persistent roles.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../GLOSSARY.md](../../GLOSSARY.md)
- [0007-worker-session-evidence-and-restoration-lifecycle.md](0007-worker-session-evidence-and-restoration-lifecycle.md)
