# ADR-0010: Defensive-Security Profile and Finding Contract

## Status

Accepted

## Date

2026-07-19

## Context

AP already owned the authority, trust-boundary, refusal, evidence-class, and
containment seeds of defensive-security work: `AP.md` section 10 bounds
defensive work to authorized targets and synthetic fixtures, the Plan-to-
Execution and independence rules separate auditing from correction, and
ADR-0009 separates capability, permission, containment, and authority.

Field use exposed a coherent gap cluster rather than isolated holes:

- no security-task taxonomy distinguished a slice-level secure review from a
  focused, broad, specialized, or pre-deployment audit;
- no finding contract existed, so exploitability could be claimed from a
  suspicious pattern, a dangerous API, a CWE classification, or a CVE entry;
- no severity derivation, evidence-class, or exploitability-conclusion
  discipline existed;
- defensive reproduction lacked containment rules: temporary roots, synthetic
  data, cleanup ownership, and prohibited actions;
- external security standards were cited without version, status, or retrieval
  discipline;
- dependency CVE signals had no reachability-analysis workflow;
- no risk-weighted routing mapped change risk to proportionate security
  effort, so both over-auditing and under-auditing remained possible;
- disclosure and sensitive-report handling was undefined.

Per-prompt improvisation could not close these gaps without reintroducing the
drift AP's ownership model exists to prevent.

## Decision

AP adopts a two-layer defensive-security architecture.

### Normative anchor in `AP.md`

A small Defensive-Security Task Anchor in `AP.md` section 10 establishes the
universal rules: explicit scope and owned or authorized targets; proportionate
asset and trust-boundary identification; evidence-class, reachability,
precondition, privilege, and impact discipline; the evidence-class cap on
exploitability claims; severity derived from reachability, preconditions,
privilege, boundary crossing, reversibility, blast radius, and
confidentiality, integrity, and availability impact; synthetic containment for
dynamic confirmation; no exposure of real secrets to prove a finding;
version-qualified external standards; audit and correction authority
separation; and the profile's subordination clause. Section 19 gains the
matching anti-patterns.

### Advisory `INFOSEC.md` profile

One advisory Community-Profile-style specialization, following the NIST SP
800-218A precedent of a profile that augments a base framework without
replacing it. `INFOSEC.md` carries the risk-weighted routing matrix, the
security lifecycle chapters, threat-model requirements, finding-contract usage,
severity and exploitability discipline, the defensive reproduction and
containment procedures, the containment ledger, sensitive-evidence handling,
the source and web-research policy, dependency and CVE reachability analysis,
residual-risk acceptance, stop and escalation rules, report requirements, and a
dated source registry. It activates only through an authoritative prompt,
project rule, or risk-routing decision, and never competes with `AP.md`.

### Structural ownership

`PROMPT_CONTRACTS.md` owns the machine-testable structures: the finding record,
threat-model fields, containment ledger, source version records, residual-risk
decisions, audit and correction prompt contracts, and decision-ready outlines
for the ten security workflow profiles. The handbooks carry the operational
duties. `tests/ap_tool_tests.sh` enforces the invariants with stable diagnostic
families and mutation-checked fixtures. No new persistent role, AP phase, or
pattern identifier is created.

### Standards are mapped, never imported

External standards (NIST SSDF v1.1, SP 800-218A, CISA Secure by Design,
CISA/FBI Product Security Bad Practices v2.0, OWASP ASVS 5.0, OWASP Top
10:2025, OWASP SAMM v2.0, MITRE CWE and the 2025 Top 25, OpenSSF OSPS Baseline,
OpenSSF Scorecard, SLSA v1.2, OWASP Top 10 for LLM Applications v2.0) are
referenced by exact version, status, and retrieval date. Their requirement
catalogs are never bulk-copied into AP. OWASP Top 10 is awareness and
prioritization material, never completeness proof. A CWE classification or
dangerous API is not automatically a reachable vulnerability; a CVE is a risk
signal, not proof of reachability or exploitability. CVSS is optional and
generally unnecessary for ordinary internal AP slices; it may be supplementary
for external CVE, VDP, or coordinated-disclosure workflows.

## Alternatives Considered

- **Advisory `INFOSEC.md` only, no `AP.md` change**: rejected, because the
  finding contract, exploitability discipline, and audit/correction separation
  need a normative anchor or they can silently conflict with `AP.md`.
- **Distributed additions across contracts, handbooks, patterns, and tests
  without a profile**: rejected, because scattering security rules invites the
  semantic drift the ownership model prevents and maximizes consumer review
  surface.
- **Multiple narrow security profiles**: rejected for now; fragmentation
  before the profile pattern is proven. Splitting host hardening is a deferred
  candidate.
- **Everything inside `AP.md`**: rejected, because standards-mapping detail and
  audit procedures would bloat the universal core every ordinary task carries.

## Rationale

The two-layer design keeps `AP.md` small and universal while giving security
work one coherent advisory home. The finding contract makes exploitability
claims falsifiable and capped by evidence. Risk-weighted routing prevents both
ceremonial over-auditing and silent under-auditing. Audit, correction, and
re-audit remain separate authorities, extending the existing independence
invariants rather than creating parallel ones. False-positive rejection is a
recorded positive result, which keeps audits honest.

## Compatibility

The decision is prospective and purely additive. Historical prompts remain
interpretable under their original AP pin. The `ap` tool, the managed consumer
`AGENTS.md` block, `INTEGRATION.md`, `UPDATING.md`, and consumer pins are
unchanged; `INFOSEC.md` propagates through the ordinary pinned-submodule
update flow. A project that never triggers a security route never needs the
profile. No existing ADR is superseded.

## Consequences

Security tasks gain explicit routing, a complete finding record, containment
procedures, and versioned source discipline. Orchestrators gain finding
evaluation, correction authorization, residual-risk, and re-audit routing
duties. The advisory profile must be kept non-normative over time; the
`infosec-ownership-*` diagnostics and review-at-update duty are the guard.
The dated source registry ages and must be refreshed before time-sensitive
audits.

## Explicit Deferrals

- `ap doctor` or tool-level validation of `INFOSEC.md`.
- Any change to the managed consumer `AGENTS.md` block.
- Splitting host hardening into its own top-level profile.
- CVSS automation or scoring tooling.
- SBOM or VEX production for AP itself, which has no build artifacts.
- External coordinated-disclosure process setup, which is per-project work.
- A standing model-suitability database.
- Signed releases or provenance for AP itself.
- Consumer propagation, which follows acceptance as a separate task.

## Rejected Alternatives

- Treating CWE, CVE, or dangerous-API signals as exploitability proof.
- Treating OWASP Top 10 coverage as security completeness proof.
- Mandatory full security audits for every slice.
- Mandatory CVSS scoring for internal findings.
- A second normative security protocol file.
- Importing external requirement catalogs into AP.
- Merging audit and correction authority for urgent findings.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../INFOSEC.md](../../INFOSEC.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../ARTIFACT_LIFECYCLE.md](../../ARTIFACT_LIFECYCLE.md)
- [0009-capability-aware-worker-routing-and-execution-gates.md](0009-capability-aware-worker-routing-and-execution-gates.md)
