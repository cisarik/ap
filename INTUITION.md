# AP Intuition — Brief Orchestrator Projection

Artifact relationship: **explanatory projection** of
[AP semantic authority](AP.md#semantic-authority-and-artifact-relationships),
with advisory quick-rules. [AP.md](AP.md) prevails on every conflict. This file
is optional, is never required reading, and is never a semantic owner: it
teaches, it does not rule. Historical rationale:
[ADR-0019](docs/adr/0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md)
and
[ADR-0020](docs/adr/0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md).

## 1. What This File Is

A brief intuition aid for Orchestrators who already know AP. It compresses the
capability-profile, dispatch, and intuition-boundary rules into quick-rules and
links every durable rule to its owner. When this file and [AP.md](AP.md)
disagree, [AP.md](AP.md) wins. Consumers that never read this file lose
nothing. Minimum reading for each role is owned by the
[per-role minimum-reading spine](AP.md#per-role-minimum-reading-spine);
this file is never part of that spine.

## 2. Roles and Capability Profiles in One Page

AP has exactly three persistent roles — COOPERATOR, ORCHESTRATOR, WORKER
([AP §2](AP.md#2-roles)). Capability profiles, session profiles, phases, and
dispatch arrangements never add a fourth role
([RF-06](AP.md#rf-06-capability-reasoning-permission-containment-and-authority)).

- **Agent Orchestrator** — an ORCHESTRATOR whose client functionally exposes
  session-dispatch or tool-routing capabilities and whose Cooperator-selected
  route, or accepted plan for the logical whole, authorizes using them.
- **Read-Only Orchestrator** — an ORCHESTRATOR lacking those capabilities or
  not authorized to use them; fully valid; copy-paste prompt delivery stays
  lawful.

Both names are descriptive labels of one ORCHESTRATOR role. A profile never
grants authority.

## 3. Orchestrator Intuition Boundary

Orchestrator-direct action is lawful only when all hold: inside an accepted
logical whole's routing duty; deterministic or reversible; no semantic-owner
mutation; no independence claim; no substituted Cooperator material decision;
inside the accepted plan. Owner:
[RF-02](AP.md#rf-02-orchestrator-decision-reconciliation-and-closure-authority).

| Orchestrator-direct allowed | Worker-required |
|---|---|
| synthesize and readiness-review Worker grants | author AP or protocol content |
| read-only inspection and preflight | implementation PASS on a material candidate |
| RF-19 staging and archival after the report exists | any acceptance requiring independence |
| dispatch-worktree create/remove when the plan names it | publication, deployment, production |
| project-owned Cooperator presentation after the copyable prompt | consumer pin updates |
| restore and clean own routing state | host, credential, or account changes |
| direct acceptance at ladder rung 1 for E0/E1 claims not needing independence | material protocol design not already locked |

Direct acceptance never waives independence where the evidence route requires
a fresh Worker
([RF-05](AP.md#rf-05-freshcurrent-routing-and-independent-acceptance)).
Intuition never bypasses the
[Plan-to-Execution Gate](AP.md#plan-to-execution-gate).

## 4. Subagent Dispatch as Worker Delivery

Dispatch delivers **one complete authoritative Worker prompt** — coordinates,
session target, profile, boundaries, report contract — into **one concrete
session** ([AP §3](AP.md#worker-session-target)). A tool-task summary is not a
prompt. The receiving session is an ordinary Worker session under
[RF-03](AP.md#rf-03-worker-bounded-authority-and-report-expiry) and
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity); the
dispatcher remains the Orchestrator.

- Authorization is whole-or-route level: the Cooperator-selected route or the
  accepted plan. No per-spawn microapproval; the default stays not-used.
- Parallel dispatch stays under single-active and the bounded parallel
  exception; an audit is never dispatched in parallel with implementation.
- If dispatch is absent, unauthorized, or cannot deliver the complete prompt,
  ordinary copy-paste delivery remains lawful.

## 5. Fresh Independent Audit Checklist

Every check is observable; owner:
[RF-05](AP.md#rf-05-freshcurrent-routing-and-independent-acceptance).

- `Worker session target: fresh-worker-session`, next session ordinal,
  exchange `01`.
- Zero parent conversation, shared memory, compaction summary, or Orchestrator
  reasoning beyond the acceptance-record inputs.
- A different concrete session from the implementer.
- Receives only the issued prompt text as initial context.
- Worktree isolation is never treated as proof of independence.

A session spawned inside the parent Orchestrator's conversation, or inheriting
its history or reasoning, is not fresh and cannot provide independent
acceptance. A dispatched session that discovers parent-context inheritance
stops and reports it.

## 6. Dense Grants by Citation

Cite owners instead of recopying them
([AP §17](AP.md#17-compact-communication),
[PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md)): name the
owning rule family for each boundary; keep task-specific boundaries spelled out
inside the prompt itself; activate only triggered annexes; keep the compact
communication completeness floor; no token caps; no generator-owner. Citations
are context, never authority.

## 7. Optional Signaling

Signaling — emoji, capsules, localized presentation — is project-owned
optional presentation, emitted after the copyable structurally English prompt
([Cooperator Delivery record](PROMPT_CONTRACTS.md#cooperator-delivery-and-trace-destination-record),
[optional presentation profile](INTEGRATION.md#optional-presentation-profile-development-envelope-and-trace-grammar)).
It is never an AP field, never a Worker-authority gate, and inactive by
default.

## 8. Failure Quick List

- Opaque tool-task swarm instead of complete Worker prompts → stop; see
  [§19 anti-patterns](AP.md#19-anti-patterns) and
  [RF-02](AP.md#rf-02-orchestrator-decision-reconciliation-and-closure-authority).
- Parent-context subagent claimed as independent audit → invalid; see
  [RF-05](AP.md#rf-05-freshcurrent-routing-and-independent-acceptance).
- Intuition used as implementation or acceptance authority → invalid; see
  [RF-02](AP.md#rf-02-orchestrator-decision-reconciliation-and-closure-authority).
- This file, signaling, or emoji treated as semantic owner or task authority →
  invalid; see [§19 anti-patterns](AP.md#19-anti-patterns).
- Dispatch unavailable or unable to deliver the complete prompt → copy-paste
  the complete prompt; see
  [Session-And-Mode Routing](PROMPT_CONTRACTS.md#session-and-mode-routing-contract).

## Related Owners

- [AP.md](AP.md) — sole live normative protocol and semantic owner.
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md) — structural projection.
- [PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md) — advisory
  pattern projection.
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md) and [AP_WORKER.md](AP_WORKER.md) —
  operational projections.
- [GLOSSARY.md](GLOSSARY.md) — explanatory definitions.
- [ADR-0019](docs/adr/0019-subagent-delivery-of-worker-sessions-and-orchestrator-capability-profiles.md)
  and
  [ADR-0020](docs/adr/0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md)
  — historical rationale.
