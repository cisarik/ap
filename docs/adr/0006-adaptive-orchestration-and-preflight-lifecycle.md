# ADR-0006: Adaptive Orchestration and Preflight Lifecycle

## Status

Accepted

## Date

2026-07-11

## Context

Field use showed that AP works best when the Orchestrator adapts process to
risk instead of applying the same ceremony to every task.

Observed patterns include:

- ordinary repository tasks need inspection and repository gates, but not a
  separate read-only phase;
- real-host, deployment, storage, durable-data, credential, authorization, and
  destructive work often needs a separate preflight before mutation authority;
- substantial fresh Worker slices benefit from bounded diagnostic closeout when
  risk justifies it;
- Extra High reasoning can be valuable for protocol-wide or deeply ambiguous
  architecture work, but it is not proportionate for every task;
- High reasoning is often sufficient for bounded architecture, documentation,
  persistence, and operational preparation;
- user-visible work needs automated evidence and, where subjective or physical
  behavior matters, separate Cooperator rendered acceptance;
- public verification sometimes needs fallback methods when direct Git is
  unavailable in one environment;
- real-host and physical-device preflight sometimes works best when the
  Orchestrator leads and the Cooperator executes one read-only step at a time;
- Cooperator brainstorming can mix accepted intent, tentative ideas, rejected
  alternatives, corrections, and open questions;
- restoration prompts must synthesize current intent, repository truth, Worker
  evidence, accepted decisions, unresolved risks, and the next phase without
  requiring the Cooperator to request maximum reasoning.

AP already had durable rules for fresh-slice implementation, diagnostic
closeout, dynamic restoration, artifact lifecycle, and public verification.
This decision formalizes how those pieces are selected and combined.

## Decision

AP adopts an adaptive orchestration lifecycle with these phases:

- Discovery;
- Preflight;
- Implementation;
- Acceptance;
- Diagnostic Closeout;
- Independent Audit;
- Restoration.

The phases are not a mandatory linear sequence. The Orchestrator selects only
the phases required by current risk, uncertainty, evidence, and Cooperator
intent. Phase names do not grant Worker authority.

Every implementation task includes embedded preflight: repository gates,
inspection before mutation, capability checks, boundary review, and relevant
validation planning.

A separate read-only preflight should normally be used before implementation
when work involves real-host or production mutation, deployment or service
activation, destructive or difficult-to-reverse operations, database or
durable-data migration, credentials, authentication, authorization,
account-level or external-service mutation, physical devices, storage, unknown
time-sensitive environment state, unclear rollback, or premature
implementation authority.

A preflight output should establish current verified state, evidence sources
and limits, unknowns and blockers, exact proposed mutation boundary,
dependencies, backup or checkpoint expectations, rollback, stop conditions,
acceptance plan, recommended Worker capability, recommended reasoning effort,
and whether implementation should proceed. It reports PASS when evidence is
sufficient to recommend a separately authorized implementation slice, PARTIAL
when useful evidence exists but a material prerequisite, risk, or rollback
detail remains unresolved, and BLOCKED when implementation must not be
authorized. Preflight does not grant later implementation authority.

Separate preflight supports two execution topologies. In Worker-executed
preflight, a read-only Worker inspects repository, environment, or external
state within explicit authority and reports evidence. In Orchestrator-led,
Cooperator-executed preflight, the Orchestrator defines the objective, explains
threat, benefit, limitation, rollback or non-mutation guarantee, and expected
evidence, issues one small environment-labelled command or observation request
at a time, classifies complete Cooperator-returned output before the next step,
and grants no later implementation authority by the preflight itself.

After a PASS separate preflight, implementation requires a new prompt with
exact verified state, approved mutation boundary, checkpoint or backup,
rollback, step ordering, stop conditions, acceptance plan, required
capabilities, reasoning recommendation, and exact Git, host, filesystem,
account, or service authority.

Before every Worker prompt, the Orchestrator should recommend the lowest
sufficient reasoning profile and brief rationale when the execution client
exposes that control. No recommendation is required when the Orchestrator acts
directly without assigning a Worker.
The vendor-neutral profiles are Light or Low, Standard or Medium, High, and
Extra High. Higher reasoning is not broader authority. Extra High is reserved
for protocol architecture, authentication or authorization architecture,
cryptography or secret-handling design, destructive data migration, severe
concurrency or corruption risk, very large durable-state preservation,
unusually ambiguous multi-source architecture, or exceptionally high-impact
independent audit. Reasoning is selected separately for preflight,
implementation, diagnostic closeout, and audit. The Cooperator retains final
selection among available client settings.

