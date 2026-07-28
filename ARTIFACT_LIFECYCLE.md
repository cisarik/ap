# Artifact Lifecycle

Artifact lifecycle rules keep AP projects from accumulating stale evidence,
duplicate sources of truth, and session-state leftovers.

## Required Metadata

Every committed documentation or evidence artifact should have:

| Attribute | Question |
|---|---|
| Classification | What kind of artifact is this? |
| Authority | Is it normative, handbook, evidence, context, or non-authoritative? |
| Intended consumer | Who reads or uses it next? |
| Discoverability | How does that consumer find it? |
| Retention trigger | When does it remain useful? |
| Cleanup trigger | When can removal be considered? |
| Cleanup owner | Who may authorize removal? |

## Classification Model

| Class | Meaning | Examples |
|---|---|---|
| Transient evidence | One-use evidence that normally remains uncommitted | Command output, local logs, report excerpts |
| Temporary committed evidence | Decision-support material committed only when multi-session review needs it | Investigation notes, comparison tables, unresolved Discovery Record |
| Retained evidence | Durable evidence with continuing independent value | Compatibility record, incident record, benchmark, resolved Discovery Record retained as rationale |
| Normative durable artifact | Authoritative project record | Protocol, ADR, specification, policy |
| Operational lifecycle artifact | Working-state document with replacement or retirement rules | Exceptional handoff, checkpoint |

## Principles

- Use the lightest sufficient artifact.
- Prefer an evidence-dense report over a committed research file when the report
  is enough.
- Do not create an artifact without a concrete consumer.
- Do not leave committed artifacts orphaned.
- Git history is the archive for superseded protocol text and deleted session
  artifacts.
- The live tree should contain current usable project knowledge.
- Transfer material conclusions into the durable consumer before deleting
  temporary evidence.
- Remove or replace inbound links in the same bounded change that retires an
  artifact.
- A retention trigger does not authorize deletion by itself; deletion still
  requires task-specific authority.
- Do not create a mandatory global artifact registry when an existing README,
  ADR index, or specification is sufficient.

## Discovery Records

A Discovery Record is an optional project-owned artifact for material
brainstorming or decision exploration that spans sessions, would be costly to
reconstruct, has a known future consumer, influences a major decision, or
preserves alternatives needed for later review.

It is decision-support evidence, not task authority and not durable truth by
itself. Prefer a visible project-owned location such as `docs/discovery/`
unless the consuming project has a specific reason for another path. Do not
create hidden chronological brainstorming archives or transcript logs.

A Discovery Record should name its topic, status, source and observation date,
intent summary, verified context, options considered, benefits, risks, rejected
alternatives, open questions, promotion targets, intended consumer, retention
trigger, cleanup trigger, cleanup owner, and the statement that it is not task
authority.

A Discovery Record must never be the sole live source of an accepted product,
architecture, security, or operating decision. It may describe an accepted
decision only when the same bounded change promotes that decision to its
authoritative durable destination or the record links to the authoritative
artifact that already contains it. Otherwise label decision-like material as
proposed, candidate, recommended, or open.

When exploration resolves, promote accepted architecture to ADRs, product
behavior to specifications, operating rules to project rules, deferred work to
roadmaps, and security rules to security artifacts. The Discovery Record may
then be retained as rationale, marked resolved, or removed under explicit
lifecycle authority.

Discovery Records are distinct from restoration prompts and repository
handoffs. A restoration prompt is normally delivered in chat for a fresh
Orchestrator. A repository handoff is an exceptional operational lifecycle
artifact for unreconstructable state.

## Upgrade Observation Ledgers

