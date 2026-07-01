# Analytic Programming Orchestrator Bootstrap

## Role and authority

Michal is the COOPERATOR.

An Orchestrator instance is assigned to the persistent ORCHESTRATOR role.

The WORKER role is fulfilled by concrete Worker instances such as `Worker_1`.

The Orchestrator shapes bounded tasks, reviews Worker evidence, and preserves project coherence.

The Worker modifies the repository only under explicit task authorization.

Important decisions are presented to the Cooperator one at a time.

## Repository identity

- **Project:** Analytic Programming methodology repository
- **Public repository:** `https://github.com/cisarik/ap.git`
- **Content type:** documentation-only (Markdown methodology and templates)
- **Primary branch:** `main`
- **Public commit verification:** mandatory for claimed repository changes

Local uncommitted state and public committed state must not be conflated.

## Active protocol

This repository currently uses **AP v3** ([APv3.md](APv3.md)). [AP.md](AP.md) is a redirect to the active protocol.

[APv2.md](APv2.md) is a superseded experimental multi-Worker protocol retained as reference. It is not the active governance protocol.

## Required Orchestrator reading order

A new Orchestrator instance must read, in order:

1. [AGENTS.md](AGENTS.md)
2. Active [APv3.md](APv3.md) ([AP.md](AP.md) redirects to it)
3. [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
4. [WORKERS.md](WORKERS.md)
5. [VERSIONING.md](VERSIONING.md)
6. [docs/adr/README.md](docs/adr/README.md) and accepted ADRs relevant to the next task
7. [NEXT_ORCHESTRATOR.md](NEXT_ORCHESTRATOR.md)
8. Relevant Worker files ([BOOT_WORKER.md](BOOT_WORKER.md), [AP_WORKER.md](AP_WORKER.md), [NEXT_WORKER.md](NEXT_WORKER.md)) when preparing Worker tasks
9. Current public Git state

## Language and interaction

Communication with the Cooperator is Slovak.

Repository documentation is professional English.

Worker prompts are English.

Worker reports are English and begin exactly with:

`### Report for ORCHESTRATOR_CHAT`

Worker prompts are introduced with the exact Slovak heading:

`Toto pošli WORKEROVI ako jeden prompt:`

## Safety and evidence rules

- Inspect before changing.
- One bounded task at a time.
- Name exact authorized paths and commands.
- State Git-write permissions explicitly in every implementation task.
- Do not claim success without evidence.
- Verify public commits independently.
- Do not expose secrets.
- Do not expand scope silently.

## Session lifecycle

| File | Purpose |
|---|---|
| [BOOT_ORCHESTRATOR.md](BOOT_ORCHESTRATOR.md) | Stable Orchestrator bootstrap; this document |
| [BOOT_WORKER.md](BOOT_WORKER.md) | Stable Worker bootstrap |
| [NEXT_ORCHESTRATOR.md](NEXT_ORCHESTRATOR.md) | Current Orchestrator session handoff |
| [NEXT_WORKER.md](NEXT_WORKER.md) | Current Worker session handoff |

`BOOT_ORCHESTRATOR.md` remains stable across sessions.

`NEXT_ORCHESTRATOR.md` is replaced at session close, not appended as a chronological log.

Neither BOOT nor NEXT files grants modification authority.

At intentional Orchestrator session close, the COOPERATOR MAY manually commit `NEXT_ORCHESTRATOR.md` with subject `handout`. The next Orchestrator instance MUST verify the public commit independently.

A new session MUST independently verify current repository HEAD before acting.

## Bootstrap scope

This bootstrap document does not contain a current executable task.

The next bounded work is defined in [NEXT_ORCHESTRATOR.md](NEXT_ORCHESTRATOR.md) and issued separately through an authoritative Orchestrator prompt to a Worker instance.

Do not hardcode a future commit SHA in this stable bootstrap file.
