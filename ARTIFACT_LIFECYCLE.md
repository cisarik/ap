# Artifact Lifecycle Operational Projection

Artifact relationship: **operational lifecycle projection** of
[RF-14](AP.md#rf-14-artifact-ownership-and-lifecycle). `AP.md` owns lifecycle
meaning; this document supplies compact classification and handling steps. It
does not grant creation, mutation, retention, or deletion authority.

## Two Classification Axes

Every committed documentation or evidence artifact declares both axes:

1. its AP relationship: structural, operational, advisory, explanatory,
   historical, executable, or consumer; and
2. its retention lifecycle:

| Lifecycle class | Use |
|---|---|
| transient evidence | one-use, normally uncommitted output |
| temporary committed evidence | multi-session decision support with a removal trigger |
| retained evidence | continuing compatibility, incident, benchmark, or rationale value |
| canonical semantic artifact | `AP.md`, the sole live normative protocol |
| durable structural/operational/advisory/explanatory/historical artifact | a declared subordinate projection with current use |
| operational lifecycle artifact | exceptional working state with replacement or retirement rules |

“Durable” describes retention, not independent semantic authority.

## Required Metadata

| Attribute | Required question |
|---|---|
| relationship and lifecycle class | what is the artifact and how does it project AP? |
| canonical owner | which AP rule family owns its meaning? |
| intended consumer and discovery | who needs it and how do they find it? |
| retention/cleanup trigger | what event changes its usefulness? |
| cleanup owner | who may authorize retirement? |

Use the lightest sufficient artifact and a report when a committed file adds no
continuing value. Do not create orphan evidence, duplicate semantic owners,
copied protocols, transcript archives, or permanent session placeholders. Git
history is historical recovery, while the live tree contains current usable
knowledge. A trigger never authorizes deletion; a task grant must name it.
Before retirement, promote material conclusions to their owner and update
inbound links in the same bounded change.

## External Analytic Development Trace

Artifact relationship: **operational lifecycle projection** of
[RF-19](AP.md#rf-19-external-analytic-trace-and-worker-exchange-identity).
An activated external analytic-development trace is retained historical
evidence, not a semantic owner or task, Git, acceptance, publication,
deployment, production, or closure authority. A project may activate one
conforming trace through authorized project/task rules; an inactive or
unavailable trace does not weaken current AP authority or required evidence.

The activation record names its historical relationship, project-local
consumer and discovery declaration, public/private visibility, retention or
cleanup trigger, promotion targets, and a separately authorized archival and
cleanup owner. Public traces are public-safe by default. Private traces remain
bounded to their declared consumer and do not gain authority from privacy.

Selective causal content may include Cooperator intent or correction,
Orchestrator decisions, exact issued Worker prompts, terminal reports or
truthful interruption companions, reconciliation, and applicable acceptance,
publication, or closure evidence. Exclude raw transcripts, hidden reasoning,
tool logs, credentials, private URLs or environment values, private media,
sensitive payloads, unnecessary production detail, and unbounded chronological
history. The trace is not a live specification, roadmap, issue tracker,
restoration prompt, repository handoff, or current authority source.

First archive an exact prompt and its actual terminal report together only
after the report exists. For Git, both files have the same unique first-add
commit. Keep the externally delivered prompt outside mutation-gated worktrees
until then unless a separately authorized workflow owns a safe staging
location. The implementation Worker does not archive its current exchange
without a later exact archival grant.

Only when no terminal Worker report exists may an authorized non-Worker owner
write a mutually exclusive interruption companion from safely known
cancellation, interruption, or supersession facts. It never impersonates the
Worker. A late or contradictory report requires explicit Orchestrator
reconciliation and a prospective correction. Correction, redaction, and
supersession preserve provenance; no report or interruption is silently
replaced or rewritten. Bootstrap exceptions are explicit before prospective
use rather than invented retroactively, and historical artifacts retain their
governing AP pin.

Promote accepted universal meaning to AP, project behavior to specifications,
architecture to ADRs, deferred work to roadmaps or issues, and security or
operational rules to their owners. Promotion, not trace retention, makes those
decisions durable. Git history does not justify stale live handoffs or duplicate
normative documents. A trace remains distinct from Discovery Records,
restoration prompts, repository handoffs, upgrade ledgers, raw transcripts,
ADRs, specifications, and issues, each of which keeps its own consumer and
lifecycle.

## Discovery Records

A Discovery Record is optional project-owned decision-support evidence for
material exploration that spans sessions, is costly to reconstruct, has a known
consumer, influences a major decision, or preserves alternatives. It is not
task authority and must never be the sole live source of an accepted product,
architecture, security, or operating decision.

Record topic/status/date, intent, verified context, options, benefits/risks,
rejected alternatives, questions, promotion targets, consumer, and lifecycle.
Keep decisions labelled proposed, candidate, recommended, or open unless the
same bounded change promotes that decision to its durable owner or links to an
existing owner. Promote accepted architecture to ADRs, product behavior to
specifications, operating rules to project rules, deferred work to roadmaps,
and security rules to security artifacts. Never create hidden chronological
brainstorming archives or transcript logs.

Discovery Records, restoration prompts, and repository handoffs are distinct.
A restoration prompt normally stays in chat. A handoff is exceptional and only
for material state that cannot be reconstructed from durable evidence and the
next prompt.

## Upgrade Observation Ledgers

An `upgrade <canonical-repository>` ledger is retained, non-authoritative
discovery input. [RF-09](AP.md#rf-09-upgrade-ledger-lifecycle) owns its states
and transitions. Closure reconciliation removes terminal states from active
context, carries active unresolved states, and preserves stable identity and
historical provenance. The Orchestrator owns reconciliation; no ledger state
authorizes implementation or cleanup.

The optional committed storage projection is a consumer-owned retained-evidence
artifact, one explicitly declared Markdown file per canonical target. Its
consumer is the Orchestrator restoring or reconciling that target. Discovery is
only through project-owned root `AGENTS.md` text outside the AP-managed block;
an undeclared lookalike has no AP ledger lifecycle. The declaration and
[structural contract](PROMPT_CONTRACTS.md#upgrade-observation-ledger-contract)
define the target, version, path, header, entry shape, and malformed behavior.
No fixed filename, scan fallback, schema, or executable validator is implied.

The live file retains only active `untriaged`, `accepted`, and `parked`
observations. Terminal `implemented`, `rejected`, `duplicate`, and `invalidated`
entries are removed only in an authorized reconciliation commit after immutable
historical evidence is named. The consuming project and Orchestrator own that
reconciliation decision; a lifecycle trigger never grants deletion authority.
Git history and the promoted ADR, specification, project rule, roadmap, issue,
logical whole, security document, changelog, decision, or closure report retain
provenance. Do not create a second ledger archive.

Public-safe content is the retention default. Stale active entries are
revalidated rather than silently removed. Malformed declared storage remains
non-authorizing evidence and blocks a completed ledger reconciliation, while no
declaration preserves ordinary AP compatibility and claims nothing about
observations outside durable storage.

## AP Distribution Relationships

| Artifact | Declared relationship and lifecycle |
|---|---|
| `AP.md` | canonical semantic artifact; sole live normative protocol |
| `PROMPT_CONTRACTS.md` | durable structural projection |
| `AP_ORCHESTRATOR.md`, `AP_WORKER.md`, this file, `INTEGRATION.md`, `UPDATING.md` | durable operational projections |
| `PROMPT_ENGINEERING_PATTERNS.md` | durable first-class universal advisory projection |
| `INFOSEC.md` | durable activated advisory security profile |
| `README.md`, `FAQ.md`, `GLOSSARY.md` | durable explanatory projections |
| ADR bodies and `CHANGELOG.md` | historical rationale and delivery record |
| `ap` and tests | executable enforcement |
| managed `AGENTS.md` block and project rules | consumer projection |
| optional declared consumer upgrade-ledger file | consumer-owned retained evidence; non-authorizing RF-09 storage projection |

Earlier protocol generations remain in Git history. Static BOOT, NEXT,
WORKERS, prompt archive, generated protocol variant, or restoration archive is
not a live AP distribution artifact.

### Prompt-Engineering Pattern Library

The pattern library remains first-class universal advisory guidance for
Orchestrators and maintainers. Evolve it from observable failures,
positive/negative/boundary/adversarial fixtures, sources, compatibility, and
regression evidence. It must not become a hidden requirement or semantic owner.
Git history preserves replaced guidance; consuming projects remain pinned until
a separate update adopts a later commit.

### Defensive-Security Profile

`INFOSEC.md` is the activated advisory security profile. Activation occurs only
through an authoritative prompt, project rule, or AP risk route. Once activated,
all applicable procedures remain effective and stricter than general combination
permission; advisory classification never weakens them. Refresh dated sources
before time-sensitive use.

## Sensitive Security Evidence

The `sensitive-security-evidence` class covers security reports, containment
ledgers, and proof artifacts. These artifacts are
evidence only. Name the Orchestrator/corrector/re-auditor/Cooperator consumer,
keep them until finding closure or residual-risk disposition, then clean only
under exact lifecycle authority. Redact secrets, credentials, personal data,
and raw payloads from prompts, reports, tests, logs, public documents, external
tools, and web search. Prefer synthetic fixtures; keep necessary raw evidence
inside its declared containment boundary and remove only exact owned paths.

## Worker and Orchestrator Checks

The Worker verifies lifecycle authority, metadata, promotion, inbound links,
changed paths, and final retained/consolidated/replaced/deleted status. The
Orchestrator decides whether a report suffices, rejects duplicate owners,
defines lifecycle in the prompt, verifies cleanup authority, and checks public
state when publication applies.

## Related Artifacts

- [AP semantic-owner map](AP.md#canonical-semantic-owner-map)
- [Orchestrator operational projection](AP_ORCHESTRATOR.md)
- [Worker operational projection](AP_WORKER.md)
- [Prompt structural projection](PROMPT_CONTRACTS.md)
- [Prompt-pattern advisory projection](PROMPT_ENGINEERING_PATTERNS.md)
- [Activated security advisory profile](INFOSEC.md)
