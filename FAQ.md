# Analytic Programming FAQ

Artifact relationship: **explanatory projection** of
[AP semantic authority](AP.md#semantic-authority-and-artifact-relationships).
Answers introduce no independent requirements; follow the linked semantic or
structural owner when precision matters.

## What is AP and which file governs?

AP is a vendor-neutral, human-governed coordination protocol. [AP.md](AP.md) is
the sole live normative protocol and semantic owner. Exact prompt/report field
spellings live in the structural [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md).
Role handbooks are operational; this FAQ and the glossary are explanatory;
ADRs and the changelog are historical. Git history holds earlier generations.

## How do I adopt or restore a project checkout?

For a clean project:

```sh
git submodule add https://github.com/cisarik/ap.git .ap
./.ap/ap init
./.ap/ap doctor
```

After cloning an existing consumer:

```sh
git submodule update --init --recursive
./.ap/ap doctor
```

Review and commit `.gitmodules`, the `.ap` gitlink, and `AGENTS.md` only under a
project task. [INTEGRATION.md](INTEGRATION.md) owns the operational workflow.

## How do I continue after a pause or session rotation?

Use the named
[Continuation Bootstrap](AP_ORCHESTRATOR.md#continuation-bootstrap). First
restore and reconcile read-only from root `AGENTS.md`, the pinned AP documents,
current repository/external truth, durable decisions, and any explicitly
declared upgrade ledger. Then present current state and one evidence-backed
recommendation so the Cooperator can select exactly one bounded next logical
whole or request more evidence. No resume seed, memory, handout, old prompt,
planner artifact, or ledger grants mutation authority.

## Why may `.ap` use detached HEAD?

The containing repository pins one AP commit through its `.ap` gitlink.
Detached HEAD is normal when the submodule `HEAD` equals that gitlink and
identity/cleanliness pass. Do not attach it to `main` merely to satisfy a
standalone gate. Public AP `main` may advance; a standalone checkout still uses
applicable public-ref commit and push protections. See
[RF-15](AP.md#rf-15-protocol-variants-and-stable-integration).

## Where do project-specific rules live?

Outside the AP-managed block in the consuming project's root `AGENTS.md`. The
block points to pinned AP; it does not copy the protocol. Do not edit `.ap/`
during ordinary project work. Optional Cooperator presentation profile,
development envelope, and local-trace grammar pointer are also declared there;
absence preserves current behavior.

## Is a full test suite an automatic Worker tax?

No. The prompt selects a validation ladder. A broad or full suite runs only
when a project rule or named decision risk requires it.

## How do updates and rollback work?

Check and apply only through an explicit task:

```sh
./.ap/ap update --check
./.ap/ap update --apply
./.ap/ap doctor --candidate
git diff --submodule
git add .ap
./.ap/ap doctor
```

The tool never commits or pushes. Rollback similarly checks out a known prior
AP SHA in `.ap`, runs candidate/strict doctor, and commits the changed gitlink.
See [UPDATING.md](UPDATING.md).

## Who decides, implements, accepts, and closes?

The Cooperator owns the objective, material route, subjective acceptance,
changed objectives, cost/privacy/irreversibility, product trade-offs, and
material residual risk. The Orchestrator recommends routes, reconciles evidence,
and performs deterministic closure after every required gate and Cooperator
decision. A Worker implements and reports one bounded task and never closes the
logical whole. See [RF-01](AP.md#rf-01-cooperator-sovereignty-and-material-decisions)
and [RF-02](AP.md#rf-02-orchestrator-decision-reconciliation-and-closure-authority).

## When is planning used, and how does execution start?

Use implementation planning for unresolved repository-grounded architecture,
migration, security, rollback, or cross-layer choices—not merely task size.
There is one initial planning cycle and at most one explicitly authorized
targeted revision for new evidence, a new material risk, or one rejected
assumption. A changed objective starts a new logical whole.

The terminal planning report expires planning authority. Plan UI approval or an
automatic mode transition grants nothing. Implementation requires a separate
complete Orchestrator prompt with explicit authority, `Native planning mode:
not-used`, exact baseline, allowlist, and boundaries.

## When may a current Worker continue, and when must work be fresh?

A healthy current Worker may continue the same logical whole only under a
complete renewed prompt, unchanged assumptions, useful retained context, and no
independence requirement. A fresh session is required for independent
acceptance/audit, compromised context, material route-assumption change, or an
unrelated whole. Freshness alone is not independence: the verifier must not
have materially implemented the candidate.

After any terminal `PASS`, `PARTIAL`, or `BLOCKED` report, cancellation, or
supersession, authority expires. An open chat and retained context grant no
continuing authority.

## Why not open a fresh Worker after every imperfect report?

A healthy current Worker can retain useful repository understanding when the
logical whole and assumptions are unchanged and independence is unnecessary.
The Orchestrator issues a complete renewed prompt with the next exchange
ordinal; an imperfect report alone is not a freshness trigger. Material route
change, compromised context, and independent acceptance still use a fresh
session. See
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity).

## How are multiple prompts to the same Worker session identified?

They preserve the logical-whole identity and Worker-session ordinal while each
complete authority renewal increments the two-digit Worker-exchange ordinal.
The report echoes the prompt coordinates. Coordinates record routing and do not
grant authority. See
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity).

## Is an external trace required, and can it grant authority?

No. Universal AP works without one; authorized project rules may activate a
conforming trace as selective historical evidence. A trace, archive record, or
filename cannot grant task, Git, acceptance, publication, deployment,
production, or closure authority. See
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity).

## Can a fresh Orchestrator rely on the previous model's memory?

No. Restoration begins with governing immutable AP, current project and
external evidence, and durable accepted decisions. Optional trace history and
tentative narrative come later; private memory is never a durable rule or
current evidence. See
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity).

## Why archive a prompt and outcome only after the outcome exists?

Adding the exact pair together avoids prompt-first dirty-worktree and
self-reference loops and prevents an archive from implying an outcome that did
not occur. Archive time proves archival, not delivery. A truthful interruption
companion is used only when no terminal report exists. See
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity).

