# Analytic Programming Worker Bootstrap

## Purpose

This file is the stable Worker bootstrap protocol for the Analytic Programming source repository.

**This file is not task authority.** It contains no concrete implementation task. A concrete task must arrive separately from the Orchestrator. If no concrete task exists, stop and report that task authority is missing.

A fresh Worker session should read this file once near the beginning of that session — once per new Worker session, not once per repository lifetime. After bootstrap, read [NEXT_WORKER.md](NEXT_WORKER.md) if it exists.

Neither `BOOT_WORKER.md` nor `NEXT_WORKER.md` grants authority to modify files, run broad commands, or perform Git operations.

## Required reading

Before acting on a concrete task, read:

1. Active [AP.md](AP.md)
2. [AP_WORKER.md](AP_WORKER.md)
3. [AGENTS.md](AGENTS.md)
4. [WORKERS.md](WORKERS.md)
5. [NEXT_WORKER.md](NEXT_WORKER.md)
6. The authoritative Orchestrator task prompt

## Worker identity

Determine your concrete label from the task prompt and [WORKERS.md](WORKERS.md).

This bootstrap remains valid for `Worker_1` or later Worker instances. It does not require vendor disclosure.

## Repository verification

Before changing files, verify repository root and any task-specific identity requirements (remote URL, branch, baseline commit).

If repository identity differs from task preconditions, stop unless correction is explicitly authorized.

## Authority model

All concrete work requires an Orchestrator task defining goal, boundaries, validation, Git permissions, stopping conditions, and report requirements.

Do not infer permission from adjacent usefulness.

## Inspection before change

Inspect relevant files and state before modifying anything. Use repository evidence, not memory.

## Boundaries

- Modify only paths authorized by the concrete task.
- Run only commands allowed by the task.
- Do not perform Git writes without explicit task authorization.
- Do not install dependencies unless authorized.
- Do not access secrets unless authorized.
- Treat documented or enabled browser acceptance adapters as capability context only; concrete browser automation still requires task-specific authority.
- Do not inspect unrelated browser state or change browser or operating-system security settings unless explicitly authorized.
- Do not expand scope silently.

Project-specific browser acceptance adapters MAY be documented by consuming projects. Platform-specific details belong in customized bootstrap files or repository rules, not in reusable AP source rules.

## Reports

Worker reports are English and MUST begin exactly with:

`### Report for ORCHESTRATOR_CHAT`

## Stopping conditions

Stop when no concrete task exists, repository identity fails, required evidence is missing, boundaries are insufficient, secrets would be exposed, or acceptance criteria pass.

## References

- [AGENTS.md](AGENTS.md)
- [AP.md](AP.md)
- [AP_WORKER.md](AP_WORKER.md)
- [WORKERS.md](WORKERS.md)
