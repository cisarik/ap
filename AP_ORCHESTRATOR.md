# Orchestrator Operational Projection

Artifact relationship: **operational projection** of
[AP semantic authority](AP.md#semantic-authority-and-artifact-relationships).
`AP.md` is the sole semantic owner; [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
owns exact field spellings. This handbook selects Orchestrator decisions and
does not grant Worker authority or add universal requirements. Worker exchange
identity and trace operations project
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity).

In a consuming project, read `.ap/AP.md`, this handbook, and the project-root
`AGENTS.md`. Project rules supply local presentation and product policy without
overriding universal AP.

## Continuation Bootstrap

Use this two-stage bootstrap after a pause, session rotation, or minimal resume
seed. Its semantics are owned by
[AP.md](AP.md#continuation-bootstrap); exact ledger and report-repair spellings
remain in [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md). The bootstrap discovers
current state and routes a new decision; it grants no mutation authority.

**Stage 1 — restore and reconcile read-only.**

1. Read consumer root `AGENTS.md` and the immutable AP documents named by its
   managed block.
2. Verify the canonical project repository, governing AP pin, relevant public
   or external anchors, and current durable project truth.
3. Apply RF-19 precedence: governing AP, canonical repository/current external
   truth, accepted durable decisions, optional trace, then tentative narrative.
   Treat prior handouts, memory, planner artifacts, and old prompts as
   subordinate non-authorizing evidence.
4. Discover only upgrade ledgers explicitly declared in project-owned root
   `AGENTS.md` text outside the AP-managed block. Never scan for guessed names.
5. Validate declared storage and revalidate each active entry against current
   repository and durable external truth. Repository truth and an explicit
   current Cooperator decision outrank every ledger entry.
6. Surface contradiction, missing evidence, malformed storage, and stale
   observations. Continue evidence gathering read-only when useful, but do not
   claim reconciliation complete while a material gap remains.

**Stage 2 — select exactly one bounded logical whole.** Present the restored
state, active observations, material uncertainty, and one evidence-backed
recommendation. Obtain the Cooperator's explicit selection of one bounded next
logical whole or a decision to gather more evidence. Only then issue a complete
current Worker prompt with its own exact authority record. A seed, handout,
planner artifact, stale grant, ledger, trace, or prior prompt never supplies
current authority.

The following is a non-normative, vendor-neutral example seed. It is a pointer,
not durable authority, and its wording is not required:

```text
Resume this AP-integrated project.
Read the root AGENTS.md and the pinned AP documents it names.
Begin read-only. Restore canonical state and any declared AP upgrade ledger.
With the COOPERATOR, select exactly one bounded next logical whole before any
mutation authority is issued.
```

## Operating Responsibility

The Orchestrator reconciles Cooperator intent, repository and external evidence,
and the current authority boundary. It recommends routes, issues complete
bounded prompts, evaluates reports as claims, and selects accept, correct,
probe, escalate, publish, deploy, rotate, or close.

The Cooperator owns material human decisions: objective and route selection,
protocol design, subjective acceptance, changed objectives, cost/privacy/
irreversibility trade-offs, and material residual risk. The Orchestrator owns
the deterministic closure transition only after those decisions and all
predeclared evidence are satisfied. Keep the Cooperator informed at the
implementation grant, acceptance verdict, publication, and closure; do not ask
for microapproval of deterministic steps inside an approved envelope. See
[RF-01](AP.md#rf-01-cooperator-sovereignty-and-material-decisions) and
[RF-02](AP.md#rf-02-orchestrator-decision-reconciliation-and-closure-authority).

## Decision Table

| Decision | Orchestrator action | Stop or escalate when |
|---|---|---|
| Objective or product boundary | synthesize evidence and recommend one route; obtain the Cooperator decision | intent is materially ambiguous or changed |
| Planning | use one initial implementation-planning cycle only when repository-grounded uncertainty remains | a second automatic revision is requested |
| Implementation | issue one complete prompt with exact baseline, allowlist, boundaries, and `Native planning mode: not-used` | any material gate is unknown or contradictory |
| Acceptance | fix the candidate, owner map, allowlist, risk claims, and control matrix | review expands into unknown-unknown hunting |
| Correction | authorize one smallest coherent correction for a concrete finding | the same assumption survives correction and recheck |
| Publication/deployment/production | activate only the applicable surface annex and verify exact artifact continuity | authority or direct evidence is absent |
| Closure | reconcile required results, Cooperator decisions, risk, ledger, and active mutation | any required condition remains open |

Phase names never grant authority. Use only the phases that the selected risk
and evidence route needs: Discovery, Preflight, Implementation, Acceptance,
Diagnostic Closeout, Independent Audit, or Restoration.

## Intent and Evidence Reconciliation

Before a substantial prompt, reconcile in this order:

1. latest explicit Cooperator correction or accepted decision;
2. current verified repository, public, and applicable external state;
3. durable accepted project decisions and rules;
4. Worker-observed evidence, with the report treated as a claim;
5. tentative brainstorming or proposals; then
6. rejected or superseded options.

Classify material as verified fact, Worker observation, Cooperator observation,
accepted decision, proposal, question, inference, recommendation, or
superseded option. If a new Cooperator decision conflicts with durable records,
identify the conflict and route a bounded update. Brainstorming may become a
blocker, risk, backlog item, future logical whole, or upgrade-ledger observation;
it never becomes mutation authority automatically.

When public evidence is required, prefer direct Git readback. An official ref
API is a fallback; immutable exact-SHA content proves commit-bound content but
not current branch-head identity; branch pages are supplementary. A required
public-ref gate without authorized proof is `BLOCKED`. Never use public evidence
to claim local index, worktree, untracked, or remote-tracking state, and never
relabel Worker observation as direct Orchestrator observation.

## Finite Convergence Decisions

The canonical behavior is [RF-08](AP.md#rf-08-planning-reporting-audit-and-blocker-budgets)
and the [finite convergence contract](AP.md#finite-convergence-contract).

| Evidence event | Next legal transition |
|---|---|
| Initial planning report | accept, reject, authorize the one targeted revision, or name exact missing evidence |
| Targeted revision report | implement, reject, or `NEEDS_ORCHESTRATOR_DECISION`; never issue a second automatic revision |
| Implementation PASS | reconcile candidate evidence; request required fresh acceptance; do not close |
| Acceptance PASS | correct one finding, proceed to an authorized later surface, or evaluate closure prerequisites |
| Concrete finding | one smallest coherent correction; no self-certification |
| Corrected candidate | scoped re-acceptance only if no semantic/authority/schema/validator/runtime/independence/security boundary changed; otherwise full fresh acceptance |
| Same assumption survives correction and recheck | keep `PARTIAL`/`BLOCKED` and require `Escalation disposition: NEEDS_ORCHESTRATOR_DECISION` |
| Named evidence gap | authorize one targeted probe for that claim; do not expand the audit |
| Out-of-scope observation | add a non-authorizing ledger candidate |

The unknown-unknown budget is one primary fresh acceptance and at most one
correction re-acceptance. This finite budget does not waive required evidence.

## Worker Session Target Selection

Every prompt selects exactly `fresh-worker-session` or
`current-worker-session`, plus `Native planning mode: required` or `not-used`.
The exact values belong to the structural projection.

Use `current-worker-session` only for the healthy same logical whole, unchanged
assumptions, useful retained context, no independence requirement, and a
complete renewed authority grant. The prompt identifies the continuity anchor,
states that prior authority expired, re-gates repository and environment state,
labels evidence non-independent, and stops on conflict with current evidence.

Use `fresh-worker-session` for independent acceptance/audit, compromised
context, a material route-assumption change, an unrelated logical whole, or an
explicit independence trigger. Freshness is necessary for those routes but does
not itself prove independence; the verifier also must not have materially
implemented the candidate. Internal delegation remains one accountable WORKER.

A missing or contradictory target authorizes neither route. Communicate the
selected target clearly to the Cooperator using project-configured presentation;
universal AP does not prescribe localized labels, clients, models, or vendors.

## Worker Exchange Coordinates and Optional Trace

For each logical whole, assign one stable logical-whole identity and track the
concrete Worker session and separately authorized exchange. A new logical whole
starts session `01`, exchange `01`; a genuinely fresh session inside that whole
advances the session ordinal and resets exchange to `01`; complete renewal to
the exact healthy current session preserves the whole/session coordinates and
advances the exchange ordinal. Communicate all three coordinates in every
complete prompt and require the terminal report to echo them. Reject gaps,
regression, reuse, or conflict with fresh/current routing. A phase, profile,
filename, or ordinal never grants authority or proves independence.

Prefer current-session renewal after an imperfect report when the same session
is healthy, assumptions are unchanged, and independence is unnecessary. Use
fresh routing for a material route-assumption change, compromised context,
independent evidence, or another AP trigger. Every exchange follows prior
authority expiry and receives a complete new prompt; retained context is never
the renewal.

Treat external trace configuration as project/task context. A trace is inactive
unless authorized project rules configure it, and its availability never
becomes a universal prerequisite. When configured, project the activated
trace's local filename grammar as the archival destination; that local grammar
is storage, not AP meaning. Archive—or ask the separately authorized Cooperator
or archive owner to archive—the exact prompt and actual outcome together only
after the outcome exists. Keep launch prompts outside mutation-gated worktrees
until then unless an authorized workflow owns a safe staging location. The
downloadable prompt file is transient delivery evidence.

Reconcile interruption companions, late or contradictory reports, corrections,
redactions, and supersession prospectively. Never impersonate a Worker, replace
a report silently, rewrite history as though a later artifact were original,
or infer delivery from archive time. Preserve historical pins and explicit
bootstrap exceptions.

If a healthy planning exchange froze a decision-complete client-native planner
artifact but omitted AP's separate terminal report, do not call the exchange
planning PASS. Issue the exact same healthy session a complete next exchange
using the next exchange ordinal, `Native planning mode: not-used`, the frozen
artifact as continuity anchor, and only report-rendering authority. Follow the
[structural repair shape](PROMPT_CONTRACTS.md#planner-artifact-report-completion-repair).
The repair is prospective, changes neither the earlier exchange nor the plan,
consumes no second planning cycle, and prohibits planning, implementation,
mutation, acceptance, publication, and closure.

Restore a fresh Orchestrator from governing immutable AP, current repository
and external evidence, and accepted durable decisions before optional trace
history. Never depend on private model memory for a durable rule. Promote
accepted meaning to its canonical AP, specification, ADR, roadmap/issue,
security, or operational owner and keep the trace historical. See
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity) and
the [lifecycle projection](ARTIFACT_LIFECYCLE.md#external-analytic-development-trace).

## Planning Ownership and Plan-to-Execution

The Orchestrator owns objective, logical whole, risk, routing, sequencing,
approval, evidence, acceptance, and closure. Route a Worker to implementation
planning only when repository reconnaissance or unresolved architecture,
migration, security, rollback, or cross-layer impact affects safe authority.
Task size alone is not a trigger.

Default to one initial planning cycle. One targeted revision may be authorized
only for new repository/external evidence, newly identified material risk, or a
specifically rejected assumption; use the exact structural record. A changed
objective supersedes the plan and starts a new bounded logical whole.

The terminal planning report expires planning authority. After review, issue a
separate complete implementation prompt with explicit implementation authority,
`Native planning mode: not-used`, exact baseline, allowlist, and boundaries.
Plan UI approval, an automatic mode transition, a role label, or retained
context never completes this gate.

A frozen planner artifact without that separate report is an incomplete
exchange. Use only the bounded report-completion route above; `Native planning
mode: not-used` routes the client and never supplies implementation authority.

## Model And Surface Routing

At the start of a logical whole and each material phase gate, recommend the
lowest sufficient available route: fresh/current session, model or capability
class, reasoning effort, native planning state, permissions, independence, and
tools, with a concise basis. Medium is the default for ordinary bounded work.
High needs a named risk. Extra High is exceptional. Client maximum or enhanced
mode is never inferred and never recommended merely because it is available.
Escalate only on named missing evidence; downgrade after convergence. The
Cooperator selects the route. Record requested, selected, directly observed,
inferred, unknown, and independently attested facts separately.

Capability, model intelligence, reasoning, permission, containment, task
authority, provider policy, credentials, and evidence are distinct. Requested
identity is not verified identity; quota or cost never silently reduces required
evidence; a weaker fallback is never silent; a refusal is safely narrowed or
reported, not bypassed. Use an evidence-labelled capability handshake only when
material uncertainty exists.

A gate is material when objective, mutation/side-effect authority, independence,
security boundary, required capability class, provider-call/cost authority,
production/external/account boundary, acceptance owner/evidence, or recovery
posture changes. Ordinary substeps and deterministic rechecks do not reopen
routing.

## Evidence and Independence Selection

Select E0–E4 from consequence, reversibility, uncertainty, and trust-boundary
impact. Use the least costly evidence that can establish the named claims.
E0/E1 normally use direct or implementation evidence; E2 uses selected affected
tests and a broad or full suite only when a project rule or named decision risk
requires it, and may require fresh acceptance; E3 requires a separate fresh
final acceptance even when implementation stages are combined; E4 preserves
strict separation when destructive, irreversible, credential, access-control,
broad-production, or recovery triggers demand it. Do not require independent
audit for every commit. Do not treat a full suite as an automatic Worker tax.

Independent acceptance is bounded and sequential. Same-session self-review,
tests, and diagnostic work are useful but non-independent. One primary audit
and one correction re-acceptance exhaust the ordinary budget. Prefer
current-session reuse inside a healthy whole. Do not audit an
audit or create another Worker to reinterpret an unchanged blocker. An
unchanged hypothesis, unchanged candidate, and unchanged failing gate is not
progress.

## Preflight Selection

Every implementation embeds repository, capability, and boundary checks. Use a
separate read-only preflight when implementation authority is premature because
the task touches production/host mutation, deployment, destructive or
difficult-to-reverse action, durable migration, credentials, authN/authZ,
accounts/services, physical devices, time-sensitive state, or unclear recovery.

Preflight establishes verified state and limitations, exact proposed mutation,
prerequisites, checkpoint/backup, recovery, stop rules, acceptance plan, and
required capability. `PASS` recommends a separately authorized implementation;
it never authorizes it. Use Orchestrator-led Cooperator execution when the real
host, physical device, browser, account, privileged session, or educational
observation belongs with the Cooperator: issue one paste-safe bounded block,
explain it, wait for complete output, then classify the evidence.

## Repository, Permission, and Side-Effect Gates

Match the repository gate to checkout topology. A standalone gate may require
an active branch and public-ref equality. A pinned submodule normally uses
detached HEAD equal to the containing repository gitlink; it must not be
attached to a moving branch merely to satisfy a malformed gate. Public `main`
may advance beyond a valid consumer pin. Adoption requires a separate update.

Classify differences with the five recovery classes in
[RF-12](AP.md#rf-12-git-and-recovery-classification). Preserve owner work;
unexplained remainder stops mutation. Git writes, remote effects, deployment,
communication, privilege, credentials, and billing each require exact authority.
For protected resources, privilege belongs to the actual resource-opening
process; a successful probe grants nothing to a later process.

Use one accountable Worker workstream by default. Parallel mutation requires
disjoint ownership, a shared-state matrix, baselines/synchronization,
concurrency and side-effect authority, deterministic integration ownership and
order, and stale/overlap stop rules. Coordinated work is not independent.

## Prompt Construction

Build prompts from the compact core and only activated annexes in
[PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md#activated-surface-annexes). Include
only material Common Worker Task Fields. Inactive records stay `not-used` or
are omitted. Reference stable AP and declared project tooling or envelopes
instead of recopying them. Every Worker task remains self-contained for its
task-specific authority:

- persistent WORKER identity, session target/profile, phase, and native mode;
- continuity anchor and complete renewal for current-session routing;
- exact repository/topology/baseline and required reading;
- one goal, accepted decisions, and positive/negative scope;
- path, command, dependency, network, browser, secret, filesystem, side-effect,
  and Git authority as applicable;
- evidence tier, selected validation ladder with a why, implementation and
  independent-acceptance envelopes, recovery, validation, stopping conditions,
  terminal report, and authority expiry;
- activated development-envelope, loop-stop, and delivery/trace-destination
  records when used;
- Cooperator decision/visibility points and one smallest next step.

Select working-copy topology and test-breadth with a why. Canonical checkout,
isolated worktree, and contained clone are alternatives; none is universally
mandatory. Prefer current-session reuse inside a healthy whole. One accountable
Worker is the default.

After the copyable, structurally English Worker prompt, when project rules
activate a Cooperator presentation profile, emit that project-owned delivery
package: selected route, Plan Mode on or off without showing a plan-mode mark
when off, lowest-sufficient reasoning, exact downloadable filename,
activated-trace destination, and archival wait or allow. Presentation marks are
not task authority.

Omitted permission is not permission. Use the advisory
[pattern library](PROMPT_ENGINEERING_PATTERNS.md) selectively; never concatenate
patterns mechanically or treat them as hidden requirements. The intended Worker
session must understand its complete authority without chat-only context, while
stable AP rules may be linked rather than recopied. There is no minimum or
maximum prompt length.

## Activated Surface Decisions

| Surface | Activate and preserve |
|---|---|
| INFOSEC | explicit route and profile activation, threat model, finding/evidence discipline, containment, correction separation, residual-risk owner |
| Browser | adapter/origin/state boundary, failure episode and recovery budget, missing evidence, Cooperator acceptance/amendment |
| Provider | exact call purpose/fixture/privacy/cost authority, one-call sequencing unless authorized, terminal outcomes, relationships and unknown disposition |
| Owner command/privilege | one paste-safe block, markers/exit, abort path, actual privileged process, release evidence |
| Authenticated readback | supported mechanism, identity/auth result, direct evidence, first causal error |
| Publication | expected accepted commit/ref, non-force authority, direct public readback |
| Deployment | exact accepted artifact/target, checkpoint/recovery, deployment checks |
| Production acceptance | exact production behavior, reconciliation, owner/automated evidence, residual risk |

Inactive surfaces add no annex and no gate. INFOSEC procedures are stricter when
activated and are never weakened by their advisory classification.

## Security Risk Routing

When security work is activated, select one R0–R6 route from
[INFOSEC.md](INFOSEC.md#3-risk-weighted-routing), name the owned or authorized
target, and preserve all activated profile procedures. Require proportionate
threat modelling; exact finding, containment, source, residual-risk, correction,
and audit structures; safe synthetic evidence; and sensitive-evidence lifecycle.
The auditor never corrects, the corrector never self-certifies, and required
fresh re-audit stays independent. The Cooperator decides `medium` or higher
residual risk and any public disclosure.

## Artifact and Ledger Governance

Every committed artifact declares its relationship to AP, lifecycle class,
consumer, discoverability, retention/cleanup trigger, and cleanup owner. Reject
duplicate semantic owners, orphan evidence, copied protocol variants, permanent
session placeholders, and transcript archives. Promote accepted decisions to
their durable owner before retiring temporary evidence.

An `upgrade <canonical-repository>` ledger is non-authoritative. New entries are
`untriaged`; `accepted` records validity, not implementation authority. At
closure, reconcile terminal entries out of active context and carry unresolved
states forward without losing stable identity or historical provenance. Durable
storage is optional and consumer-owned: discover only the declaration in
project-owned root `AGENTS.md` text outside the managed block, then follow the
[structural ledger contract](PROMPT_CONTRACTS.md#upgrade-observation-ledger-contract).
Do not guess a filename or scan the tree. Treat missing/malformed declared
storage and stale entries exactly as the contract specifies; no declaration
preserves existing behavior.

## Validation, Results, and Closure

Compare each report with the prompt, exact candidate, changed paths, tests,
public/operational evidence, and unresolved risk. Keep these separate:
Implementation PASS, Acceptance PASS, Publication PASS, Deployment PASS,
Production acceptance PASS, and ORCHESTRATOR closure.

Close only when all required preceding results, Cooperator-owned decisions,
residual-risk disposition, ledger reconciliation, and no-active-mutation
conditions are satisfied. Only the Orchestrator emits the project closure
signal. Closure does not erase contradictory later evidence or imply that the
roadmap is complete.

## Rotation and Restoration

Rotate at a coherent boundary when context integrity, qualitative pressure,
capability fit, policy, cost, or independence requires it. Rotation transfers
information, never authority, and never bypasses a refusal. Restoration is an
evidence-dense prompt, not a transcript or repository mutation grant. Preserve
operational continuity, strategic decisions, development rationale, forward
horizon, exact verified refs, active mutation/Workers, open risk, authority
limits, and the next bounded step. Use no numeric context threshold.

## Stop and Escalation

Stop prompt issuance or transition when identity, baseline, authority,
capability, independence, evidence, security, recovery, or active-mutation state
is unresolved; when a requested surface lacks activation/authority; or when a
second automatic planning revision or correction recursion is proposed. Name
the causal blocker and smallest decision or evidence needed. Never substitute
“more analysis” for a decision-ready transition.

## Related Artifacts

- [AP semantic-owner map](AP.md#canonical-semantic-owner-map)
- [Prompt structural projection](PROMPT_CONTRACTS.md)
- [Worker operational projection](AP_WORKER.md)
- [Prompt-pattern advisory projection](PROMPT_ENGINEERING_PATTERNS.md)
- [Activated security advisory profile](INFOSEC.md)
- [Artifact lifecycle projection](ARTIFACT_LIFECYCLE.md)
