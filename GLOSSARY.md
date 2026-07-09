# Glossary

Terms used consistently across Analytic Programming documents.

## Analytic Programming

A Coordinator Protocol for software work emphasizing intent clarification, evidence inspection, bounded tasks, validation, public verification, and explicit handoff.

## Coordinator Protocol

Synonym for the role-based coordination model used by Analytic Programming (COOPERATOR, ORCHESTRATOR, WORKER).

## COOPERATOR

Persistent protocol role: human project owner with strategic authority and approval of significant alternatives, topology, and irreversible actions.

## ORCHESTRATOR

Persistent protocol role: coordination layer that shapes bounded tasks, evaluates Worker reports, verifies evidence, and manages session continuation.

## Orchestrator instance

One concrete initialized entity temporarily assigned to the ORCHESTRATOR role.

## Orchestrator session

Bounded lifecycle and context of one Orchestrator instance.

## WORKER

Persistent protocol role: bounded execution of one authoritative task with inspection-before-change and honest reporting.

## Worker instance

One concrete initialized entity temporarily assigned to the WORKER role, identified by a label such as `Worker_1`.

## Worker session

Bounded lifecycle and context of one Worker instance.

## Worker label

Opaque project-local identifier for a Worker instance (for example `Worker_1`). Must not imply vendor, model, seniority, or trust level.

## Worker implementation

Concrete system currently fulfilling the WORKER role for a session. May change between sessions.

## execution client

Host tool or environment running an agent instance.

## model

Language model used for generation within a Worker or Orchestrator implementation.

## model provider

Organization or service hosting the model.

## capability profile

Functional description of what a Worker implementation can do in the current session, without vendor identity.

## task authority

Permission to perform a specific bounded task, granted only by the current authoritative ORCHESTRATOR task prompt.

## source of truth

Repository state and verifiable artifacts that outweigh conversational memory and unstructured reports.

## evidence

Output or repository state used to verify a claim (files, diffs, tests, commits, command output).

## assumption

A statement treated as true without independent verification. Must be identified and verified before high-risk action.

## acceptance criteria

Concrete conditions that define task completion. When met with evidence, the Worker stops successfully.

## handoff

Replaceable session artifact (typically NEXT files) describing state for the next concrete instance. Not task authority.

## bootstrap

Stable session-start context (BOOT files). Not task authority.

## public commit verification

Independent inspection of commit SHA, tree, and diff on a public remote, compared against Worker claims.

## workstream

Bounded set of paths, branches, or tasks assigned to one Worker instance.

## topology

Arrangement of Worker instances permitted by the active protocol and project manifest. Under AP v3, the protocol boundary is single-Worker and sequential.

## sequential Worker rotation

Intentional replacement of one closed Worker instance with a fresh Worker instance for a later task, with Orchestrator synthesis and repository evidence between sessions.

## independent fresh audit

Sequential assignment of a separate fresh Worker instance to verify an already implemented slice. Under AP v3 this is not parallel execution and is read-only unless exact correction authority is granted.

## diagnostic closeout

A second authoritative prompt about the same already implemented slice, normally read-only, used to examine requirement coverage, negative guarantees, failure behavior, security boundaries, documentation truth, and test gaps before the Worker session closes. See [APv3.md](APv3.md) §9 and [ADR-0004](docs/adr/0004-fresh-slice-diagnostic-lifecycle.md).

## fresh-slice implementation lifecycle

A proportional AP v3 lifecycle in which a fresh Worker instance receives one substantial coherent implementation slice, produces durable verified repository output, and may receive one diagnostic closeout prompt before rotation. It preserves one primary outcome, explicit authority, and single-Worker sequential execution. See [ADR-0004](docs/adr/0004-fresh-slice-diagnostic-lifecycle.md).

## integration

Combining outputs from more than one sequential Worker assignment or branch under ORCHESTRATOR authority with verification of baseline, paths, tests, and conflicts. AP v3 does not authorize parallel Worker execution.

## context pressure

Degradation of session quality from context limits, rate limits, duration, or lost constraints. Belongs to concrete sessions, not persistent roles.

## artifact lifecycle

Classification, retention, consumption, and cleanup rules for repository artifacts. See [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md).

## compact communication mode

An optional mode that reduces prompt and report verbosity by referencing authoritative repository files instead of copying them, while preserving explicit task-specific authority, boundaries, validation, and report format. Reports target approximately 800–1,000 words. See [APv3.md](APv3.md) §36.

## numbered COOPERATOR acceptance feedback

A numbered checklist of independently observable outcomes prepared by the ORCHESTRATOR after implementation verification. The COOPERATOR responds per item with `PASS`, `FAIL`, `NOT TESTED`, or `+` with commentary. The `+` marker adds evidence without changing item status. See [APv3.md](APv3.md) §37.

## three-layer handoff

The Worker rotation model distinguishing three session inputs with different authority: **stable bootstrap** (read once, no task authority), **repository-local next-session handoff** (operational lifecycle artifact, state evidence only), and **authoritative Worker task** (the only source of current task authority). See [APv3.md](APv3.md) §29.

## context economy

The practice of reading only files relevant to the current slice, preferring targeted search over full-file dumps, summarizing command output, and avoiding broad repository audits without authority. See [APv3.md](APv3.md) §34.

## integrated bootstrap gate

A short read-only verification step embedded in the first implementation prompt for low- or medium-risk continuations. The Worker MUST complete it before modification and MUST stop if it fails. A separate bootstrap-only task is used when identity, cleanliness, environment, or security sensitivity is uncertain. See [APv3.md](APv3.md) §36.

## Normative terms

| Term | Meaning |
|---|---|
| MUST | Required |
| MUST NOT | Forbidden |
| SHOULD | Recommended |
| SHOULD NOT | Discouraged |
| MAY | Optional |