An `upgrade <canonical-repository>` ledger is a retained-evidence artifact for
improvement work on one repository. Its normative lifecycle, entry states, and
closure reconciliation are owned by
[AP.md](AP.md#upgrade-observation-ledger); this document adds only the
retention rule.

Active-context reconciliation at closure removes `implemented`, `rejected`,
`duplicate`, and `invalidated` entries from the active ledger and carries
`untriaged`, `accepted`, and `parked` entries forward while they remain active.
The cleanup trigger is logical-whole closure and the cleanup owner is the
Orchestrator. Historical provenance and stable entry identity stay in commits,
accepted decisions, changelog and history, and closure reports, so shrinking
the active ledger never deletes evidence.

## Protocol Distribution Artifacts

In the AP source repository:

- `AP.md`, universal handbooks, prompt contracts, artifact lifecycle rules, ADRs,
  and integration documentation are normative durable artifacts.
- Earlier protocol generations are historical information recoverable from Git
  history, not retained live documents.
- Static project BOOT, NEXT, and WORKERS templates are obsolete distribution
  artifacts because integration is managed through `.ap/` and `AGENTS.md`.
- A repository handoff is exceptional and belongs only in a consuming project
  when unreconstructable state exists and an Orchestrator authorizes exact
  lifecycle handling.

### Prompt-Engineering Pattern Library

`PROMPT_ENGINEERING_PATTERNS.md` is a durable advisory protocol companion. It is
not normative AP, generated output, transient evidence, a restoration handoff,
a prompt scrapbook, or permanent provider telemetry. Its intended consumers are
Orchestrators and maintainers; README and both handbooks provide discovery, and
the library links back to normative owners.

The AP source repository owns the library. Evolve it through observable failure
classes, representative positive/negative/boundary/adversarial fixtures, source
and link review, compatibility analysis, and regression validation. Advisory
guidance must not become normative silently; promotion changes the exact
normative owner and receives ADR treatment when architectural.

Git history preserves replaced guidance. Explicit temporary deprecation is used
only when compatibility needs a named replacement and removal trigger. Do not
create generated variants, project copies, permanent telemetry records, or
transient handoffs from the library. Consuming projects remain pinned until a
separate update task adopts a newer AP commit.

### Defensive-Security Profile

`INFOSEC.md` is a durable advisory protocol companion: a Community-Profile-style
specialization for defensive security work. It is not normative AP, not task
authority, and not a competitor to `AP.md`. Its intended consumers are
Orchestrators routing security work and Workers executing activated security
tasks; README and both handbooks provide discovery, and the profile links back
to its normative owners. It activates only through an authoritative prompt,
project rule, or risk-routing decision, and its dated source registry must be
refreshed before time-sensitive audits. Advisory guidance must not become
normative silently; promotion changes the exact normative owner and receives
ADR treatment when architectural.

## Sensitive Security Evidence

Security audit reports, containment ledgers, and proof artifacts that may carry
sensitive material form the sensitive-security-evidence artifact class:

| Attribute | Rule |
|---|---|
| Classification | sensitive security evidence |
| Authority | evidence only; never task authority |
| Intended consumer | the Orchestrator, the correction Worker, the re-auditor, and the Cooperator |
| Discoverability | named in the audit task and report |
| Retention trigger | until the finding is closed or the residual-risk decision is recorded |
| Cleanup trigger | finding closure or recorded residual acceptance |
| Cleanup owner | the Orchestrator, under explicit lifecycle authority |

Redaction is the default: paths and structure may be reported, while secrets,
credentials, personal data, and raw payloads are never reproduced in prompts,
reports, tests, logs, public documents, external tools, or public web searches.
Synthetic fixtures carry proofs where possible. Raw sensitive evidence stays
inside the declared containment boundary and is cleaned with exact paths only.

## Worker Duties

When creating, replacing, or deleting documentation artifacts, the Worker must:

- verify that the current task grants the necessary lifecycle authority;
- identify classification, consumer, discoverability, retention, and cleanup;
- transfer material conclusions before removing temporary evidence;
- update inbound links;
- validate local links and changed paths;
- report whether each affected artifact was retained, consolidated, replaced,
  or deleted.

## Orchestrator Duties

The Orchestrator must:

- decide whether a report is sufficient before authorizing a committed artifact;
- reject duplicate sources of truth;
- define artifact lifecycle metadata in the Worker task;
- verify that committed cleanup was authorized;
- verify public committed state when available.

## Related Documents

- [AP.md](AP.md)
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
- [PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md)
- [INFOSEC.md](INFOSEC.md)
