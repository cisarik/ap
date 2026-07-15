# ADR-0007: Worker Session Evidence and Restoration Lifecycle

## Status

Accepted

## Date

2026-07-15

## Context

ADR-0006 formalized adaptive orchestration, preflight selection, reasoning
recommendations, public verification, browser evidence, Discovery Records, and
restoration prompt shape. Field use after that decision showed several related
gaps in the universal protocol:

- Fresh Worker sessions needed a name for bounded evidence postures without
  creating new permanent roles.
- Independent evidence needed to be proportionate rather than reserved only for
  the narrow phrase "exceptional risk" or required for every commit.
- Evidence probes sometimes need temporary synthetic state, but that mutation
  must not be confused with repository, durable project, production, or
  external-service mutation.
- Implementation self-review and tests are valuable evidence, but they are not
  independent certification.
- Corrections after independent findings need bounded authority and sometimes
  fresh re-audit, without making re-audit universal.
- Worker sessions need an explicit closure model so remaining context does not
  become implied continuing authority.
- Logical-block closure and Orchestrator rotation need clearer qualitative
  criteria.
- Restoration prompts need to preserve operational continuity, strategic
  continuity, development narrative, and forward horizon without becoming
  transcript dumps or permanent handoff files.
- Universal AP needs configurable communication-routing fields while leaving
  actual language values to consuming project rules.

## Decision

AP formally recognizes Worker session profiles. A profile describes the bounded
authority, independence posture, and evidence posture of one Worker session. It
is not a persistent role and not an AP phase. The permanent AP roles remain
COOPERATOR, ORCHESTRATOR, and WORKER. Recognized profiles include Fresh
Implementation Worker, Worker-Executed Preflight, Fresh Evidence Probe,
Diagnostic Worker, Bounded Correction Worker, Fresh Independent Audit, and
Fresh Independent Re-Audit. Discovery remains a phase, not a Worker role or
profile.

AP adopts a proportional evidence ladder:

```text
direct Orchestrator acceptance
-> implementation evidence review
-> diagnostic closeout
-> fresh evidence probe
-> fresh independent audit
-> bounded correction
-> fresh independent re-audit
```

The ladder is a selection guide, not a mandatory sequence. Use fresh
independence when proportionate risk, uncertainty, or evidence cost justifies
it. Independent audit is not required for every commit.

AP defines Fresh Evidence Probe as a Worker session profile and prompt
contract, not a new phase. A probe may collect narrow evidence with explicitly
bounded temporary probe-state mutation. Probe prompts must distinguish
repository mutation, temporary probe-state mutation, durable project-state
mutation, and external or production mutation. Unless separately authorized, a
probe remains read-only for repository, durable project, production, external
account, and service state. Temporary probe artifacts must be bounded,
non-secret, outside protected project state where practical, identified before
use, cleaned after use, and reported with location and cleanup outcome.

AP records the independence invariant: implementation Worker self-review,
tests, diff inspection, and same-session diagnostics are valid evidence, but
they are not independent certification. Independent certification requires a
fresh Worker session that did not materially implement the target being
certified.

AP defines the proportional correction sequence as independent finding,
bounded correction, and fresh independent re-audit when proportionate. A
Bounded Correction Worker has implementation authority only for confirmed
defects and explicitly authorized adjacent consistency changes. Fresh
Independent Re-Audit is a form of Independent Audit targeting the correction
plus the original risk claim; it is not a persistent role or a new phase.
Direct Orchestrator acceptance remains available for genuinely trivial,
low-risk, mechanical corrections when evidence is sufficiently strong.

AP defines normal Worker session closure as fresh bounded task, formal report,
and session closed for autonomous work. Remaining context is not continuing
authority. A new task requires a new explicit prompt. Related reuse is
permitted only through explicit Orchestrator decision and a new bounded prompt;
substantial unrelated logical slices should normally use a fresh Worker.

