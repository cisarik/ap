# Defensive-Security Profile for Analytic Programming

## Status, Authority, And Activation

Artifact relationship: **activated advisory security profile** of
[RF-18](AP.md#rf-18-authority-security-and-untrusted-content-boundaries).

`INFOSEC.md` is an **advisory** Community-Profile-style specialization of
Analytic Programming, in the sense of NIST SP 800-218A: a profile that augments
a base framework for one domain without replacing it.

[AP.md](AP.md) remains the sole live normative protocol. This profile:

- is subordinate to `AP.md` and never replaces, redefines, or competes with it;
- has no independent authority and grants no task authority by itself;
- never expands permissions, paths, commands, network access, secret access, or
  Git authority beyond what the current authoritative Orchestrator prompt
  grants;
- applies only to defensive work on owned or explicitly authorized targets;
- activates only when an authoritative prompt, a consuming project's rule, or a
  risk-routing decision selects a security task class; and
- carries dated source references that must be refreshed before time-sensitive
  audits, because security standards, awareness lists, and provider
  documentation change.

If this profile conflicts with `AP.md`, `AP.md` prevails and this profile needs
correction. Ordinary AP tasks that never trigger a security route may never
need this document.

## 1. Purpose, Scope, Activation, And Non-Goals

Purpose: give AP projects a coherent, proportionate defensive-security
lifecycle — threat modelling, finding discipline, containment, correction, and
re-audit — without turning every change into a full audit.

Scope: defensive review and audit of software the project owns or is explicitly
authorized to test; evidence handling; correction and re-audit routing; source
and version discipline for security standards.

Activation: the Orchestrator selects a security route from the risk-weighted
matrix in section 3, or an authoritative prompt or project rule names a
security task class directly. Activation binds the Worker through the prompt,
never through this document alone.

Non-goals:

- offensive tooling, operational exploitation, or attack capability;
- scanning or probing of unrelated public or third-party systems;
- duplicating external standards catalogs into AP;
- a completeness guarantee from any checklist, including this one;
- mandatory maximum-breadth security work for every slice.

## 2. Relationship To AP Documents

| Document | Relationship |
|---|---|
| [AP.md](AP.md) | Sole normative protocol and semantic owner; its Defensive-Security Task Anchor is the binding core this profile elaborates |
| [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md) | Structural projection for exact finding, threat-model, containment, source, audit, and correction fields |
| [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md) | Operational routing, finding evaluation, correction authorization, and re-audit duties |
| [AP_WORKER.md](AP_WORKER.md) | Worker-side evidence, containment, and reporting duties |
| [PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md) | Advisory prompt patterns P15, P16, P17, and P04 apply unchanged; this profile adds no new pattern identifiers |
| [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md) | Operational lifecycle projection for sensitive-security evidence |
| ADRs | ADR-0010 records this profile's ownership decision and deferrals; ADR-0015 retires suite-backed AP-repository enforcement while preserving the defensive-security decision |

This profile introduces no new persistent role and no new AP phase. It reuses
the existing Worker session profiles. Ownership and contradiction invariants are
validated by proportional documentation and repository review under
[AP.md](AP.md), not by a live AP-repository conformance suite.

## 3. Risk-Weighted Routing

Security effort follows risk, not ceremony. The Orchestrator assesses per task:
change type, attack-surface delta, data sensitivity, authorization impact,
filesystem, process, or network boundary impact, dependency or build change,
deployment exposure, uncertainty, reversibility, and blast radius. Exactly one
primary route is selected; escalations are explicit.

| Route | Meaning |
|---|---|
| R0 | No additional security action; standard implementation evidence suffices |
| R1 | Inline secure-implementation checks inside the implementation session |
| R2 | Focused current-Worker verification on its own diff, labelled non-independent |
| R3 | Fresh focused audit (sections 4.2, 4.4–4.7) |
| R4 | Broad milestone application audit (section 4.3) |
| R5 | Pre-deployment application audit plus separate host-hardening audit |
| R6 | Correction plus fresh independent re-audit loop |

| Trigger profile | Route |
|---|---|
| Documentation, comment, or test-only change with no executable path or contract change | R0 |
| Ordinary reversible slice with no attacker-controlled input, boundary, secret, or dependency delta | R1 |
| Slice touching input validation, error or cleanup paths, or logging of user data | R1 + R2 |
| Dependency manifest or lock change without a new external dependency | R2 |
| New external dependency, build or provenance change, generated-artifact change | R3 (dependency audit) |
| Authentication, authorization, session, token, role, or permission-check touch | R3 (authN/Z audit); R1 during implementation |
| Filesystem, upload, media, or archive pipeline touch | R3 (file audit) |
| AI or provider boundary, tool invocation, egress, untrusted-content ingestion | R3 (provider-boundary audit) |
| Cryptography, secret storage or rotation, key handling | R3 plus mandatory re-audit after correction |
| Irreversible or wide-blast-radius change | escalate one route level |
| Novel attack surface or high uncertainty | escalate one route level |
| Milestone or release candidate | R4 |
| Deployment gate | R5 |
| Any acceptance-blocking finding | R6 until closure or documented residual acceptance |

When this profile is activated, two anti-extreme guards apply under AP
precedence:

- no full-repository audit by default — breadth comes only from R4 or R5
  triggers, never from the mere fact that a change happened;
- no free pass for small slices — a one-line change to an authorization check
  routes like any authorization touch. Size is not an input; boundary and
  reachability are.

## 4. Security Lifecycle

The lifecycle maps onto existing AP Worker session profiles. None of these
entries creates a new role or phase.

### 4.1 Slice-Level Secure Implementation Review

Inside a Fresh Implementation Worker session on routes R1 and R2 only. The
Worker applies the slice threat model to its own diff: assets, trust
boundaries, attacker-controlled inputs, authorization checks, error and cleanup
paths, secrets and logging, and dependency delta. Evidence is labelled
non-independent. No candidate above `low` severity, no authentication,
authorization, trust-boundary, secret-handling, or cryptographic touch, and no
unresolvable suspicion may be closed inline; those stop the slice and route to
a focused audit. Inline review never certifies.

### 4.2 Focused Defensive Audit

A Fresh Evidence Probe or Fresh Independent Audit targeting one bounded
subsystem, boundary, threat hypothesis, or recent change. Read-only plus
explicitly authorized temporary probe state. Uses the finding record, evidence
discipline, containment contract, and containment ledger. Fresh independence.

### 4.3 Broad Milestone Application Audit

A Fresh Independent Audit scoped by an approved attack-surface map at a
milestone. Coverage is driven by trust boundaries, entry points, data
sensitivity, and recent change — never by a read-every-file instruction. The
report states what was selected, what was excluded, and why. Fresh independence
is mandatory.

### 4.4 Authentication And Authorization Audit

A specialization of the focused or broad audit. Verifies server-side
enforcement of every privileged action, horizontal and vertical boundary
crossings such as insecure direct object reference and privilege escalation,
session and token lifecycle, cross-site request forgery on state-changing
routes, administrative-surface exposure, and direct API access that bypasses
interface restrictions. Uses synthetic accounts and roles only. Fresh
independent re-audit is mandatory for corrections in this area.

### 4.5 File, Upload, Media, And Filesystem Audit

A specialization for path traversal, containment escape, symlink, hardlink, and
special-file handling, time-of-check to time-of-use windows, archive
extraction, content-type confusion, size and resource limits, write atomicity,
final permissions, and error cleanup. Uses synthetic files and archives inside
declared temporary roots only.

### 4.6 AI And Provider-Boundary Audit

A specialization for provider-secret containment, server-side authority over
model and tool selection, prompt-injection handling of untrusted content,
unsafe tool or network invocation paths, model-output validation, egress
allowlists, resource-abuse limits, logging privacy, and the ordinary-user
versus administrator capability split. A live provider refusal is narrowed to
static or synthetic analysis and recorded, never bypassed. Fresh independent
re-audit is mandatory for boundary changes.

### 4.7 Dependency And Supply-Chain Audit

A specialization for manifest and lockfile consistency, known-vulnerability
signals with reachability analysis, typosquatting and dependency-confusion
signals, abandonment signals, transitive risk, build provenance and
generated-artifact status, and release integrity. Tools run without project
secrets, inside temporary roots, with network access limited to pinned versions
and official advisory sources. Tool output is evidence requiring
interpretation, never an automatic finding. See section 13.

### 4.8 Pre-Deployment Application Audit

The broad audit applied at a deployment gate. Fresh independence is mandatory.
It is paired with, and never merged into, the host-hardening audit.

### 4.9 Host And Infrastructure Hardening Audit

A separate audit class, normally Orchestrator-led with Cooperator-executed
read-only checks or a Fresh Evidence Probe with host read-only authority.
Covers deployment architecture, patch posture, reverse proxy and transport
security, exposure, service sandboxing, filesystem ownership, backup and
restore evidence, monitoring, secret deployment, and update and recovery
procedures. It mutates nothing and is never mixed into an application-code
audit session.

### 4.10 Accepted-Finding Correction

A Bounded Correction Worker with an exact path allowlist, accepted findings
only, a regression test that fails before and passes after, and one corrective
commit only when explicitly authorized. The corrector is never the auditor and
never self-certifies.

### 4.11 Fresh Independent Re-Audit

A Fresh Independent Re-Audit targeting the correction plus the original risk
claim. The re-auditor did not implement the correction, does not correct what
it audits, and returns a per-finding verdict of `verified-closed` or
`not accepted`.

### 4.12 Disclosure And Sensitive-Report Handling

Findings stay inside the project boundary by default. Reports redact sensitive
material. Publication of finding details requires explicit Cooperator
authority. External reporting, such as an upstream CVE or vulnerability
disclosure program, follows coordinated-disclosure practice and is always a
separately authorized task.

## 5. Threat-Model And Trust-Boundary Requirements

Every activated security task records a proportionate threat model in its
prompt or report:

- assets at risk;
- trust boundaries crossed;
- attacker-controlled inputs or the local-actor assumption;
- security properties relied on;
- relevant abuse cases proportionate to the route.

A missing threat model is a stopping condition for an audit, not a detail to
improvise later.

## 6. Finding And Evidence Contract

The exact structural finding record is projected by
[PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md#security-finding-record-contract).
When activated, use it as follows:

- a candidate weakness is not a vulnerability until reachability and
  preconditions are established;
- a vulnerability claim is not an exploitability claim until the evidence
  class supports it;
- evidence classes are exactly `reproduced-dynamic`, `established-static`,
  `inferred`, and `hypothesis-unverified`;
- false-positive rejection is a valid positive audit result and is reported as
  `rejected-false-positive` with the disproving evidence;
- every cited external standard carries title, owner, exact version or edition,
  status, and retrieval date.

## 7. Severity And Confidence Discipline

Severity (`critical`, `high`, `medium`, `low`, `info`) is derived, never
asserted from terminology. Inputs: reachability, preconditions, required
privilege, trust-boundary crossing, reversibility, blast radius, and
confidentiality, integrity, and availability impact. Dramatic wording is not an
input.

Confidence (`high`, `medium`, `low`) records how strongly the evidence supports
the finding. A high-severity claim with low confidence is a routing signal for
more evidence, not for a stronger claim.

CVSS is optional and generally unnecessary for ordinary internal AP slices. It
may appear as a supplementary field when a project already communicates
externally in CVSS, for example CVE or coordinated-disclosure workflows. It is
never required and never substitutes for the derived-severity inputs.

## 8. Exploitability Conclusion Discipline

Exploitability conclusions are exactly:

| Conclusion | Requirement |
|---|---|
| `demonstrated` | requires `reproduced-dynamic` evidence inside authorized containment |
| `probable` | requires at least `established-static` evidence plus established reachability |
| `plausible but unproven` | the ceiling for a suspicious pattern, dangerous API, `inferred`, or `hypothesis-unverified` evidence |
| `not demonstrated` | honest absence of proof; never inflated |
| `not applicable` | the finding class does not admit exploitation reasoning |

The evidence class caps the conclusion. A CWE classification, a dangerous API,
or a CVE entry never by itself raises the ceiling.

## 9. Defensive Reproduction And Containment Contract

Dynamic confirmation is permitted only against owned or explicitly authorized
targets:

- use isolated clones, fixtures, test accounts, disposable databases,
  containers, or restrictive temporary roots;
- use synthetic credentials, media, accounts, data, and targets; real private
  data is never accessed to prove a finding, and if synthetic evidence cannot
  carry the proof the conclusion is capped;
- proof stops at the smallest decision-quality demonstration; no exploit
  packaging beyond that minimum;
- no scanning of unrelated public or third-party systems;
- no persistence, stealth, phishing, credential theft, exfiltration,
  destructive behavior, or denial of service, even inside containment;
- no mutation of the canonical repository during a read-only audit;
- limitations are reported, never fabricated around;
- a provider or environment refusal is narrowed to a safe authorized subset or
  reported, never bypassed by rewording, tool changes, or model switching.

The universal rules live in [AP.md](AP.md); the procedures here are advisory
profile detail.

## 10. Containment Ledger

Every audit report carries a containment ledger. Each temporary root, fixture,
account, and network target is declared before use with:

- exact absolute path or identity;
- owner;
- permission mode;
- allowed contents class;
- cleanup owner; and
- cleanup outcome.

Cleanup removes exact declared paths only. Wildcard cleanup is forbidden.
Failures to clean are reported explicitly with the remaining artifact and
reason.

## 11. Sensitive Evidence, Redaction, Retention, And Cleanup

Sensitive security evidence is redacted by default: paths and structure may be
reported; secrets, credentials, personal data, and raw payloads never are.
Sensitive artifacts follow the sensitive-security-evidence artifact class in
[ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md): project-owned, lifecycle-bound,
named consumer, named cleanup trigger and owner. Raw sensitive evidence is
never placed into prompts, reports, tests, logs, public documents, external
tools, or public web searches.

## 12. Source And Web-Research Policy

- Primary or project-authoritative sources are preferred; secondary sources
  only locate primary ones and are marked as such.
- Every source record carries title, owner, exact version or edition, status
  (final, draft, awareness, taxonomy, maturity model, or tooling), retrieval
  date, and the AP concept it supports.
- Drafts never silently become current requirements.
- Time-sensitive material is refreshed before pre-deployment and other
  time-sensitive audits.
- Provider-specific documentation is rechecked when generating a current
  provider-specific prompt.
- Raw sensitive evidence is never submitted to public web search.
- External requirement catalogs are referenced and mapped, never bulk-copied
  into AP.

## 13. Dependency And CVE Reachability Analysis

A CVE or advisory entry affecting a dependency is a risk signal, not a finding.
The audit records:

1. the signal with its exact advisory identity and source record;
2. reachability: entry point, call path, and deployed or enabled state, or
   `not established`;
3. applicability: version range, configuration, and platform preconditions;
4. the verdict per the exploitability discipline.

An unverifiable signal is recorded as `hypothesis-unverified`. Tool output,
including scanner results, is evidence requiring interpretation.

## 14. Residual-Risk Acceptance

The Orchestrator may accept `low` or `info` findings as documented residual
risk when the finding record is complete and a regression test exists where
applicable. `medium` or higher requires explicit Cooperator sign-off. The
acceptance is recorded in the closure evidence. Nothing is accepted silently.

## 15. Audit, Correction, And Re-Audit Separation

- the auditor never corrects;
- the corrector never self-certifies;
- the re-auditor neither corrected nor implemented;
- read-only audit authority never includes canonical-repository mutation;
- a correction after an acceptance-blocking, `high`, or `critical` finding, or
  any correction touching authentication, authorization, cryptography, or
  secret handling, requires a fresh independent re-audit.

## 16. Stop And Escalation Rules

Stop and report when:

- the target is not owned or explicitly authorized;
- the threat model is missing;
- containment would be exceeded or a fixture would escape its temporary root;
- real private data would be needed to prove a finding;
- a provider or environment refuses; narrow to a safe authorized subset or
  stop and report, never bypass;
- scope creeps toward unrelated systems;
- a hypothesis is disproven — report `rejected-false-positive` and continue or
  close;
- required evidence cannot be produced; escalate the route instead of
  weakening evidence.

## 17. Report Requirements

A security audit report contains:

- audit header: security task class, owned or authorized target, exact commit
  under audit, scope, exclusions, and source records with versions and
  retrieval dates;
- the threat model;
- findings in the finding record schema, including `rejected-false-positive`
  results;
- the containment ledger with cleanup outcomes;
- limitations and unverifiable items;
- a residual-risk summary for acceptance decisions.

## 18. Explicit Deferrals And Boundaries

Deferred, requiring their own future decisions:

- splitting host hardening into a separate top-level profile;
- CVSS automation or scoring tooling;
- SBOM or VEX production for AP itself, which has no build artifacts;
- external coordinated-disclosure process setup, which is per-project work;
- tool-level validation of this profile by `ap doctor`;
- a standing model-suitability database;
- signed releases or provenance for AP itself.

Boundaries: this profile never authorizes offensive work, never binds a
project that has not activated it, and never weakens an existing `AP.md` rule.

## 19. Source Registry

Initial registry, retrieved 2026-07-19. Records support concepts by reference;
they are not copied catalogs. Refresh time-sensitive records before relying on
them again.

| Source | Owner | Version / status | AP concept supported |
|---|---|---|---|
| NIST SSDF, SP 800-218 | NIST | v1.1, final | Security lifecycle families; vulnerability response |
| NIST SP 800-218A Generative AI Community Profile | NIST | final | The Community-Profile specialization pattern; AI-boundary practices |
| CISA Secure by Design | CISA et al. | current initiative | Secure-by-design ownership principles |
| CISA/FBI Product Security Bad Practices | CISA + FBI | v2.0, final guidance | Bad-practice anchors; disclosure expectations |
| OWASP ASVS | OWASP | 5.0, final | Version-qualified verification-requirement mapping |
| OWASP Top 10 | OWASP | 2025, awareness | Awareness and prioritization only, never completeness proof |
| OWASP SAMM | OWASP | v2.0, maturity model | Risk-driven proportionate improvement |
| MITRE CWE corpus and Top 25 | MITRE | corpus current; 2025 Top 25, taxonomy | Weakness taxonomy; weakness is not reachability |
| OpenSSF OSPS Baseline | OpenSSF | v2025-10-10, tooling | Repository-posture controls for supply-chain audit |
| OpenSSF Scorecard | OpenSSF | maintained tooling | Automated checks as evidence requiring interpretation |
| SLSA | OpenSSF community | v1.2, final | Provenance and release-integrity concepts |
| OWASP Top 10 for LLM Applications | OWASP GenAI project | v2.0, awareness | Provider-boundary risk categories |

Each record's retrieval date is 2026-07-19. Awareness and taxonomy records are
prioritization inputs; final standards support version-qualified mappings;
maturity models support proportionality; tooling records support evidence
collection only.

## Related Documents

- [AP.md](AP.md)
- [PROMPT_CONTRACTS.md](PROMPT_CONTRACTS.md)
- [AP_ORCHESTRATOR.md](AP_ORCHESTRATOR.md)
- [AP_WORKER.md](AP_WORKER.md)
- [PROMPT_ENGINEERING_PATTERNS.md](PROMPT_ENGINEERING_PATTERNS.md)
- [ARTIFACT_LIFECYCLE.md](ARTIFACT_LIFECYCLE.md)
- [GLOSSARY.md](GLOSSARY.md)
- [docs/adr/0010-defensive-security-profile.md](docs/adr/0010-defensive-security-profile.md)
