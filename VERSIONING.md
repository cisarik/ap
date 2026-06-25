# Protocol Versioning

## Source repository policy

| Artifact | Role |
|---|---|
| [AP.md](AP.md) | Stable version 1 protocol |
| [APv2.md](APv2.md) | Experimental complete version 2 protocol |

Both may coexist in this source repository for reference and adoption.

## Semantic meaning

| Label | Meaning |
|---|---|
| **Stable** | Suitable as default active protocol for conservative adoption; breaking changes require explicit version bump or new file |
| **Experimental** | Complete and usable, but governance and field experience may still evolve before promotion |

Experimental does not mean incomplete for operation — [APv2.md](APv2.md) is standalone.

## Consuming project rule

Each consuming project MUST have **exactly one active `AP.md`**.

Do not mix v1 and v2 rules implicitly. Do not require reading both.

## Selecting a version

1. COOPERATOR chooses v1 or v2.
2. Copy or rename the chosen document to `AP.md`.
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
