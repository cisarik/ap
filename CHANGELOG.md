# Changelog

This file records human-readable AP distribution changes. Git history remains
the authoritative archive for exact content.

## Unreleased

- Consolidated the live protocol into one normative `AP.md`.
- Removed parallel live protocol-generation files from the working tree.
- Selected pinned `.ap/` Git submodule distribution for consuming projects.
- Added the dependency-free `ap` integration tool with `init`, `doctor`, and
  explicit update commands.
- Replaced copy-based adoption with a managed `AGENTS.md` integration block.
- Removed permanent source-session BOOT, NEXT, and WORKERS artifacts from the AP
  source distribution.
- Documented dynamic Orchestrator restoration prompts as the default rotation
  path.
- Kept repository handoff artifacts exceptional, Worker-authored, and
  lifecycle-bound.
- Added migration guidance for projects that previously copied AP files.
- Hardened update validation with strict pinned doctor checks, candidate
  validation for update and rollback review, forward-only update semantics, exact
  managed-block checks, and safer temporary publication.
- Formalized adaptive orchestration phases, separate preflight criteria,
  reasoning-effort recommendations, public-verification evidence tiers,
  browser and Cooperator acceptance boundaries, and optional Discovery Records.

## Historical Generations

Previous protocol generations and deleted source-session artifacts are available
through Git history by commit SHA. They are not retained as current files
because the live repository must expose one clear protocol and one integration
path.