AP defines logical-block closure as an Orchestrator decision that proportionate
evidence has established the accepted boundary. Closure prevents speculative
reopening without contradictory evidence. It does not mean the entire feature
or roadmap is complete, future extension is forbidden, or contradictory
evidence may be ignored.

AP strengthens Orchestrator restoration stewardship. Context pressure is
qualitative, using signals such as session duration, closed logical blocks,
superseded state, Worker report complexity, unresolved decision density,
repeated reconstruction effort, contradictions between memory and repository
truth, loss of precision, and quality drift. AP does not define numeric token
thresholds, fixed prompt lengths, or mandatory rotation after every commit.

AP restoration preserves four layers: operational continuity, strategic
continuity, development narrative, and forward horizon. Restoration remains
synthesis, not a transcript dump, hidden Worker task prompt, substitute for
repository truth, or permanent repository handoff. A restoration prompt grants
no repository, implementation, deployment, production, account, filesystem,
external-service, Git, or host mutation authority.

AP defines restoration readiness review with PASS, PARTIAL, and BLOCKED
classifications. The review covers contradiction, omission, stale state,
authority, active mutation, active Worker, security boundary, strategic
direction, and next-step executability. It optimizes for evidence-dense
synthesis rather than maximum length.

AP defines project-configurable communication-routing fields for
Cooperator-facing language, Worker progress language, Orchestrator-to-Worker
prompt language, formal Worker report language, and repository documentation
language. Consuming project rules supply actual values.

## Consequences

The protocol gains a more precise vocabulary for fresh evidence, independence,
correction, re-audit, session closure, logical-block closure, restoration
readiness, and communication routing without adding permanent roles or phases.

Orchestrators receive clearer guidance for choosing the lowest sufficient
evidence profile, authorizing temporary probe state, deciding whether a
correction needs re-audit, closing logical blocks, and rotating before context
quality degrades.

Workers receive clearer obligations to follow the assigned profile, report
temporary probe artifacts and cleanup, avoid self-certification claims, close
autonomous work after the formal report, and stay within bounded correction
authority.

Consuming projects keep language and communication values in project-owned
rules rather than universal AP documents.

## Rejected Alternatives

- **New permanent roles**: rejected because COOPERATOR, ORCHESTRATOR, and
  WORKER remain sufficient protocol roles.
- **Mandatory audit of every commit**: rejected because evidence must remain
  proportionate.
- **Mandatory Extra High reasoning**: rejected because reasoning guidance is
  non-authoritative and Extra High is reserved for proportionate risk.
- **Parallel autonomous Worker requirements**: rejected because AP remains
  sequential at the protocol boundary.
- **Numeric context thresholds**: rejected because clients expose different
  telemetry and qualitative context stewardship is more portable.
- **Fixed giant prompts**: rejected because prompt size should follow evidence
  density and task risk.
- **Remaining context as implicit authority**: rejected because authority comes
  only from the current Orchestrator task prompt.
- **Permanent NEXT_WORKER.md and NEXT_ORCHESTRATOR.md**: rejected because
  dynamic restoration and repository truth remain the normal rotation model.
- **Hidden session-state databases**: rejected because they would create
  unverifiable state outside repository evidence and explicit prompts.
- **Project-specific language rules in universal AP**: rejected because
  consuming projects own actual communication-routing values.

## Revisit Triggers

Revisit this decision if:

- Worker session profiles are treated as permanent roles;
- Evidence Probe is treated as a new AP phase;
- implementation tests are dismissed instead of correctly classified as
  non-independent evidence;
- fresh independent audit becomes mandatory ceremony for ordinary commits;
- correction tasks expand beyond confirmed defects;
- restoration prompts become transcript archives or task-authority substitutes;
- consuming projects need additional routing fields that cannot be expressed
  through project-owned rules.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../GLOSSARY.md](../../GLOSSARY.md)
- [../../FAQ.md](../../FAQ.md)
- [0006-adaptive-orchestration-and-preflight-lifecycle.md](0006-adaptive-orchestration-and-preflight-lifecycle.md)
