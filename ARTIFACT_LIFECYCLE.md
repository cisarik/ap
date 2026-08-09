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
