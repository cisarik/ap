# Analytic Programming

Artifact relationship: **explanatory projection** of
[AP semantic authority](AP.md#semantic-authority-and-artifact-relationships).

Analytic Programming (AP) is a vendor-neutral, human-governed coordination
protocol for evidence-based software work. The Cooperator owns material human
decisions, the Orchestrator reconciles and routes work, and a Worker executes
one bounded task. [AP.md](AP.md) alone owns protocol meaning.

Canonical repository: `https://github.com/cisarik/ap`

## Reading Order and Artifact Authority

| Need | Read | Relationship |
|---|---|---|
| protocol meaning and convergence | [AP.md](AP.md) | sole live normative protocol and semantic owner |
| exact prompt/report fields, exchange coordinates, and standard trace grammar | [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md) | structural projection |
| role decisions | [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md), [AP_WORKER.md](AP_WORKER.md) | operational projections |
| continuation after a pause | [Continuation Bootstrap](AP_ORCHESTRATOR.md#continuation-bootstrap) | operational entry point to the two-stage AP rule |
| optional durable upgrade observations | [Upgrade Observation Ledger Contract](PROMPT_CONTRACTS.md#upgrade-observation-ledger-contract) | structural declaration and Markdown storage projection |
| optional prompt craft | [PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md) | first-class universal advisory projection |
| activated defensive security | [INFOSEC.md](INFOSEC.md) | advisory profile; all procedures apply when activated |
| artifact and activated external-trace handling | [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md) | operational lifecycle projection |
| newcomer concepts | [FAQ.md](FAQ.md), [GLOSSARY.md](GLOSSARY.md) | explanatory projections |
| adoption and updates | [INTEGRATION.md](INTEGRATION.md), [UPDATING.md](UPDATING.md) | operational guides |
| rationale and delivery | [ADRs](docs/adr/), [CHANGELOG.md](CHANGELOG.md) | historical records |
| enforcement | [ap](ap) | executable projection |
| project overlay | managed root `AGENTS.md` block plus project rules | consumer projection |

No subordinate artifact independently defines AP meaning. A task prompt remains
self-contained for its repository, baseline, authority, boundaries, validation,
and activated surfaces.

[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity)
owns universal logical-whole, Worker-session, exchange, and external-trace
meaning. An external analytic-development trace is subordinate historical
evidence and remains optional unless authorized project rules activate it.
Continuation begins read-only and requires Cooperator selection of one bounded
next logical whole before a current mutation grant. Optional declared upgrade
ledger storage remains non-authorizing RF-09 evidence.

## Stable Pinned Distribution

AP is normally pinned as `.ap/`:

```sh
git submodule add https://github.com/cisarik/ap.git .ap
./.ap/ap init
git add .gitmodules .ap AGENTS.md
git commit -m "docs: adopt analytic programming"
```

After cloning an existing consumer:

```sh
git submodule update --init --recursive
./.ap/ap doctor
```

Strict doctor validates the canonical repository, `.ap` path, immutable
containing-project gitlink, matching checkout, and exact managed block. This
unchanged compatibility tuple resolves `OK resolved governing variant: stable`.
Detached HEAD is normal when `.ap` equals the recorded gitlink; public `main`
may be newer than the consumer pin.

## Explicit Update

```sh
./.ap/ap update --check
./.ap/ap update --apply
./.ap/ap doctor --candidate
git diff --submodule
git add .ap
./.ap/ap doctor
git commit -m "docs: update analytic programming"
```

The tool never commits or pushes a consumer. See [UPDATING.md](UPDATING.md) for
review and rollback and [INTEGRATION.md](INTEGRATION.md) for adoption,
migration, and removal.

## Runtime and Project Rules

`ap` is a dependency-free integration and baseline-bound execution tool. Its
CLI, schema-v1 project contract, stable variant resolution, managed block, and
consumer behavior are unchanged by documentation projection compression. See
[ADR-0012](docs/adr/0012-baseline-bound-project-execution.md) and
[ap.project.conf](ap.project.conf).

Project-specific rules belong outside the managed block in the consuming
project's root `AGENTS.md`. Do not edit `.ap/` during ordinary work; update the
pin through a separate authorized task.

Earlier protocol generations remain in Git history, not as competing live
files. [ADR-0005](docs/adr/0005-single-live-protocol-and-pinned-submodule-distribution.md)
records that choice; [ADR-0013](docs/adr/0013-semantic-ownership-and-convergence.md)
records semantic consolidation.
