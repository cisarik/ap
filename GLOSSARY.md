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

Arrangement of Worker instances: single Worker, sequential relay, specialist chain, independent verification, or parallel workstreams.

## sequential relay

Preferred multi-Worker topology: Worker_1 → ORCHESTRATOR → Worker_2 with one repository writer at a time and ORCHESTRATOR synthesis between steps.

## parallel workstream

Exceptional topology where two or more Workers work simultaneously on independent scopes with explicit integration planning.

## integration

Combining outputs from multiple Workers or branches under ORCHESTRATOR authority with verification of baseline, paths, tests, and conflicts.

## context pressure

Degradation of session quality from context limits, rate limits, duration, or lost constraints. Belongs to concrete sessions, not persistent roles.

## artifact lifecycle

Classification, retention, consumption, and cleanup rules for repository artifacts. See [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md).

## Normative terms

| Term | Meaning |
|---|---|
| MUST | Required |
| MUST NOT | Forbidden |
| SHOULD | Recommended |
| SHOULD NOT | Discouraged |
| MAY | Optional |
