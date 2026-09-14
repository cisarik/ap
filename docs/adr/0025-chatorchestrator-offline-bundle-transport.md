# ADR-0025: ChatOrchestrator Offline Bundle Transport

Status: Accepted

Date: 2026-09-14

Artifact relationship: **historical** design rationale; retained evidence for AP
maintainers and consumers, discoverable through the ADR index. [AP.md](../../AP.md)
remains the sole semantic owner and [PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
owns exact structural spellings. Retain this decision with its implementation
history; retirement requires separate explicit lifecycle authority.

## Context

ChatOrchestrator inspection containers can inspect GitHub through some
web or provider surfaces while `git clone`, `git fetch`, and `git ls-remote`
fail (DNS or outbound Git). Continuity was then blocked before ordinary
next-Worker routing even when the Cooperator already possessed the exact
committed repositories locally.

Live AP also fused three distinct axes: native planning mode, first-Planner
identity, and manual Cooperator delivery. ADR-0023 recorded a first manual
native Planner. That delivery default is too strong for a full Orchestrator
with authorized functioning dispatch. Native planning mode remains required
for the first Planner.

A further observed conflict: phase-specific public-ref gates apply only when
publication authority exists, and §12 is capability-adaptive, but RF-19
manual retrieval, restoration, Continuation Bootstrap, and inspection-clone
wording could still demand independently observed public commits before a
ChatOrchestrator might continue.

Accepted design does not certify this implementation candidate, publication,
consumer adoption, or logical-whole closure.

## Decision

1. **ChatOrchestrator-only offline transport.** Full Orchestrators, Planners,
   Implementation Workers, diagnostic and correction Workers, independent
   Acceptance or Audit Workers, publication Workers, and deployment Workers
   retain ordinary Git access and ordinary GitHub or public-ref verification
   according to their authority. GitHub remains the normal publication and
   public verification layer.

2. **Two evidence classes**, owned in AP.md:

   - `exact committed bundle evidence`
   - `independently observed current public branch evidence`

   A valid offline package may prove exact Git objects, ancestry represented by
   those objects and prerequisites, trees, blobs, derivable diffs, the exact
   `.ap` gitlink, and an exactly bundled companion-trace commit. It does not
   prove current GitHub branch HEAD, successful push, remote synchronization,
   current remote-tracking state, absence of a newer public commit, Cooperator
   uncommitted worktree state, or sender authenticity merely because hashes are
   internally valid. When public observation is missing, record
   `public branch state not directly observed`. Never promote bundle evidence
   into public evidence.

3. **Executable `ap bundle`.** Invoked from the standalone AP checkout, not as
   the consumer `.ap` submodule. Primary UX: `ap bundle <project> --initial`
   then `ap bundle <project>`. Payload is Git bundles inside an attachment ZIP
   created with `git archive --format=zip` in a throwaway repository. No
   `zip(1)` dependency. No working-tree ZIP. No source mutation. Chain state
   is XDG user state, not consumer Git. Incremental packages are cumulative
   from the chain initial (`A..HEAD`), not adjacent deltas. Companion traces
   are explicit `--companion-trace` opt-in. Other submodules are fail-closed
   unless `--include-submodule`. Canonical AP may self-bundle without `.ap`.

4. **Ephemeral inspection checkout.** Reconstruct locally from bundles. Do not
   fetch remotes. Lost cache ⇒ new `--initial`, never GitHub, mirrors, DNS
   pinning, or guessed recovery. `git bundle verify` for incremental packages
   runs in the reconstructed repository so prerequisites are actually checked.
   Named revisions such as `HEAD` are used to create bundles after verifying
   `.ap HEAD` equals the superproject gitlink; a raw unreferenced gitlink SHA
   is not used as the sole `git bundle create` argument.

5. **First-Planner delivery correction.** Native planning mode remains required
   for the first Planner. Delivery route is separate: ChatOrchestrator uses
   manual Cooperator ferry; a full Orchestrator with authorized functioning
   dispatch dispatches the complete prompt, including the first Planner, unless
   opt-out, unavailable dispatch, or an independence/external-fresh-session
   constraint requires manual delivery.

6. **Presentation tokens.** Capsule textual states `ready`, `waiting`,
   `blocked`, and `partial` are routing presentation. They are not phase PASS
   or ORCHESTRATOR closure. Emoji never independently conveys authority.

This ADR partially supersedes ADR-0023's first-manual-Planner *delivery* rule
only. It does not rewrite ADR-0022 or ADR-0023 bodies and does not change the
native-mode rule.

## Rejected Alternatives

- Making ChatOrchestrator GitHub-less by weakening public gates for all actors
- Worktree ZIP or filesystem copy as transport
- Recreating Git object identity by stripping tracked binaries or secrets
- Storing companion paths or bundle state in closed schema-v1 `ap.project.conf`
- Scanning sibling directories or hardcoding `cisarik/meta`
- GitHub mirrors, reverse proxies, or pinned GitHub IPs as continuity
- Conversational context as the repository
- Adjacent incremental bundles (`A..B`, `B..C`) that break if an intermediate
  update is missing
- A committed mega-suite (ADR-0015 remains)
- A global `--force` that silently exports secrets
- Rewriting historical ADR bodies

## Security Limitation

`.gitignore` is not a secret sanitizer. Initial bundles include reachable
history. Filename scanning is fail-closed and does not prove absence of secrets.
`--allow-path` is an explicit exception recorded in the manifest.

## Compatibility and Migration

Prospective documentation plus a new executable command. Existing
`init`/`doctor`/`project`/`exec`/`update` contracts, managed `AGENTS.md` block,
and schema v1 are unchanged. Consumers adopt only by moving the `.ap` gitlink
after AP publication and acceptance. Leftover XDG chain state after rollback is
inert.

## Related Documents

- [AP.md](../../AP.md)
- [ADR-0023](0023-practical-workflow-consolidation.md)
- [ADR-0022](0022-default-agent-dispatch-trace-integrity-and-pin-presentation.md)
- [ADR-0015](0015-monolithic-ap-test-suite-retirement.md)
- [RF-19](../../AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity)
- [RF-12](../../AP.md#rf-12-git-and-recovery-classification)
- [RF-15](../../AP.md#rf-15-protocol-variants-and-stable-integration)
