# Agent Instructions — Analytic Programming Source Repository

## Project identity

This repository develops reusable **Analytic Programming** documentation: protocol rules, handbooks, templates, and adoption guides.

It is **documentation-only**. No software implementation, package, dependency, executable, or build system exists unless a future explicit decision authorizes otherwise.

Public repository: `https://github.com/cisarik/ap.git`

## Active governance

| Setting | Value |
|---|---|
| Active protocol | AP v1 ([AP.md](AP.md)) |
| Experimental protocol | AP v2 ([APv2.md](APv2.md)) — deliverable, not active governance for initial bootstrap |
| Active Worker count | one |
| Concrete instance | `Worker_1` |
| Topology | single Worker |

## Roles

| Role | Identity in this project |
|---|---|
| COOPERATOR | Michal — strategic authority |
| ORCHESTRATOR | Coordination layer — task shaping and verification |
| WORKER | Execution role — currently fulfilled by `Worker_1` |

Normative role names are **uppercase**. Concrete instance labels use `Worker_N` form.

## Language rules

| Artifact | Language |
|---|---|
| Repository content | Professional English |
| COOPERATOR communication | Slovak (external to repository) |
| Worker prompts | English |
| Worker reports | English; begin with `### Report for ORCHESTRATOR_CHAT` |

## Operating rules

- Inspect before changing.
- Do not expand scope silently.
- Do not access or print secrets.
- Do not perform destructive actions without explicit authorization.
- Do not perform Git write operations without task-specific permission.
- Do not install dependencies or create executable code without explicit decision.
- Do not add vendor-specific normative rules.
- Do not access unrelated filesystem paths.
- Public commit verification is expected when commits are claimed.

## Documentation consistency

README, AP files, handbooks, ADRs, templates, and adoption guides MUST remain mutually consistent.

Target project templates under [templates/project/](templates/project/) MUST remain generic with placeholders.

## FrameNest boundary

FrameNest is reference evidence for protocol extraction, not a dependency of this repository.

Do not accumulate FrameNest product rules, architecture, paths, or application-specific state in this repository.

## Source-of-truth hierarchy

For this repository:

1. current committed Markdown files and directory structure;
2. accepted ADRs in [docs/adr/](docs/adr/);
3. active [AP.md](AP.md);
4. [AGENTS.md](AGENTS.md) (this file);
5. [WORKERS.md](WORKERS.md);
6. handbooks and companion documents;
7. Git history;
8. structured Worker reports;
9. session memory and assumptions.

Reports never override independently verifiable repository evidence.

## Handoff model

| File | Purpose |
|---|---|
| [BOOT_ORCHESTRATOR.md](BOOT_ORCHESTRATOR.md) | Stable Orchestrator bootstrap |
| [BOOT_WORKER.md](BOOT_WORKER.md) | Stable Worker bootstrap |
| [NEXT_ORCHESTRATOR.md](NEXT_ORCHESTRATOR.md) | Orchestrator session handoff |
| [NEXT_WORKER.md](NEXT_WORKER.md) | Worker session handoff |

BOOT and NEXT files do not grant task authority. A concrete ORCHESTRATOR task prompt grants task authority.

## Protocol documents

- [AP.md](AP.md) — active v1 protocol
- [APv2.md](APv2.md) — experimental v2 protocol
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md) — Orchestrator handbook
- [AP_WORKER.md](AP_WORKER.md) — Worker handbook
- [WORKERS.md](WORKERS.md) — project Worker manifest
- [ADOPTION.md](ADOPTION.md) — adoption guide
- [VERSIONING.md](VERSIONING.md) — version policy
- [GLOSSARY.md](GLOSSARY.md) — terminology
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md) — prompt structure
- [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md) — artifact rules

## Related documents

See [README.md](README.md) for repository overview and quick start.