Before presenting a substantial Worker prompt, the Orchestrator applies a
prompt-synthesis readiness gate. It checks the current phase, exact repository
and baseline, accepted decisions versus brainstorming, one coherent primary
outcome, lowest sufficient reasoning recommendation, required capabilities,
preflight choice, path and command authority, negative scope, Git authority,
public-verification method and fallback, acceptance mode, artifact lifecycle,
context-pressure rule, stopping conditions, report structure,
project-specific deviations, contradiction and omission review, and
fresh-Worker comprehensibility. The gate optimizes for evidence density and
completeness, not maximum prompt length.

Before producing a restoration prompt, the Orchestrator verifies or clearly
classifies public repository state, confirms no mutation is in progress,
classifies active Worker sessions, identifies the completed logical boundary,
reconciles latest Cooperator intent with durable repository truth, preserves
accepted decisions and security boundaries, separates brainstorming from
adopted direction, names unresolved risks and evidence gaps, chooses the next
phase, recommends likely reasoning effort where useful, and performs a final
contradiction and omission review. At actual rotation the restoration output is
a professional self-contained prompt with explicit PASS, PARTIAL, or BLOCKED
classification, exact identity and verification fields, authority boundaries
including account and browser boundaries, current mutation state, current AP
phase, next bounded step, next Worker reasoning recommendation or premature
statement, public-verification requirements, and a no-mutation-authority
statement. Fields may be marked not applicable, unavailable, or unresolved, but
must not disappear silently.

AP formalizes a capability-adaptive public-verification evidence ladder:

1. direct Git evidence such as `git ls-remote`, clean temporary clone, exact
   fetch, or inspection of exact commit objects and trees;
2. official provider ref and commit APIs;
3. immutable exact-SHA web or raw evidence for commit-bound file identity;
4. supplementary branch pages, history pages, compare views, and branch-bound
   raw content.

Direct Git is preferred for proving public branch refs. Provider APIs are
provider-specific fallback evidence. Exact-SHA content can prove file identity
for that commit but not current branch-head equality by itself. Branch pages
and branch-bound raw content are supplementary.

For a Worker mutation gate, failure to prove a required public ref through an
authorized method is BLOCKED. For independent Orchestrator acceptance, fallback
evidence may support PASS only when it establishes current public branch ref
identity, exact commit identity with parent and relevant tree or changed paths,
and relevant committed content bound to that exact SHA. Exact commit and
content without current branch-head identity is PARTIAL. Worker-observed
successful Git evidence remains valuable but is not silently relabelled as
direct Orchestrator observation.

This evidence model is based on official Git and GitHub documentation. Git
documents `ls-remote` as listing remote references and their object IDs,
`fetch` as downloading objects and refs, and `clone` as creating a repository
with remote-tracking branches. GitHub documents provider-specific Git reference
and commit-object APIs, permanent file links that bind file views to commit
IDs, and repository contents responses for a named commit, branch, or tag. See:

- <https://git-scm.com/docs/git-ls-remote>
- <https://git-scm.com/docs/git-fetch>
- <https://git-scm.com/docs/git-clone>
- <https://docs.github.com/en/rest/git/refs>
- <https://docs.github.com/en/rest/git/commits>
- <https://docs.github.com/en/repositories/working-with-files/using-files/getting-permanent-links-to-files>
- <https://docs.github.com/en/rest/repos/contents>

For browser and rendered acceptance, automated browser evidence and Cooperator
UX acceptance are separate evidence classes. Browser automation proves only the
tested browser or engine, version, origin, state, and flow. Generic WebKit
automation supports WebKit-engine evidence only and does not automatically
prove behavior in the shipping Safari browser. Safari-specific claims require
actual Safari evidence, Safari Technology Preview evidence identified as such,
or explicit Cooperator observation in Safari. This distinction follows Apple
and WebKit documentation that identifies Safari Technology Preview as a browser
app built on WebKit and WebKit as the engine used by Safari:

- <https://developer.apple.com/documentation/safari-technology-preview-release-notes>
- <https://developer.apple.com/safari/resources/>

