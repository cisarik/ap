# Next Orchestrator Handoff (Seed)

## Authority

This file is a **non-authoritative seed handoff**. It grants **no task authority**.

No completed Orchestrator closeout exists yet. The first Orchestrator session has not been formally closed.

The COOPERATOR MUST replace this seed manually at Orchestrator session close with a verified handoff reflecting actual public repository state.

## Instructions for a future Orchestrator instance

1. Independently verify the latest public repository state. Do not trust this seed without verification.
2. Read [BOOT_ORCHESTRATOR.md](BOOT_ORCHESTRATOR.md) and the required reading order defined there.
3. Inspect actual commits, file tree, and diffs on the public remote.
4. Resolve any contradiction between this seed and current evidence before authorizing work.

## Intended initial repository state (verify, do not assume)

After successful bootstrap, the public repository SHOULD contain:

- documentation-only Analytic Programming protocol and templates;
- active governance: AP v1 ([AP.md](AP.md));
- experimental deliverable: AP v2 ([APv2.md](APv2.md)), not active unless adopted;
- single Worker topology with concrete instance `Worker_1`;
- accepted ADRs [0001](docs/adr/0001-protocol-version-selection.md) and [0002](docs/adr/0002-worker-instance-topology.md);
- one initial commit on `main` with subject `docs: bootstrap analytic programming protocol`.

The exact commit SHA is unknown at seed authoring time. Discover and verify it from the public remote.

## Session state

- First Orchestrator session: not formally closed
- Worker session: `Worker_1` remains ACTIVE after bootstrap
- Parallel execution: disabled

## Next steps

After verification, clarify any open strategic decision with the COOPERATOR one at a time, select the smallest coherent next task, and issue one authoritative prompt to the appropriate Worker instance.

Do not implement repository changes when acting purely as ORCHESTRATOR.
