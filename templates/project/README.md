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
| `<ACTIVE_AP_VERSION>` | v3 |

## Files to copy from the AP source repository

### Universal (required)

- `AP.md` — copy `APv3.md` content to `AP.md` (v3 is the recommended active generation; exactly one active protocol)
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

## Choosing a version

| Version | When to choose |
|---|---|
| **v3** | **Recommended.** Single-Worker Coordinator Protocol with intentional Worker instance rotation |
| **v1** | Legacy; single Worker default; superseded by v3 |
| **v2** | Legacy; multi-Worker capable; superseded by v3 |

Before adoption, consult [ADOPTION.md](../../ADOPTION.md) in the Analytic Programming source repository.

## Important rules

- Template files are **not task authority**.
- Customize placeholders **before** starting implementation work.
- End with exactly **one active `AP.md`**.
- Initialize `WORKERS.md` with one `Worker_1` by default; add later Worker labels only through sequential rotation under explicit task authority.
- Use fresh-slice implementation and diagnostic closeout proportionally; do not make every edit a mandatory two-pass workflow.

## Quick start after customization

1. Commit customized overlay files.
2. Start an Orchestrator instance; read BOOT_ORCHESTRATOR.md.
3. Verify repository public state.
4. Issue one Worker launch-and-task prompt for `Worker_1`.
