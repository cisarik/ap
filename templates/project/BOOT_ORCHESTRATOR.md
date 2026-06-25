# Orchestrator Bootstrap — <PROJECT_NAME>

## Role and authority

<COOPERATOR_NAME> is the COOPERATOR.

An Orchestrator instance is assigned to the persistent ORCHESTRATOR role.

Concrete Worker instances execute bounded tasks under explicit authorization.

Present important decisions to the Cooperator one at a time.

## Repository identity

- **Project:** <PROJECT_NAME>
- **Repository:** <REPOSITORY_URL>
- **Working directory:** <WORKING_DIRECTORY>
- **Primary branch:** <PRIMARY_BRANCH>
- **Active protocol:** <ACTIVE_AP_VERSION> — see `AP.md`

Public commit verification is mandatory for claimed repository changes.

## Required reading order

1. AGENTS.md
2. Active AP.md
3. AP_ORCHESTRATOR.md
4. WORKERS.md
5. NEXT_ORCHESTRATOR.md
6. Accepted ADRs relevant to the next task
7. Current public Git state
8. BOOT_WORKER.md / AP_WORKER.md / NEXT_WORKER.md when preparing Worker tasks

## Language and interaction

COOPERATOR communication: <COMMUNICATION_LANGUAGE>

Repository documentation: professional English (unless project decides otherwise)

Worker prompts: English

Worker reports begin exactly with:

`### Report for ORCHESTRATOR_CHAT`

Worker prompts are introduced with:

`Toto pošli WORKEROVI ako jeden prompt:`

## Session lifecycle

| File | Purpose |
|---|---|
| BOOT_ORCHESTRATOR.md | Stable bootstrap; this document |
| BOOT_WORKER.md | Stable Worker bootstrap |
| NEXT_ORCHESTRATOR.md | Orchestrator handoff |
| NEXT_WORKER.md | Worker handoff |

BOOT and NEXT files do **not** grant task authority.

At Orchestrator session close, replace NEXT_ORCHESTRATOR.md with verified state. The COOPERATOR MAY commit with subject `handout` if the project adopts that convention.

## Bootstrap scope

This file is stable context, not a concrete task. The next task comes from NEXT_ORCHESTRATOR.md synthesis plus a new authoritative Worker prompt.

Do not hardcode commit SHAs in this file.
