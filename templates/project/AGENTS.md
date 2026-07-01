# Agent Instructions — <PROJECT_NAME>

## Project identity

**Project:** <PROJECT_NAME>

**Repository:** <REPOSITORY_URL>

**Working directory:** <WORKING_DIRECTORY>

**Primary branch:** <PRIMARY_BRANCH>

## Active protocol

| Setting | Value |
|---|---|
| Active AP version | <ACTIVE_AP_VERSION> (v3 recommended) |
| Active protocol file | `AP.md` (project root after adoption) |

Record version selection in this file and preferably a project ADR. See [ADOPTION.md](../../ADOPTION.md) in the source repository.

## Roles

| Role | Identity |
|---|---|
| COOPERATOR | <COOPERATOR_NAME> |
| ORCHESTRATOR | Coordination layer |
| WORKER | Execution role — see [WORKERS.md](WORKERS.md) |

Normative role names are **uppercase**. Concrete Worker labels use `Worker_N`.

## Language rules

| Artifact | Language |
|---|---|
| Repository documentation | Professional English (unless project decides otherwise) |
| COOPERATOR communication | <COMMUNICATION_LANGUAGE> |
| Worker prompts | English |
| Worker reports | English; begin with `### Report for ORCHESTRATOR_CHAT` |

## Operating rules

- Inspect before changing.
- Do not expand scope silently.
- Do not access or print secrets.
- Do not perform Git writes without task-specific authorization.
- Do not install dependencies without explicit authorization.
- Public commit verification expected when commits are claimed.

## Source-of-truth hierarchy

Adjust for your project. Suggested default:

1. current repository implementation
2. tests and executable verification
3. accepted ADRs
4. normative documentation and active AP.md
5. AGENTS.md and WORKERS.md
6. public Git state
7. structured Worker reports
8. session memory

Reports never override independently verifiable repository evidence.

## Handoff model

| File | Purpose |
|---|---|
| BOOT_ORCHESTRATOR.md | Stable Orchestrator bootstrap |
| BOOT_WORKER.md | Stable Worker bootstrap |
| NEXT_ORCHESTRATOR.md | Orchestrator handoff |
| NEXT_WORKER.md | Worker handoff |

BOOT and NEXT files do not grant task authority.

## Customization markers

<!-- Project-specific rules below this line -->

_Add product invariants, technology constraints, and local paths here._

## Related documents

- AP.md (at project root after adoption)
- [WORKERS.md](WORKERS.md)
- [BOOT_ORCHESTRATOR.md](BOOT_ORCHESTRATOR.md)
- [BOOT_WORKER.md](BOOT_WORKER.md)
