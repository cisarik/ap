# ADR-0004: Fresh-Slice Implementation and Diagnostic Closeout Lifecycle

## Status

Accepted

## Artifact lifecycle

| Attribute | Value |
|---|---|
| Classification | Normative durable artifact |
| Authority | Accepted protocol architecture decision |
| Intended consumers | AP maintainers, Orchestrator instances, Worker instances, and consuming projects evaluating adoption |
| Discoverability | ADR index plus links from affected normative and handbook documents |
| Retention | Retain until explicitly superseded by a later ADR or protocol generation |
| Cleanup owner | ORCHESTRATOR under COOPERATOR-approved protocol authority |

## Context

Field use in FrameNest showed a repeatable successful pattern for substantial repository work:

1. assign one fresh Worker instance to one coherent implementation slice;
2. give that Worker exact bounded authority and enough context to complete the slice;
3. finish with validation, one normal commit and push, and independently verifiable public state;
4. have the Orchestrator compare the original task contract, Worker report, public commit, diff, tests, documentation claims, and unresolved risks;
5. when risk justifies it, send one second and final diagnostic closeout prompt about the same implemented slice.

The diagnostic pass is valuable because ordinary positive-path tests can miss negative guarantees and failure behavior. FrameNest closeouts found defects involving overwrite races, filesystem publication semantics, manifest strictness, URI path handling, and permission-failure behavior.

This field pattern must be generalized without changing AP v3 into a multi-Worker protocol, without treating Worker self-review as independent proof, and without encouraging Workers to consume context merely for its own sake.

## Decision

AP v3 adopts a proportional **Fresh-Slice Implementation and Diagnostic Closeout Lifecycle**.

A substantial coherent task may be assigned to a fresh Worker instance as one implementation slice. The task may deliberately include the inspection, architecture recording, implementation, tests, documentation, one normal commit and push, and final report needed to complete that slice.

One coherent task remains the unit of work. A fresh-slice implementation task must not combine unrelated features, speculative refactors, unrelated audits, independent product decisions, or operational mutations merely because the Worker instance has remaining context capacity.

After the implementation report, the Orchestrator performs independent evaluation against the original task contract and public repository evidence. The Orchestrator then decides whether acceptance is sufficient or whether one diagnostic closeout pass is proportionally justified.

A diagnostic closeout is a second authoritative prompt concerning the same already implemented slice. It is not a new product feature, general cleanup mission, unlimited polish pass, or substitute for Orchestrator review.

Diagnostic closeout is read-only by default. Correction authority must be explicit, limited to confirmed defects inside the original task boundary, constrained by an exact path allowlist, and normally completed in one corrective commit.

The default diagnostic closeout may use the same Worker instance because it already has the environment and can run focused regression checks efficiently. For exceptionally high-risk work, the Orchestrator may instead use a separate fresh Worker instance for independent audit.

AP v3 remains sequential and single-Worker at the protocol boundary. Independent audit is a sequential assignment, not parallel execution.

## Proportional applicability

A single implementation pass may be enough for small documentation fixes, narrow low-risk corrections, mechanically verifiable edits, or tasks where independent evidence already provides adequate confidence.

A diagnostic closeout should normally be considered for large diffs, persistence or data-integrity work, security and privacy boundaries, architecture changes, complex failure cleanup, destructive or overwrite-sensitive behavior, platform-sensitive semantics, broad documentation and implementation alignment, high context pressure, unusually strong negative guarantees, or weak independent verification.

The decision is judgment- and evidence-based. AP does not define a line-count, token-count, or context-percentage threshold that automatically requires a diagnostic pass.

## Implementation-pass semantics

The implementation prompt remains the authoritative first task. It should normally define:

- exact repository and baseline;
- one primary outcome;
- mandatory inspection;
- approved decisions;
- allowed paths;
- explicit exclusions;
- validation;
- Git authority;
- stop conditions;
- evidence report.

The Worker stops after reporting the implementation result. It must not start another product slice.

## Diagnostic-closeout semantics

A diagnostic closeout prompt should be adversarial and requirement-driven. Depending on task type, it may examine:

- requirement coverage;
- prohibited behavior;
- negative guarantees;
- security and privacy boundaries;
- race conditions;
- filesystem semantics;
- concurrency;
- transaction behavior;
- failure cleanup;
- platform differences;
- sanitization;
- false-positive tests;
- untested branches;
- documentation versus implementation;
- changed-path and Git integrity.

The diagnostic report should distinguish confirmed defects, unresolved risks, disproven hypotheses, and acceptable residual risk. It must not claim that diagnostic closeout guarantees correctness.

## Same-Worker and fresh-audit alternatives

Same-session diagnostic closeout is the normal efficient option for bounded correction and focused regression testing.

A separate fresh audit Worker may be justified for exceptional risk, including authentication or authorization, cryptography, destructive migrations, secret handling, irreversible filesystem operations, and production infrastructure changes.

The Orchestrator decides which option is proportionate. The same Worker is never the sole acceptance authority, and a fresh audit Worker still receives one bounded sequential prompt.

## Context compaction

Automatic context compaction is capability behavior, not repository truth and not task authority.

Compaction after a clean public checkpoint is operationally less risky because the next reasoning step can be reconstructed from committed repository evidence, public refs, reports, and a new authoritative prompt.

Compaction during unresolved local mutation is riskier because uncommitted state may be incomplete, hidden, or misremembered. It may require explicit state preservation, closeout, or stopping before further mutation.

The protocol rejects intentional context exhaustion. Context capacity is useful only insofar as it supports coherent focus, reasoning capacity, durable output, independent verification, and intentional rotation before unrelated work.

## Handoff implications

A Worker handoff is not mandatory merely because a substantial slice used a fresh Worker instance.

A handoff may be unnecessary when the slice is fully committed and pushed, public state is verified, final worktree and index are clean, decisions are recorded in durable artifacts, no material local-only environment state remains, and the next Worker can reconstruct state from repository evidence plus a new authoritative task.

A handoff remains necessary when material information cannot be reconstructed safely from committed repository truth, including unresolved local-only mutation, environment or operational state, multi-session investigation state, pending evidence, a deliberately continuing Worker session, or project-specific handoff rules.

The distinction remains:

- BOOT is stable context, not authority;
- NEXT is session state, not authority;
- the task prompt is concrete task authority.

## Compatibility with AP v3

This is a backward-compatible AP v3 refinement. It preserves:

- one primary outcome per task;
- explicit task authority;
- single-Worker protocol topology;
- sequential Worker rotation;
- independent Orchestrator review;
- public commit verification;
- bounded Git and path authority;
- proportional validation;
- BOOT/NEXT/task authority separation.

It does not require AP v4 because it refines task lifecycle guidance rather than changing persistent roles, protocol topology, or authority semantics.

## Rejected alternatives

- **Mandatory two-prompt ritual for every change**: rejected because it would add ceremony where a single pass and independent evidence are enough.
- **Same Worker as acceptance authority**: rejected because Worker self-review is not independent proof.
- **Parallel diagnostic and implementation Workers**: rejected because AP v3 remains sequential and single-Worker.
- **Context exhaustion as a goal**: rejected because context is capability context, not quality or authority.
- **Handoff after every substantial slice**: rejected because public committed state may be sufficient when no unreconstructable session state remains.
- **Broad cleanup during diagnostic closeout**: rejected because diagnostic closeout stays inside the original task boundary unless a new task is authorized.

## Consequences and risks

The lifecycle gives Orchestrators a clear way to use large capable Worker sessions on substantial coherent slices while preserving rotation and evidence discipline.

It should improve detection of negative-behavior defects and documentation mismatches in risk-sensitive work.

It adds judgment load: Orchestrators must decide when diagnostic closeout is worthwhile and must keep correction authority narrow.

It can be misused as bureaucracy or as a hidden second feature task. The protocol counters this through proportionality, read-only defaults, path allowlists, public evidence, and explicit stop rules.

## Revisit triggers

Revisit this decision if:

- consuming projects repeatedly treat diagnostic closeout as mandatory ceremony;
- same-session diagnostics prove insufficient for high-risk classes of work;
- AP v3 later changes its Worker topology;
- field evidence shows the lifecycle encourages oversized tasks;
- new tool behavior changes how compaction, public verification, or Worker session continuity should be handled.
