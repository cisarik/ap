# Analytic Programming

Reusable documentation for the **Analytic Programming** Coordinator Protocol — a methodology for shaping software work through explicit roles, bounded tasks, evidence inspection, verification, and disciplined handoff.

This repository is **documentation-only**. It contains Markdown protocol rules, handbooks, templates, and adoption guides. It does not ship software, packages, dependencies, or build tooling.

Public repository: [https://github.com/cisarik/ap](https://github.com/cisarik/ap)

## What Analytic Programming is

Analytic Programming (AP) is a protocol for work where:

- intent is clarified before execution;
- repository evidence outweighs conversational memory;
- tasks are bounded with explicit authority;
- results are validated proportionally;
- public commits are verified independently;
- sessions rotate through durable handoffs rather than endless chat summarization.

AP reduces risk through observable gates, explicit authority boundaries, verification discipline, and structured handoff. It does **not** guarantee correctness or eliminate mistakes.

## Three persistent roles

| Role | Responsibility |
|---|---|
| **COOPERATOR** | Human project owner; strategic decisions; approval of topology and irreversible actions |
| **ORCHESTRATOR** | Coordination; evidence inspection; task shaping; Worker evaluation; verification |
| **WORKER** | Bounded execution of one authoritative task; honest evidence reporting |

These uppercase names are **persistent protocol abstractions**. They are not chats, models, providers, IDEs, or products.

### Role versus instance

A **concrete instance** is temporarily assigned to a persistent role:

- an Orchestrator instance assigned to the ORCHESTRATOR role;
- `Worker_1`, a Worker instance assigned to the WORKER role.

Several Worker instances may share the one persistent **WORKER** role. Labels such as `Worker_1` are opaque and must not imply vendor, model, or seniority.

## Protocol versions

| File | Status | Model |
|---|---|---|
| [AP.md](AP.md) | Stable v1 | Single active Worker default; sequential rotation |
| [APv2.md](APv2.md) | Experimental complete v2 | Multi-Worker capable; sequential relay preferred |

**One Worker remains the default** in both versions.

AP v2 does **not** imply automatic parallelism. Parallel workstreams are exceptional and explicitly bounded.

A consuming project ends with **exactly one active `AP.md`**. See [ADOPTION.md](ADOPTION.md) and [VERSIONING.md](VERSIONING.md).

## This repository's configuration

| Setting | Value |
|---|---|
| Active protocol | AP v1 |
| Worker topology | single Worker |
| Concrete instance | `Worker_1` |
| Parallel execution | disabled |

Worker topology for this project is recorded in [WORKERS.md](WORKERS.md).

## Repository layout

| Path | Purpose |
|---|---|
| [AP.md](AP.md) | Active stable protocol (v1) |
| [APv2.md](APv2.md) | Experimental standalone multi-Worker protocol |
| [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md) | Universal Orchestrator handbook |
| [AP_WORKER.md](AP_WORKER.md) | Universal Worker handbook (no project Worker count) |
| [WORKERS.md](WORKERS.md) | **Project-specific** Worker manifest |
| [AGENTS.md](AGENTS.md) | **Project-specific** repository rules |
| [BOOT_ORCHESTRATOR.md](BOOT_ORCHESTRATOR.md) | Stable Orchestrator bootstrap |
| [BOOT_WORKER.md](BOOT_WORKER.md) | Stable Worker bootstrap |
| [NEXT_ORCHESTRATOR.md](NEXT_ORCHESTRATOR.md) | Orchestrator session handoff |
| [NEXT_WORKER.md](NEXT_WORKER.md) | Worker session handoff |
| [ADOPTION.md](ADOPTION.md) | How to adopt AP in another repository |
| [VERSIONING.md](VERSIONING.md) | Protocol version policy |
| [GLOSSARY.md](GLOSSARY.md) | Terminology |
| [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md) | Task prompt and report structure |
| [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md) | Artifact classification and cleanup |
| [docs/adr/](docs/adr/) | Architecture decision records |
| [templates/project/](templates/project/) | Generic templates for consuming projects |

**Universal** files apply to any AP project. **Project-specific** files (`AGENTS.md`, `WORKERS.md`, BOOT/NEXT customized copies) are copied from [templates/project/](templates/project/) and customized.

## BOOT versus NEXT

| Type | Stability | Authority |
|---|---|---|
| **BOOT** | Stable across sessions | Context only — not task authority |
| **NEXT** | Replaced at session close | Context only — not task authority |

A fresh Orchestrator or Worker session begins by reading BOOT files, handoffs, and repository evidence — then waits for or receives a **concrete task prompt** from the Orchestrator. That prompt is the only concrete task authority.

## Adoption workflow

1. Choose AP v1 or v2 ([ADOPTION.md](ADOPTION.md)).
2. Copy universal protocol files and customize templates.
3. Ensure exactly one active `AP.md` in the target project.
4. Initialize [WORKERS.md](WORKERS.md) (required for AP v2).
5. Start a fresh Orchestrator instance; verify the repository.
6. Issue one launch-and-task prompt for `Worker_1`.
7. Continue through NEXT handoffs at session boundaries.

## Quick start

### For a new Orchestrator session

1. Read [BOOT_ORCHESTRATOR.md](BOOT_ORCHESTRATOR.md).
2. Verify public Git state on the target repository.
3. Read [AGENTS.md](AGENTS.md), active [AP.md](AP.md), and [WORKERS.md](WORKERS.md).
4. Clarify one open decision with the COOPERATOR if needed.
5. Shape one bounded task and present the Worker prompt under `Toto pošli WORKEROVI ako jeden prompt:`.

### For a new Worker session

1. Read [BOOT_WORKER.md](BOOT_WORKER.md) and [NEXT_WORKER.md](NEXT_WORKER.md).
2. Receive the authoritative Orchestrator task prompt.
3. Verify repository identity and preconditions.
4. Execute within authorized scope; report with `### Report for ORCHESTRATOR_CHAT`.

## Related reading

- [ADR-0001: Protocol version selection](docs/adr/0001-protocol-version-selection.md)
- [ADR-0002: Worker instance topology](docs/adr/0002-worker-instance-topology.md)
