# Protocol Versioning

## Source repository policy

| Artifact | Role |
|---|---|
| [APv3.md](APv3.md) | **Active version 3 protocol** |
| [AP.md](AP.md) | Redirect to active protocol (v3); v1 superseded |
| [APv2.md](APv2.md) | Superseded experimental version 2 protocol (retained reference) |

The active generation is v3. Superseded generations remain for reference and traceability.

## Semantic meaning

| Label | Meaning |
|---|---|
| **Active** | Current authoritative protocol for this source repository and recommended for adoption |
| **Stable** | Suitable as default active protocol for conservative adoption; breaking changes require explicit version bump or new file |
| **Experimental** | Complete and usable, but governance and field experience may still evolve before promotion |
| **Superseded** | Replaced by a later generation; retained for reference and Git traceability, not active governance |

AP version 3 is **Active**. AP v1 is superseded (in Git history via `AP.md` redirect). AP v2 is superseded (retained as `APv2.md` reference).

## Consuming project rule

Each consuming project MUST have **exactly one active `AP.md`**.

The recommended active generation is v3. Copy [APv3.md](APv3.md) to `AP.md`.

Do not mix generations implicitly. Do not require reading both v1 and v2. Superseded generations remain available for reference only.

## Selecting a version

1. COOPERATOR chooses v3 (recommended) or a superseded generation for legacy reference.
2. Copy the chosen document to `AP.md` (for v3, copy `APv3.md` to `AP.md`).
3. Record the choice in project `AGENTS.md`.
4. Prefer recording in a project ADR.

See [ADOPTION.md](ADOPTION.md) for copy workflows.

## Introducing breaking changes

Breaking protocol changes SHOULD:

1. be proposed with clear rationale;
2. receive COOPERATOR approval;
3. appear as a new protocol file or explicit version section in this source repository;
4. include updated handbooks and templates when affected;
5. be documented in an ADR when the project uses ADRs.

Target projects control their own upgrade timing. This source repository does not force upgrades.

## Promotion

An experimental protocol MAY be promoted to stable when:

- field experience supports it;
- companion documents are aligned;
- adoption path is documented;
- COOPERATOR approves promotion for this source repository.

Promotion might rename roles in documentation (for example, retiring v1 as default) but MUST preserve Git history.

## Deprecation

Deprecated protocols remain in Git history. Mark deprecation in README and VERSIONING. Do not silently delete historical protocol text without recording supersession.

## No package versioning

This repository does not use numerical software package versions or release automation for the protocol. Git history is the archive.

## Related documents

- [ADOPTION.md](ADOPTION.md)
- [docs/adr/0001-protocol-version-selection.md](docs/adr/0001-protocol-version-selection.md)
- [docs/adr/0003-apv3-protocol-generation.md](docs/adr/0003-apv3-protocol-generation.md)
- [docs/adr/0004-fresh-slice-diagnostic-lifecycle.md](docs/adr/0004-fresh-slice-diagnostic-lifecycle.md)
