# Project Template — README

Template for a consuming project adopting Analytic Programming. Copy and customize before use.

## Placeholders to replace

| Placeholder | Example |
|---|---|
| `<PROJECT_NAME>` | My Application |
| `<REPOSITORY_URL>` | `https://github.com/org/repo.git` |
| `<WORKING_DIRECTORY>` | `/path/to/repo` |
| `<PRIMARY_BRANCH>` | `main` |
| `<COOPERATOR_NAME>` | Alex |
| `<COMMUNICATION_LANGUAGE>` | English |
| `<ACTIVE_AP_VERSION>` | v1 or v2 |

## Files to copy from the AP source repository

### Universal (required)

- `AP.md` — copy v1 **or** rename v2 content to `AP.md` (exactly one active protocol)
- `AP_ORCHESTRATOR.md`
- `AP_WORKER.md`
- `PROMPT_CONTRACTS.md`
- `ARTIFACT_LIFECYCLE.md`

### Project-specific (customize from templates)

- `AGENTS.md` (this template set)
- `WORKERS.md`
- `BOOT_ORCHESTRATOR.md`
- `BOOT_WORKER.md`
- `NEXT_ORCHESTRATOR.md`
- `NEXT_WORKER.md`

### Optional reference

- `GLOSSARY.md`, `VERSIONING.md`, `ADOPTION.md`

## Choosing v1 or v2

| Version | When to choose |
|---|---|
| **v1** | Single Worker default; simplest adoption |
| **v2** | Need sequential relay, specialist chains, or bounded parallel workstreams |

See the AP source [ADOPTION.md](../../ADOPTION.md).

## Important rules

- Template files are **not task authority**.
- Customize placeholders **before** starting implementation work.
- End with exactly **one active `AP.md`**.
- Initialize `WORKERS.md` with one `Worker_1` by default; expand only with COOPERATOR approval.

## Quick start after customization

1. Commit customized overlay files.
2. Start an Orchestrator instance; read BOOT_ORCHESTRATOR.md.
3. Verify repository public state.
4. Issue one Worker launch-and-task prompt for `Worker_1`.
