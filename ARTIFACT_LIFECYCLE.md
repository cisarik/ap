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
| Temporary committed evidence | Decision-support material committed only when multi-session review needs it | Investigation notes, comparison tables |
| Retained evidence | Durable evidence with continuing independent value | Compatibility record, incident record, benchmark |
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