## What are the four routing states?

Every prompt selects `fresh-worker-session` or `current-worker-session` and
`Native planning mode: required` or `not-used`. Those two axes produce four
states. The project may localize presentation, but the structural fields and
meaning remain universal.

## What is the difference between capability and authority?

Capability is what may be technically possible; permission is a client control;
containment is technical enforcement; task authority is the current Orchestrator
grant. Role, reasoning, provider policy, credentials, gates, and evidence are
also separate. Full access, UI approval, or tools never authorize an action.
Reasoning effort is execution guidance only.

## How does AP prevent planning, audit, and correction loops?

Acceptance is fixed to a candidate, owner map, allowlist, risk claims, and
positive/negative matrix. One primary fresh acceptance and at most one
correction re-acceptance form the unknown-unknown budget. Missing evidence
permits one named targeted probe, not an open audit. If the same assumption
survives one correction and recheck, report
`Escalation disposition: NEEDS_ORCHESTRATOR_DECISION`; do not start a second
automatic correction.

## Are implementation, acceptance, and closure the same?

No. Implementation PASS, Acceptance PASS, Publication PASS, Deployment PASS,
Production acceptance PASS, and ORCHESTRATOR closure are separate. None of the
five phase PASS results alone closes a logical whole. Gates for publication,
deployment, production, browser, provider, privilege, or INFOSEC apply only
when that surface is activated.

## Why does not every commit need an independent or full security audit?

Evidence is risk-driven. E0–E4 scale with consequence, reversibility,
uncertainty, and trust boundaries. Independent acceptance is required where the
selected route demands it, including changes to the sole protocol, structural
schemas, or semantic validators—not as ceremony for every commit.

## Why is INFOSEC.md advisory?

[INFOSEC.md](INFOSEC.md) is an activated advisory security profile so AP keeps
one semantic owner and ordinary work gains no irrelevant ceremony. When a
prompt, project rule, or AP risk route activates it, every applicable protection
remains effective; advisory classification never weakens it. Security findings,
containment, correction separation, and residual-risk ownership remain intact.

## Is a requested model the same as a verified model?

No. Requested, selected, observed, inferred, unknown, and independently
attested facts stay separate. Universal AP names no required model, client, or
provider, and a route never expands authority.

## Can quota or cost justify skipping required evidence?

No. They can influence the route, but never silently weaken evidence or
required independence. Escalate the route or report the limitation.

## How are browser, provider, privilege, and sensitive-data work bounded?

Only an activated, authorized surface annex applies. Browser evidence proves
the tested product/engine/state only; provider calls need exact purpose and
reconciliation; privilege belongs to the actual resource-opening process;
authenticated reachability is not identity; secrets and private payloads use
minimum-necessary handling. [AP.md](AP.md) owns the rules and the role
handbooks project the steps.

## What artifacts should a project retain?

Use the lightest artifact with a known consumer and lifecycle. Discovery
Records and upgrade ledgers are non-authoritative; promote accepted decisions
to their durable owner. Restoration prompts grant no mutation authority, and
repository handoffs are exceptional. See
[ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md).

## Must a project keep a durable upgrade observation ledger?

No. Durable storage is optional, consumer-owned, and non-authorizing. If a
project activates it, root `AGENTS.md` declares one Markdown file per canonical
target outside the unchanged managed block; the exact declaration, header,
entry fields, and malformed/stale behavior are in the
[Upgrade Observation Ledger Contract](PROMPT_CONTRACTS.md#upgrade-observation-ledger-contract).
No declaration preserves current behavior and does not assert that all
observations everywhere are resolved. Never discover a ledger by guessing or
scanning for a filename.

## Related Reading

- [AP semantic-owner map](AP.md#canonical-semantic-owner-map)
- [Prompt structural projection](PROMPT_CONTRACTS.md)
- [Integration guide](INTEGRATION.md)
- [Update guide](UPDATING.md)
- [Prompt-pattern advisory projection](PROMPT_ENGINEERING_PATTERNS.md)
