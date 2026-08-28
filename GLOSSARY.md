# AP Glossary

Artifact relationship: **explanatory projection** of
[AP semantic authority](AP.md#semantic-authority-and-artifact-relationships).
These definitions explain canonical terms; they do not create requirements.
Follow the linked AP rule family and structural contracts for exact behavior.

## Core Roles, Authority, and Routing

| Term | Explanation |
|---|---|
| Analytic Programming | Vendor-neutral, human-governed coordination protocol based on intent, bounded authority, evidence, validation, and finite convergence. |
| COOPERATOR | Persistent human-owner role for material objectives, routes, trade-offs, subjective acceptance, and residual risk; see [RF-01](AP.md#rf-01-cooperator-sovereignty-and-material-decisions). |
| ORCHESTRATOR | Persistent coordination role for recommendations, task grants, reconciliation, and deterministic closure; see [RF-02](AP.md#rf-02-orchestrator-decision-reconciliation-and-closure-authority). |
| WORKER | Persistent bounded-execution role that validates and reports but never closes the logical whole. |
| Instance / session | A concrete role occupant / its bounded context and lifecycle. |
| Logical Whole Identity | Stable lowercase kebab-case coordinate for one bounded objective until closure, cancellation, or material objective change; see [RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity). |
| Worker Session Ordinal | Two-digit coordinate for one concrete Worker session inside one logical whole; it is not a session target or proof of independence. |
| Worker Exchange Ordinal | Two-digit coordinate for one separately authorized prompt/outcome lifecycle inside a Worker session; current-session renewal increments it. |
| Worker session target | Exact routing value `fresh-worker-session` or `current-worker-session`; it is not authority or proof of independence; see [RF-05](AP.md#rf-05-freshcurrent-routing-and-independent-acceptance). |
| Fresh Worker Session | New session that inherits no prior grant and re-establishes evidence; freshness versus independence is owned by [RF-05](AP.md#rf-05-freshcurrent-routing-and-independent-acceptance). |
| Current Worker Session | Exact healthy session reused under a complete renewed grant and continuity anchor; evidence remains non-independent. |
| Worker Session Profile | Bounded authority/evidence posture such as implementation, probe, correction, audit, or re-audit; not a role or phase. |
| Continuity Anchor | Precise prior task/report/commit boundary identified by a current-session prompt. |
| Authority Renewal | Complete new current-session grant after prior authority expired. |
| Task Authority | Concrete permission supplied only by the current complete Orchestrator prompt. |
| Terminal Formal Report | `PASS`, `PARTIAL`, or `BLOCKED` report that expires the current Worker grant. |
| Human-Governed Collaboration | Cooperator material decisions plus bounded deterministic execution without per-step microapproval. |
| Cooperator Routing Sovereignty | Orchestrator recommends; Cooperator selects; a Worker does not reopen the selected route. |
| Selected Route | Cooperator-chosen session/capability/reasoning/native-mode route, distinct from recommendation and observation and granting no authority. |
| Agent Orchestrator | Descriptive capability-profile label for an Orchestrator whose client exposes session-dispatch capabilities and which defaults to direct Worker dispatch unless the Cooperator explicitly opts out (P14); still the ORCHESTRATOR role; see [RF-06](AP.md#rf-06-capability-reasoning-permission-containment-and-authority). |
| Read-Only Orchestrator | Descriptive capability-profile label for an Orchestrator lacking dispatch capabilities or not authorized to use them; fully valid; copy-paste prompt delivery remains lawful. |
| Subagent dispatch | Orchestrator delivery of one complete authoritative Worker prompt into one concrete session; default route for Agent Orchestrators unless the Cooperator opts out (P14); the receiving session is an ordinary Worker; a parent-context spawn is not a fresh session and cannot provide independent acceptance; see [RF-05](AP.md#rf-05-freshcurrent-routing-and-independent-acceptance). |
| Material Phase Gate | Routing reconsideration caused by a material objective, authority, independence, security, capability, external, acceptance, or recovery change—not an ordinary substep. |

## Planning, Execution, and Evidence

| Term | Explanation |
|---|---|
| Orchestration Planning | Orchestrator-owned objective, route, evidence, sequencing, acceptance, and closure design. |
| Implementation Planning | Explicit Worker-owned repository-grounded technical planning; never execution authority. |
| Native Planning Mode | Optional client state structurally recorded as `required` or `not-used`; not a phase or grant. |
| Plan-to-Execution Gate | Terminal planning report expires planning authority; execution needs a separate complete `not-used` prompt. |
| Planning Budget | One initial implementation-planning cycle and at most one qualifying targeted revision; see [Planning Budget and Expiry](AP.md#planning-budget-and-expiry). |
| Phase | Adaptive work mode such as Discovery, Preflight, Implementation, Acceptance, Diagnostic Closeout, Independent Audit, or Restoration. |
| Embedded / Separate Preflight | Checks inside every implementation / distinct read-only preparation used when mutation authority is premature. |
| Worker-Executed Preflight | Read-only Worker collection of bounded current-state evidence. |
| Orchestrator-Led Cooperator-Executed Preflight | Stepwise owner execution of bounded read-only commands or observations, classified by the Orchestrator. |
| Fresh Evidence Probe | Profile for one named evidence claim with explicit temporary/repository/durable/external mutation boundaries. |
| Temporary Probe-State Mutation | Exact bounded temporary fixture mutation, separate from durable or production state. |
| Capability Profile / Handshake | Functional abilities / evidence-labelled check using requested, observed, inferred, or unknown states. |
| Technical Permission | Client/platform control over whether an operation can run; distinct from authority. |
| Containment or Sandbox | Technical restriction of resources/effects; neither a textual prompt nor task authority. |
| Side Effect | Read-only, reversible local, destructive local, remote, communication, deployment, or credential/billing consequence. |
| Evidence Tier | E0–E4 selection from consequence, reversibility, uncertainty, and trust-boundary impact. |
| Combined Implementation Envelope | Ordered implementation stages, gates, recovery, and one terminal point; evidence remains non-independent. |
| Independent Acceptance Envelope | Separate fresh acceptance of a fixed candidate by a Worker that did not materially implement it. |
| Acceptance Plan / Criteria | Planned evidence / concrete conditions for task completion. |
| Evidence | Observable files, diffs, tests, output, public refs, screenshots, or owner observations supporting a claim. |
| Assumption | Unverified premise that remains explicit and is resolved before relevant high-risk action. |
| Source of Truth | Current verifiable repository, test, Git, public, decision, and specification evidence rather than memory. |
| Public-Verification Evidence Ladder | Direct Git, official ref/commit API, immutable exact-SHA content, then supplementary branch evidence. |
| Evidence Equivalence | Rotation or fallback preserves the selected claim/evidence standard unless new authority strengthens it. |
| First Causal Error | Earliest operation failure; parser, cleanup, and reporting failures remain secondary. |

## Convergence and Artifacts

| Term | Explanation |
|---|---|
| Implementation PASS | Non-independent evidence that a bounded candidate was produced and validated. |
| Acceptance PASS | Authorized evidence accepts the exact candidate, independently where required. |
| Publication / Deployment / Production acceptance PASS | Separate result that proves public ref / deployed artifact / required production behavior and reconciliation. |
| ORCHESTRATOR closure | Deterministic transition after required results, Cooperator decisions, risk, ledger, and active-mutation gates. |
| Report / Audit / Handoff Budget | Finite justification for formal reports, one primary acceptance plus correction re-acceptance, and bounded context transfer. |
| Bounded Correction Worker | Profile implementing one concrete finding; never self-certifying. |
| Fresh Independent Audit / Re-Audit | Fresh independent review of a fixed candidate / one correction and original risk claim. |
| Independent Certification | Evidence from a fresh verifier that did not materially implement the candidate. |
| Diagnostic Closeout | Bounded, normally read-only review of the same implemented slice. |
| Compact Communication | Links stable owners while retaining complete task-specific authority and evidence. |
| Validation ladder | Prompt-selected evidence sequence from inspection through independent acceptance; a broad or full suite is not automatic. |
| Development envelope | Named, versioned, project-owned tooling, interpreter, topology, and reversible-class declaration activated only by the current prompt. |
| Cooperator presentation profile | Project-owned Cooperator-facing routing package emitted after the copyable, structurally English Worker prompt when activated; marks are not task authority. |
| Companion Integrity Invariant | Requirement that an archived report companion must be a valid terminal report (or authorized interruption) and must never be byte-identical to or a duplicate of the issued prompt; see [RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity). |
| Local trace filename grammar | Activated trace storage spelling projected as archival destination; never universal AP meaning. |
| Continuation Bootstrap | Two-stage post-pause rule: restore and reconcile read-only, then obtain Cooperator selection of exactly one bounded next logical whole before any mutation grant; see [AP semantics](AP.md#continuation-bootstrap) and the [operational entry point](AP_ORCHESTRATOR.md#continuation-bootstrap). |
| Discovery Record | Optional non-authoritative exploration artifact with consumer, promotion target, and lifecycle. |
| External Analytic Development Trace | Optional explicitly activated selective historical-evidence projection subordinate to governing AP and current project/external truth; see [RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity). |
| Trace Projection | Replaceable storage, layout, discovery, index, and validation representation of RF-19 semantics; it does not own those semantics. |
| Interruption Companion | Non-Worker-owned historical outcome used only when no terminal report exists, recording safely known cancellation, interruption, or supersession facts. |
| Atomic Archival Transaction | First archival of an exact prompt and existing outcome together; in Git both have the same unique first-add commit. |
| Upgrade Observation Ledger | Non-authoritative `upgrade <canonical-repository>` entries in `untriaged`, `accepted`, `duplicate`, `rejected`, `invalidated`, `implemented`, or `parked` states. |
| Durable Upgrade-Ledger Storage Projection | Optional consumer-owned Markdown retention of active RF-09 observations, discovered only by an explicit project-rule declaration and never a semantic or authority owner; exact structure is in [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md#upgrade-observation-ledger-contract). |
| Active-Context Reconciliation | Closure removal of terminal ledger entries from active context while preserving unresolved entries and historical provenance. |
| Restoration Prompt / Readiness | Self-contained context transfer without mutation authority / PASS-PARTIAL-BLOCKED completeness review. |
| Orchestrator Initialization Signal | Explicit directive in a restoration prompt declaring whether the successor Orchestrator session requires an `Agent Orchestrator` (dispatch tools enabled) or `Read-Only Orchestrator` (interactive / copy-paste messenger) profile, reflected in the filename convention `00_handout_agent.md` vs `00_handout_readonly.md`. |
| Repository Handoff | Exceptional lifecycle-bound context for state not reconstructable from durable evidence and the next task. |
| Pattern Library | First-class universal advisory [PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md) projection; not a second protocol or generator. |
| Artifact Relationship | Structural, operational, advisory, explanatory, historical, executable, or consumer relationship to AP. |

## Security, Browser, Provider, and Operations

| Term | Explanation |
|---|---|
| Defensive-Security Profile | Activated advisory `INFOSEC.md` procedures for owned or authorized targets under AP precedence. |
| Security Task Class / Threat Model | Risk-routed defensive work / assets, boundaries, inputs, properties, and abuse cases. |
| Candidate Weakness / Reachability | Suspicious pattern / established entry point, path, and enabled state; a CVE/CWE alone proves neither. |
| Evidence Class | `reproduced-dynamic`, `established-static`, `inferred`, or `hypothesis-unverified`; caps exploitability. |
| Synthetic Containment / Temporary Audit Root | Isolated synthetic proof environment / exact declared temporary identity and lifecycle. |
| Residual Risk | Risk remaining after evidence/correction; material disposition belongs to the Cooperator. |
| False-Positive Rejection | Positive audit result `rejected-false-positive` with disproving evidence. |
| Source Version Record | Title, owner, exact version/status/date, and supported AP concept for external security material. |
| Failure Episode | Stable browser-verification failure identity with zero to two meaningful recovery attempts. |
| Browser Verification Stall Guard | Stops repair on repeated/conclusive no-progress, preserves evidence, and names missing verification. |
| Amended Expectation | Cooperator-changed acceptance expectation followed by separate Orchestrator record/grant and Worker validation. |
| Owner-Executed Command Block | One paste-safe bounded block with purpose, markers, fail-closed preconditions, exit, and abort path. |
| Authentication Boundary | Separation of filesystem permission, reachability, application authentication, and identity. |
| Privilege Release Evidence | Observed release, exact-session-loss unknown, or no-use non-applicability, separate from connection closure. |
| Continuous Closure Loop | Authorized fixture→call→result→diagnosis→correction→tests→deployment/retry→reconciliation route. |
| Provider Accounting | Scoped relationships among intended submissions, invocations, retries/duplicates, outcomes, and local records; no call authority. |
| Untrusted Content / Instruction Conflict | Lower-trust data does not govern merely by appearing in context / unresolved governing conflict stops or escalates. |

## Integration Terms

| Term | Explanation |
|---|---|
| AP Source Repository | Canonical `https://github.com/cisarik/ap` distribution. |
| Consuming Project | Project pinning AP, normally at `.ap/`. |
| Gitlink | Superproject tree entry recording the exact submodule commit. |
| Managed AP Block | Exact `AGENTS.md` block generated by `./.ap/ap init`, pointing to pinned AP without copying it. |
| Protocol selection tuple | Canonical repository, `.ap` path, immutable gitlink, matching checkout, and exact managed block resolving `stable`. |

## Exploitability Conclusion

Explanatory name for `demonstrated`, `probable`, `plausible but unproven`, `not
demonstrated`, or `not applicable`, capped by the structural evidence class.

## Containment Ledger

Explanatory name for the activated audit record of each temporary root, fixture,
account, network target, owner, permissions, allowed contents, and cleanup.

## Worker Surface

Client/provider/model/reasoning configuration observed for one Worker session;
requested selection is not verified identity.

## Model-Suitability Evidence

Dated project-owned advisory observations for routing; not a universal benchmark
or semantic rule.

## Silent Fallback

Unreported substitution of a materially different capability route; AP treats
it as invalid where evidence may be weakened.

## Routing Escalation

Explicit route change or honest limitation when capability, quota, cost, or
policy prevents required evidence.

## Protocol Variant

One stable, experimental, or derivative protocol line; exactly one declared
source governs a consumer under [RF-15](AP.md#rf-15-protocol-variants-and-stable-integration).

## Governing Protocol Source

The selected canonical repository identity, immutable version identity, and
variant recorded in project rules. Non-governing rules are not blended.

## Recovery Candidate

One exact difference classified across `accepted-continuation`,
`unrelated-owner-work`, `stale-clone`, `unpublished-candidate`, and
`unexplained-divergence`; precedence selects action while secondary facts stay.

## Logical Whole

Bounded objective, authority, evidence, and closure unit. “Logical block” is a
compatibility synonym.

## Closure Signal

Project-declared string emitted only by the Orchestrator after closure gates;
universal AP defines no localized literal.

## Near-Miss Record

Report evidence of a detected and resolved execution issue, cause, resolution,
and residual risk; `none` is valid.

## Normative Terms

`MUST`, `MUST NOT`, `SHOULD`, `SHOULD NOT`, and `MAY` have force only in the
canonical semantic owner within its scope. Their appearance here is explanatory.
