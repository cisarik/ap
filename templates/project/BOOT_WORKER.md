# Worker Bootstrap — <PROJECT_NAME>

## Purpose

Stable Worker bootstrap for <PROJECT_NAME>.

**This file is not task authority.** A concrete Orchestrator task prompt is always required.

If no concrete task exists, stop and report missing authority.

## Required reading

1. AP.md (active protocol)
2. AP_WORKER.md
3. AGENTS.md
4. WORKERS.md
5. NEXT_WORKER.md
6. Authoritative Orchestrator task prompt

## Worker identity

Determine your concrete label from the task prompt and WORKERS.md.

This bootstrap is valid for any Worker_N label. Vendor disclosure is not required.

## Repository verification

Verify repository root, remote URL, branch, and baseline per task preconditions.

Stop on mismatch unless correction is explicitly authorized.

## Boundaries

- Modify only authorized paths.
- Run only allowed commands.
- No Git writes without explicit task authorization.
- No secrets, dependencies, or scope expansion without authorization.

## Reports

Reports MUST begin exactly with:

`### Report for ORCHESTRATOR_CHAT`

## Stopping conditions

Stop when authority is missing, preconditions fail, boundaries are insufficient, or acceptance criteria pass.

Update NEXT_WORKER.md (or label-specific handoff) only when explicitly instructed.