The Orchestrator may prepare numbered Cooperator acceptance checklists after
Worker evidence is verified. Feedback must be classified as accepted behavior,
concrete defect, missing evidence, product decision, or adjacent idea.

Cooperator brainstorming is a legitimate Discovery mode but is not
automatically accepted direction. When material unresolved exploration spans
sessions, has a future consumer, would be costly to reconstruct, influences a
major decision, or preserves alternatives needed for review, the Orchestrator
may recommend a project-owned Discovery Record. Discovery Records are optional,
visible, lifecycle-bound, non-authoritative, and not hidden chronological chat
archives. They must not be the sole live source of an accepted product,
architecture, security, or operating decision. They may describe accepted
decisions only when the same bounded change promotes the decision to its
authoritative durable destination or the record links to the artifact that
already contains it; otherwise decision-like items remain proposed, candidate,
recommended, or open. Accepted conclusions are promoted to durable artifacts
such as ADRs, specifications, project rules, roadmaps, or security documents.

Artifact boundaries remain distinct:

- restoration prompt: normal chat-delivered fresh-Orchestrator context;
- Discovery Record: optional decision-support evidence;
- repository handoff: exceptional operational lifecycle artifact for
  unreconstructable state;
- ADR, protocol, specification, project rule, roadmap, or security document:
  durable promoted truth.

This decision is backward-compatible with ADR-0004. Fresh-slice implementation,
diagnostic closeout, and independent audit remain bounded, sequential, and
proportionate.

## Consequences

AP gains a clearer decision framework for selecting preflight, implementation,
acceptance, diagnostic review, audit, restoration, and discovery artifacts.

Orchestrators carry more explicit responsibility for intent synthesis, phase
selection, reasoning recommendation, prompt readiness, and evidence fallback.

Workers receive clearer boundaries for read-only preflight, evidence
classification, browser evidence, and Discovery Record tasks.

The protocol remains vendor-neutral and does not require a particular model,
provider, browser automation framework, context size, or fixed prompt length.

Small tasks can remain compact. High-risk tasks can justify longer,
evidence-dense prompts without making that shape mandatory for all work.

Every Worker prompt now carries a reasoning recommendation, but that
recommendation may be a concise Light/Low or Standard/Medium line for small
tasks. This keeps small tasks proportional while removing ambiguity about
whether the Orchestrator should choose a profile.

## Rejected Alternatives

- **Mandatory Preflight -> Implementation -> Diagnostic for every task**:
  rejected because it turns proportional process into ceremony.
- **Always using maximum reasoning**: rejected because it consumes resources
  without matching every task's risk.
- **Reasoning level as authority**: rejected because authority comes only from
  the current Orchestrator task.
- **Reasoning recommendations only for substantial Worker tasks**: rejected
  because even small Worker prompts benefit from an explicit lowest-sufficient
  profile and rationale.
- **Permanent NEXT files**: rejected because dynamic restoration and repository
  truth are the normal rotation mechanism.
- **Manual handout commits**: rejected because the Cooperator should not have
  to manually create session-state commits as the default workflow.
- **Hidden chronological brainstorming archive**: rejected because it would
  accumulate stale and private session material.
- **Committing every brainstorming exchange**: rejected because most Discovery
  can resolve in conversation or be promoted only when useful.
- **Branch pages as sole public proof**: rejected because they are weaker than
  direct Git or exact ref API evidence and may be cached or ambiguous.
- **Assuming one browser engine proves all engines**: rejected because rendered
  behavior is engine- and environment-specific.

## Revisit Triggers

Revisit this decision if:

- consuming projects treat the phase list as a mandatory pipeline;
- separate preflight is skipped in high-risk operational work;
- Extra High reasoning becomes a default ritual instead of a reserved choice;
- fallback public verification proves too weak for common hosted providers;
- Discovery Records become hidden transcript logs or substitute for ADRs;
- browser evidence rules prove insufficient for user-visible acceptance;
- restoration prompts become too large to use or too small to restore state;
- AP later changes its Worker topology or distribution model.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../ARTIFACT_LIFECYCLE.md](../../ARTIFACT_LIFECYCLE.md)
- [0004-fresh-slice-diagnostic-lifecycle.md](0004-fresh-slice-diagnostic-lifecycle.md)
- [0005-single-live-protocol-and-pinned-submodule-distribution.md](0005-single-live-protocol-and-pinned-submodule-distribution.md)
