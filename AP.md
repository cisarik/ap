# Analytic Programming Protocol — Active Protocol Redirect

> **The active protocol for this repository is AP version 3.**
> Read **[APv3.md](APv3.md)** for the normative protocol text.

This file (`AP.md`) is a redirect. AP version 1 previously lived here; it has been **superseded by AP version 3**. The v1 text is preserved in Git history.

## Why this is a redirect

A consuming project MUST end with exactly one active `AP.md`. In this source repository, the active generation is now v3, and the normative text lives in `APv3.md` so that v1 and v2 can remain available as superseded reference without colliding with the active protocol.

- **Active protocol:** [APv3.md](APv3.md) — AP version 3 (single-Worker Coordinator Protocol with intentional Worker instance rotation).
- **Superseded (retained reference):** [APv2.md](APv2.md) — AP version 2 (experimental multi-Worker topology; not adopted as active governance).
- **Superseded (in Git history):** AP version 1 — formerly this file.

## For consuming projects

A consuming project copies **[APv3.md](APv3.md)** to its own `AP.md` as the active protocol. Do not copy this redirect file as your active protocol.

See [VERSIONING.md](VERSIONING.md) for the supersession semantics, [ADOPTION.md](ADOPTION.md) for the adoption workflow, and [ADR-0003](docs/adr/0003-apv3-protocol-generation.md) for the generation decision.

## Related reading

- [APv3.md](APv3.md) — active protocol (read this)
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md) — Orchestrator handbook
- [AP_WORKER.md](AP_WORKER.md) — Worker handbook
- [docs/adr/](docs/adr/) — architecture decision records
