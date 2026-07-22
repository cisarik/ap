# Analytic Programming

Analytic Programming (AP) is a vendor-neutral coordination protocol for
software work. It defines how a human owner, an Orchestrator, and a Worker use
repository evidence, bounded task authority, validation, and public verification
to make progress without relying on fragile chat memory.

AP is human-governed collaboration: the Cooperator remains informed and owns
material product, value, cost, privacy, risk, irreversible-operation,
acceptance, and closure decisions, while deterministic implementation steps can
run inside bounded authority without microapproval.

The canonical public repository is:

```text
https://github.com/cisarik/ap
```

## Start Here

- [FAQ.md](FAQ.md) gives the short human-oriented explanation.
- [AP.md](AP.md) is the single live normative protocol.
- [PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md) is the
  source-grounded advisory pattern library.
- [INTEGRATION.md](INTEGRATION.md) explains how to add AP to a Git project.
- [UPDATING.md](UPDATING.md) explains explicit pinned updates and rollback.

## What AP Provides

AP provides:

- one canonical protocol file;
- universal Orchestrator and Worker handbooks;
- prompt contracts for professional task generation and session restoration;
- artifact lifecycle and repository hygiene rules;
- a dependency-free `ap` integration tool;
- ADRs that record durable protocol architecture decisions.

The protocol is adaptive: the Orchestrator selects only the discovery,
preflight, implementation, acceptance, diagnostic, audit, or restoration phases
needed for the current risk and evidence.

AP is not a package manager, hosted service, model, framework, project
generator, or replacement for human judgment.

Every newly issued or renewed Worker prompt explicitly combines a fresh/current
session target with native planning mode `required`/`not-used`. Native planning,
UI approval, Full Access, reasoning, and technical capability do not grant
execution authority. AP defaults to one active Worker workstream, permits only
fully bounded disjoint parallel exceptions, and keeps fresh independent audit
sequential. Detailed normative rules are in [AP.md](AP.md); exact prompt fields
and execution transition are in [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md).

Plan mode is routed by unresolved implementation uncertainty rather than task
size. Healthy current Workers normally continue approved repository-grounded
plans under renewed authority; fresh sessions remain required for independence
or degraded context. Evidence tiers E0–E4, bounded report/audit/handoff budgets,
safe combined implementation envelopes, and separate fresh independent
acceptance favor direct closure without weakening high-impact independence.

## Canonical Distribution

The default integration model is a pinned Git submodule at `.ap/`.

New project:

```sh
git submodule add https://github.com/cisarik/ap.git .ap
./.ap/ap init
git add .gitmodules .ap AGENTS.md
git commit -m "docs: adopt analytic programming"
```

After an ordinary clone of a project that already uses AP:

```sh
git submodule update --init --recursive
./.ap/ap doctor
```

To inspect updates:

```sh
./.ap/ap update --check
```

To apply a reviewed AP update to the submodule checkout:

```sh
./.ap/ap update --apply
./.ap/ap doctor --candidate
git diff --submodule
git add .ap
./.ap/ap doctor
git commit -m "docs: update analytic programming"
```

The tool never commits or pushes a consuming project. The changed gitlink is
reviewed and committed by an explicit project task.

## Repository Layout

| Path | Purpose |
|---|---|
| [AP.md](AP.md) | Single normative AP protocol |
| [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md) | Universal Orchestrator handbook |
| [AP_WORKER.md](AP_WORKER.md) | Universal Worker handbook |
| [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md) | Structural contracts for prompts, reports, restoration, audits, and exceptional handoffs |
| [PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md) | Advisory reusable prompt patterns, selection matrix, evidence, and maintenance rules |
| [INFOSEC.md](INFOSEC.md) | Advisory Community-Profile-style defensive-security specialization, activated only by routing or an authoritative prompt |
| [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md) | Artifact classification, retention, and cleanup rules |
| [FAQ.md](FAQ.md) | Plain-language guide for Cooperators and new users |
| [GLOSSARY.md](GLOSSARY.md) | Shared terminology |
| [INTEGRATION.md](INTEGRATION.md) | Initial integration, clone recovery, health checks, migration from copied files, and removal guidance |
| [UPDATING.md](UPDATING.md) | Explicit update, compatibility review, and rollback workflow |
| [CHANGELOG.md](CHANGELOG.md) | Human-readable protocol distribution changes |
| [ap](ap) | Dependency-free integration tool |
| [tests/](tests/) | Dependency-free tests for the integration tool and repository structure |
| [docs/adr/](docs/adr/) | Accepted architecture decisions |

## Project-Specific Rules

Consuming projects keep their own engineering rules in their root `AGENTS.md`.
The AP-managed block in that file points participants to `.ap/AP.md` and the
universal handbooks. Project-specific rules outside the managed block remain
authoritative within their scope.

Do not edit `.ap/` during ordinary project work. Treat it as the pinned AP
protocol dependency. Updating it requires a separate explicit AP update task.

## Previous Generations

Earlier protocol generations are available through Git history. They are not
kept as parallel live files because the current source tree must expose one
unambiguous canonical protocol.

See [CHANGELOG.md](CHANGELOG.md) and
[ADR-0005](docs/adr/0005-single-live-protocol-and-pinned-submodule-distribution.md)
for the migration record and rationale.
