# Orchestrator Operational Projection

Artifact relationship: **operational projection** of
[AP semantic authority](AP.md#semantic-authority-and-artifact-relationships).
`AP.md` is the sole semantic owner; [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
owns exact field spellings. This handbook selects Orchestrator decisions and
does not grant Worker authority or add universal requirements. Worker exchange
identity and trace operations project
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity).

In a consuming project, read the ORCHESTRATOR row of the
[per-role minimum-reading spine](AP.md#per-role-minimum-reading-spine)
before the first exchange. Project rules supply local presentation and product
policy without overriding universal AP.

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
   or external anchors, and current durable project truth. A ChatOrchestrator
   may use authorized exact committed bundle evidence for repository and pin
   identity when independent public observation is unavailable, recording
   `public branch state not directly observed`.
3. Apply RF-19 precedence: governing AP, canonical repository/current external
   truth, accepted durable decisions, optional trace, then tentative narrative.
   Treat prior handouts, memory, planner artifacts, and old prompts as
   subordinate non-authorizing evidence.
4. Discover optional project-owned declarations — such as a Cooperator
   presentation profile, development envelope, or upgrade ledger — explicitly
   declared in project-owned root `AGENTS.md` text outside the AP-managed
   block. Never scan for guessed names.
5. Validate declared storage and revalidate each active entry against current
   repository and durable external truth. Repository truth and an explicit
   current Cooperator decision outrank every ledger entry.
6. Surface contradiction, missing evidence, malformed storage, and stale
   observations. Continue evidence gathering read-only when useful, but do not
   claim reconciliation complete while a material gap remains.

**Stage 2 — select exactly one bounded logical whole.** Present the restored
state, active observations, material uncertainty, and one evidence-backed
recommendation. Preserve an already selected/planned whole; obtain selection
for a new objective or a decision to gather more evidence under AP Continuation
Bootstrap. Then issue a complete current Worker prompt with its own exact
authority record. A seed, handout,
planner artifact, stale grant, ledger, trace, or prior prompt never supplies
current authority.

The following is a non-normative, vendor-neutral example seed. It is a pointer,
not durable authority, and its wording is not required:

```text
Resume this AP-integrated project.
Read the root AGENTS.md and the pinned AP documents it names.
Begin read-only. Restore canonical state and any declared AP upgrade ledger.
Preserve an already selected/planned whole; with the COOPERATOR select a new
objective only when needed before any
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
| Planning | apply [initial Planner and additional planning](AP.md#orchestration-planning-and-implementation-planning) and the finite budget | missing required mode or repeated planning of the same question |
| Implementation | issue one complete prompt with exact baseline, allowlist, boundaries, and `Native planning mode: not-used` | any material gate is unknown or contradictory |
| Acceptance | fix the candidate, owner map, allowlist, risk claims, and control matrix | review expands into unknown-unknown hunting |
| Correction | authorize one smallest coherent correction for a concrete finding | the same assumption survives correction and recheck |
| Publication/deployment/production | activate only the applicable surface annex and verify exact artifact continuity | authority or direct evidence is absent |
| Dispatch and direct action | apply [delivery selection](AP.md#3-instances-sessions-and-worker-session-profiles) and the RF-02 direct-action boundary | missing selected-route capability or independence evidence; invalid report identity |
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

For example, a Cooperator says that a report is committed, but the expected
`<immutable-trace-commit>:<report-path>` cannot be retrieved. Reconcile as:
"The Cooperator reports delivery; I have not read the exact report, so its
verdict and supporting observations remain unverified. The verified candidate
is still <commit>; the unresolved claim is <claim>." A narrative or memory
retrieval may locate the source but cannot replace it. Continue only useful work
supported by verified anchors and current authority; if the missing claim is
required, route its exact retrieval without bypassing a refusal. The retrieval
entrypoint is [Worker Exchange Coordinates and Optional Trace](#worker-exchange-coordinates-and-optional-trace).

An `ap doctor` PASS is integration evidence, not evidence that a task grant is
consistent or that its technical expectations are correct. Use the
[prompt readiness owner](AP.md#7-orchestrator-responsibilities) for those decisions.

## Finite Convergence Decisions

The canonical behavior is [RF-08](AP.md#rf-08-planning-reporting-audit-and-blocker-budgets)
and the [finite convergence contract](AP.md#finite-convergence-contract).

| Evidence event | Next legal transition |
|---|---|
| Initial planning report | accept, reject, authorize the one targeted revision, or name exact missing evidence ([Planning Budget and Expiry](AP.md#planning-budget-and-expiry)) |
| Targeted revision report | implement, reject, or `NEEDS_ORCHESTRATOR_DECISION` ([Planning Budget and Expiry](AP.md#planning-budget-and-expiry)) |
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

Use `fresh-worker-session` for the fresh-routing triggers owned by
[RF-05](AP.md#rf-05-freshcurrent-routing-and-independent-acceptance) and
[Implementation Authority](AP.md#implementation-authority). Freshness is
necessary for those routes but does not itself prove independence.
Internal delegation remains one accountable WORKER.

A missing or contradictory target authorizes neither route. Communicate the
selected target clearly to the Cooperator using project-configured presentation;
universal AP does not prescribe localized labels, clients, models, or vendors.

## Capability Profiles, Dispatch, and Direct Action

Semantics:
[RF-02](AP.md#rf-02-orchestrator-decision-reconciliation-and-closure-authority),
[RF-05](AP.md#rf-05-freshcurrent-routing-and-independent-acceptance),
[RF-06](AP.md#rf-06-capability-reasoning-permission-containment-and-authority),
and [AP §3](AP.md#worker-session-target).

[AP §3](AP.md#3-instances-sessions-and-worker-session-profiles) owns Orchestrator /
ChatOrchestrator access profiles, observation limits, preserved delivery choice,
complete-prompt dispatch, and the successor initialization signal.
Record access, dispatch capability, and the selected route separately; use the
[initial Planner owner](AP.md#orchestration-planning-and-implementation-planning)
for native mode versus delivery. ChatOrchestrator uses manual ferry; a full
Orchestrator with authorized dispatch delivers the complete first Planner
prompt unless opt-out or independence requires otherwise.

Apply RF-05 to actual session separation and acceptance inputs, and RF-02 to
direct action; neither a profile name nor dispatch tooling widens either boundary.

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

This is the Orchestrator entrypoint for report retrieval and delivery failure
under [RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity):

1. Project the issued coordinates through the activated trace's local grammar;
   use the [delivery record and example](PROMPT_CONTRACTS.md#cooperator-delivery-and-trace-destination-record)
   for exact destinations and separate authorship, persistence, and Git owners.
2. For a relayed report or committed-report-ready notice, retrieve the expected
   source and verify exact prompt/report identity against authorized committed
   evidence. Independently observed current public branch evidence is required
   when that public-ref claim is under decision. Authorized ChatOrchestrator
   bundle evidence may establish Git object identity otherwise; record
   `public branch state not directly observed` rather than treating bundle
   hashes as the current public head.
   Reconcile the actual companion, not the latest filename or a remembered verdict.
3. Classify source failure using [Intent and Evidence Reconciliation](#intent-and-evidence-reconciliation).
   For missing report rendering or file delivery, select the existing
   [completion case](PROMPT_CONTRACTS.md#planner-artifact-report-completion-repair).
   Use already authorized capability where sufficient; otherwise issue the
   complete bounded renewal. The [Worker finishing sequence](AP_WORKER.md#reporting)
   covers preparation before notice; receipt is separate from acceptance and Git archival.

Restore a fresh Orchestrator from governing immutable AP, current repository
and external evidence, and accepted durable decisions before optional trace
history. Classify bundle evidence separately from public branch evidence.
Never depend on private model memory for a durable rule. Promote
accepted meaning to its canonical AP, specification, ADR, roadmap/issue,
security, or operational owner and keep the trace historical. See
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity) and
the [lifecycle projection](ARTIFACT_LIFECYCLE.md#external-analytic-development-trace).

## Planning Ownership and Plan-to-Execution

The initial Planner and triggers for further technical planning are owned by
[Orchestration Planning and Implementation Planning](AP.md#orchestration-planning-and-implementation-planning).
Use the [Planning Record](PROMPT_CONTRACTS.md#planning-record) to preserve prior
accepted decisions and the budget for the actual question.

Apply [Planning Budget and Expiry](AP.md#planning-budget-and-expiry) for the
one-cycle default; the single targeted revision (new evidence, newly identified
material risk, or one specifically rejected assumption); and changed-objective
supersession; use the exact structural record.

After the terminal planning report expires planning authority
([Plan-to-Execution Gate](AP.md#plan-to-execution-gate)), issue a
separate complete implementation prompt with explicit implementation authority,
`Native planning mode: not-used`, exact baseline, allowlist, and boundaries.
Plan UI approval, an automatic mode transition, a role label, or retained
context never completes this gate.

For a frozen plan missing its report, or a complete report missing file delivery,
use the [report-delivery entrypoint](#worker-exchange-coordinates-and-optional-trace)
and its completion cases. `Native planning mode: not-used` routes the client and
never supplies implementation authority.

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

Apply the [issuance readiness owner](AP.md#7-orchestrator-responsibilities)
through this focused sequence:

1. Establish exact sources, retained Cooperator decisions, and one useful
   outcome. Select reading for those claims using the Worker spine.
2. Resolve known prerequisites and the applicable execution route under
   [RF-16](AP.md#rf-16-baseline-bound-project-execution). Bind a usable declared
   route in the grant; reading its file alone is insufficient. Use the owner's
   bounded-deviation contract when necessary, never an implicit ambient alternative.
3. Compose the [common task contract](PROMPT_CONTRACTS.md#common-worker-task-fields)
   and only activated detail. Select topology and validation breadth with a why;
   include complete renewal for a healthy current session. Stable meaning stays
   linked while task-specific authority remains self-contained.
4. Compare required actions, effects, quantities, failure paths and output
   preparation against that same grant. Place expected values with their
   object/source/readback under [Validation](AP.md#12-validation-and-public-verification),
   and use the [stop owner](AP.md#18-stopping-conditions) for residual work.
5. Deliver through the preserved route with a viable finishing path and the
   [communication capsule](AP.md#communication-routing). Use the
   [complete delivery example](PROMPT_CONTRACTS.md#source-read-only-review-example)
   where applicable; a destination or persister label is not its write grant.

This sequence produces the prompt, not another authority register or checklist
artifact. Use the advisory [pattern library](PROMPT_ENGINEERING_PATTERNS.md)
selectively. There is no fixed prompt length, context threshold, or requirement
to concatenate every catalog row.

### Outcome-Sized Routing Example

For a candidate with production changes, a recovery mechanism, installation and
physical evidence still open, select outcomes at their actual dependencies:

| Useful outcome | Dependency and boundary |
|---|---|
| Production candidate | Implement the named behavior with its tests and directly affected documentation; no installation implied |
| Device-free recovery mechanism | Produce and rehearse the bounded mechanism without claiming physical recovery |
| Independent candidate review | Freeze the candidate identity and review claims; preserve prior acceptance history and justify additional evidence without resetting budgets |
| Owner installation and identity | Resolve the known installation gap and read back the exact candidate; do not start a trial in an install-only grant |
| One controlled physical trial | Require its actual prerequisites, preserve the accepted recovery constraint and stop at its named claim |

These are outcome boundaries, not a five-Worker pipeline. Combine related code,
tests and documentation when one outcome and healthy context support it. Reported
compaction or provenance loss calls for the [rotation decision](AP.md#14-session-rotation-and-dynamic-prompts),
not invented capacity telemetry or another full-archive reading assignment.
If installation is known missing, useful source review may proceed under a grant
without that host prerequisite; do not issue a live acceptance that assumes it
complete. Reuse still-valid evidence on the unchanged candidate.

For example, an accepted recovery-cutoff demonstration may remain possible with
one input device while a separate watchdog failure-injection claim lacks its
signal/recovery path. Preserve the cutoff trial's accepted scope and leave the
watchdog claim open; neither claim supplies the other's evidence. Hardware and
recovery commands belong to the consumer's operating/test owners.

For an authorized owner operation, use the
[Owner-Executed Command Contract](PROMPT_CONTRACTS.md#owner-executed-command-contract).
If the project uses `sudo`, the owner authenticates in the same named terminal
that executes the bounded privileged commands, captures post-state evidence,
and releases the timestamp under the [privileged lifecycle](AP.md#privileged-session-lifecycle).
Deliver one paste-safe block at a time with purpose, fail-closed preconditions,
phase/completion markers, values, exit code and abort instructions; wait for its
complete output. A failed Worker-terminal timestamp check can route to this
owner path only when the grant authorizes it. Owner output remains owner evidence;
cross-check readable effects without assuming another process inherited privilege.
No password in chat, keep-alive, sudoers change or passwordless-sudo prerequisite
is part of this example.

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

## Per-Whole Orchestrator Notes (`00_notes.md`)

The semantic owner is [Artifact Lifecycle](AP.md#13-artifact-lifecycle-and-repository-hygiene);
activated Meta storage requirements belong to Meta README, including creation
of `00_notes.md` at opening even without an opening handout. Apply that local
contract and the current grant; notes remain Orchestrator-authored and a named
persister may store exact supplied entries. Reconcile report critique with the
outcome under [Compact Communication](AP.md#17-compact-communication).

## Validation, Results, and Closure

Compare each report with the prompt, exact candidate, changed paths, tests,
public/operational evidence, and unresolved risk. Keep these separate:
Implementation PASS, Acceptance PASS, Publication PASS, Deployment PASS,
Production acceptance PASS, and ORCHESTRATOR closure.

For example, a feature can be implemented in the candidate tree and reviewed
with device-free evidence while its installed identity and physical acceptance
remain unverified. Reconcile each claim with its own evidence; neither a test
suite nor a report header proves the later states. Under
[artifact promotion](AP.md#13-artifact-lifecycle-and-repository-hygiene), include
stale specification, operations or roadmap summaries in the appropriate bounded
documentation grant, or route their repair separately. A fresh reader should
recover current state from those owners, not a new session-state file or META
alone. A Worker cannot expand its allowlist to repair a summary.

Keep the accepted commit fixed through separately authorized publication and
direct public readback. A different artifact needs reconciliation; publication
does not adopt consumer pins. Required fresh independence remains governed by
[Acceptance, Correction, and Escalation](AP.md#acceptance-correction-and-escalation).

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

Use [Session Rotation](AP.md#14-session-rotation-and-dynamic-prompts) for truthful
handout authorship, predecessors, preserved decisions/delivery, explicit
supersession, evidence limits, and readiness review. Use the successor access
profile from [AP §3](AP.md#3-instances-sessions-and-worker-session-profiles),
the visible capsule, and activated local filenames; no filename grants authority.
Restore an ongoing planned whole through [Continuation Bootstrap](AP.md#continuation-bootstrap)
without resetting its identity or planning.

## Stop and Escalation

Stop prompt issuance or transition when identity, baseline, authority,
capability, independence, evidence, security, recovery, or active-mutation state
is unresolved; when a requested surface lacks activation/authority; when an
applicable consumer-declared execution route cannot be resolved or contradicts
the route about to be issued; or when a second automatic planning revision
([Planning Budget and Expiry](AP.md#planning-budget-and-expiry)) or
correction recursion is proposed. Name
the causal blocker and smallest decision or evidence needed. Never substitute
“more analysis” for a decision-ready transition.

## Related Artifacts

- [AP semantic-owner map](AP.md#canonical-semantic-owner-map)
- [Prompt structural projection](PROMPT_CONTRACTS.md)
- [Worker operational projection](AP_WORKER.md)
- [Prompt-pattern advisory projection](PROMPT_ENGINEERING_PATTERNS.md)
- [Activated security advisory profile](INFOSEC.md)
- [Artifact lifecycle projection](ARTIFACT_LIFECYCLE.md)
