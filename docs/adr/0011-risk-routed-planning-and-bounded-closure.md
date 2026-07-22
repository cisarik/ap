# ADR-0011: Risk-Routed Planning and Bounded Closure

## Status

Accepted

## Date

2026-07-22

## Context

AP already separates capability from authority, requires repository evidence,
supports current-session renewal, prevents Plan approval from granting
execution, and selects evidence proportionately. Field incidents nevertheless
exposed a linked failure cluster: universal fresh-Worker bias, duplicate plans,
report and audit recursion, repeated non-terminal blockers, authority
fragmentation, disproportionate proof, brittle structured parsing, cleanup
masking the first failure, and privilege probes being mistaken for privilege.

The protocol also needed to state its human governance explicitly. AP exists to
support meaningful cooperation among COOPERATOR, ORCHESTRATOR, and WORKER, not
to default to opaque agent-to-agent operation. Human participation must remain
meaningful without becoming approval of every deterministic internal step.

## Decision

### Human-Governed Collaboration

The Cooperator remains informed about objective, logical-whole boundaries,
Worker and Plan-mode routing, material authority, important risks and
trade-offs, acceptance, and closure. The Orchestrator translates technical
evidence into understandable decisions and preserves the Cooperator's ability
to brainstorm, challenge assumptions, and decide product, value, cost,
privacy, risk, irreversible operations, changed objectives, and acceptance.

Relevant brainstorming is classified as blocker, risk, backlog, future logical
whole, or protocol observation. It never becomes implementation authority
automatically. Routine deterministic steps may remain inside a bounded
authority envelope without microapproval. Explicitly authorized internal
delegation remains one accountable WORKER, visible through Orchestrator routing
and Cooperator-legible closure, and is never independent audit. Autonomous
multi-agent activity is not the default.

### Two Planning Layers

The Orchestrator owns orchestration planning: objective, logical whole, risk,
authority, routing, sequencing, approval, evidence, acceptance, and closure. A
Worker owns repository-grounded implementation planning only when unresolved
technical paths, architecture, migration, security, rollback, cross-layer
impact, or reconnaissance materially affect safe implementation authority.
Task complexity alone does not activate Plan mode.

Plan-only prompts use the exact contract in `PROMPT_CONTRACTS.md` and default to
one planning cycle. Another cycle requires new evidence, new material risk,
rejected assumptions, or a changed objective. A healthy planning Worker
normally receives approved implementation through renewed current-session
authority; fresh routing remains required for independence or degraded context.

### Risk-Based Freshness

Freshness is selected from independence, context integrity, model or client
change, risk, and continuity. It is required for independent audit and
compromised or uncertain context, recommended for high-risk independent review,
optional for unrelated bounded work, and counterproductive for healthy
continuation where retained repository understanding reduces error. A missing
target selects neither route. Freshness alone never proves independence.

### Bounded Closure

Formal reports require new mutation, evidence, material risk, changed external
state, final acceptance, or explicit closure. Informal progress remains
available. The second equivalent `PARTIAL` or `BLOCKED` result must expose the
exact blocker, smallest authority expansion, direct closure path, consequence
of inaction, and required decision; a third requires material change.

One logical whole normally receives one primary independent audit, one
proportionate re-audit after correction, and one context-only fresh handoff.
Exceptions are new mutation, invalid audit evidence, compromised independence,
new material risk, missing required evidence, changed objective, or changed
external state. Once a safe closure path is known, the Orchestrator authorizes
it, rejects it concretely, or identifies exact missing evidence.

### Evidence and Authority

General evidence tiers E0 through E4 scale from informational to critical or
irreversible work using consequence, reversibility, uncertainty, and
trust-boundary impact. E3/E4 require fresh independent acceptance. Activated
specialized profiles, especially `INFOSEC.md`, may be stricter.

A combined bounded authority envelope may cover related correction, tests,
commit, non-force push, deployment, bounded verification, acceptance, and
restart persistence when scope is narrow, rollback and stage gates are defined,
and independence adds no material value. It never combines destructive or
irreversible work, security boundaries, credentials or access control, broad
production impact, or required independent acceptance.

### Operational Evidence

Task-sensitive automation preserves the first causal error, separates transport
status, bounded body capture, and structured parsing, reports parser failure,
uses exact owned temporary paths, and prevents cleanup or reporting errors from
overwriting the primary result. Privilege belongs to the process accessing the
protected resource; a prior `sudo -n` probe grants nothing to a later process,
and ownership or permissions are not weakened as a workaround.

### Surface and Communication Routing

Requested, observed, and attested model and reasoning values remain distinct.
Enhanced or maximum mode, automatic model selection, sub-agents, internal
delegation, Explore-style tasks, and Worker topology are routed separately when
material. Automatic selection is off where exact model capability or
no-fallback evidence matters. Quota and cost never weaken required evidence.

Communication routing remains project-configurable for operator language,
Orchestrator language and grammatical convention, Worker prompt/report/direct
language, required report header, documentation language, and shell/platform
presentation. Localized labels are presentation values, never universal
natural-language requirements.

## Structural Ownership

`AP.md` owns compact normative anchors. The handbooks and
`PROMPT_CONTRACTS.md` own operational guidance and exact fields.
`PROMPT_ENGINEERING_PATTERNS.md` remains advisory and reworks only P02, P03,
P04, P08, P11, and P12. This ADR records rationale. Project overlays own local
communication values. No new profile, role, prompt generator, or persistent
handoff artifact is introduced.

## Compatibility

The change is prospective. Historical prompts remain interpretable under their
original AP pin, and consumers remain on exact gitlinks until a separate update
task. Existing session and mode values, standard report header, managed
`AGENTS.md` block, `ap` tool, doctor behavior, integration workflow, and update
workflow are unchanged. ADR-0008's universal fresh-default wording and
ADR-0009's planning details are prospectively refined; their remaining
authority and routing decisions stay in force.

## Consequences

Safe work can close with fewer handoffs, plans, reports, and audits while
high-impact work retains explicit independence. Healthy sessions preserve
repository understanding. Cooperator attention moves to material decisions
rather than deterministic mechanics. The main risk is under-routing rigor;
E3/E4, specialized-profile overrides, explicit exceptions, and semantic
negative tests control it.

## Rejected Alternatives

- Plan mode always on or always off.
- Fresh Worker as a universal default.
- Plan, audit, or report cycles without new evidence or risk.
- Mandatory maximum reasoning or production-grade proof for every change.
- Agent-only or autonomous multi-agent operation as the normal AP workflow.
- Human approval for every internal deterministic step.
- Combining implementation with required independent acceptance.
- A new profile, manifesto, BOOT/NEXT artifact, prompt generator, or semantic
  version file for this change.
- Project-specific language, person, product, host, client, or vendor rules in
  the universal protocol.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../PROMPT_ENGINEERING_PATTERNS.md](../../PROMPT_ENGINEERING_PATTERNS.md)
- [0008-worker-session-target-and-authority-renewal.md](0008-worker-session-target-and-authority-renewal.md)
- [0009-capability-aware-worker-routing-and-execution-gates.md](0009-capability-aware-worker-routing-and-execution-gates.md)
- [0010-defensive-security-profile.md](0010-defensive-security-profile.md)
