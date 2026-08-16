# ADR-0018: Consumer-Declared Execution Route and Capability-Gate Binding

Status: Implementation candidate

## Date

2026-08-16

## Context

ADR-0012 gave a consuming project a baseline-declared, sanitized direct
execution route through `ap.project.conf`, and ADR-0009 separated capability,
permission, containment, and authority. Field use of a portable Common Worker
Task Fields prompt then exposed a failure those decisions did not prevent: a
task had an applicable, usable consumer-declared execution route, yet the
authoritative Worker prompt presented an equivalent-looking ambient route — a
copied raw command reconstructed from ambient session state — as a parallel
alternative. The ambient route failed for environment-contamination reasons
the declared sanitized route exists to prevent, and remediation drifted toward
reconstructing or repairing the environment instead of using the declared
route.

Current AP text required repository and capability gates, declared tooling by
reference, and failure classification, but did not state that an applicable
declared route must be resolved before prompt issuance, made canonical inside
the prompt, or protected from a silent ambient parallel route. Listing project
files as required reading proved insufficient to produce the binding.

## Decision

Keep [AP.md](../../AP.md) as the sole live semantic owner. Extend the existing
RF-06 and RF-16 families with a bounded semantic clarification; add no rule
family, structural record, field, schema, command, validator, or executable
surface.

- **Consumer ownership.** A consuming project owns its exact operations and
  command values, environment and tooling policy, project-owned capability
  gates, local capability values, and credentials and privilege mechanics. AP
  remains provider-, project-, language-, runtime-, shell-, IDE-, host-, and
  credential-neutral.
- **Applicability and no-route compatibility.** The binding applies when the
  current task has an applicable and usable consumer-declared route: a
  baseline-declared `ap.project.conf` operation or a project-owned capability
  gate named in the project's governing rules. Not every project declares
  either surface; absence remains valid, and the fallback is exact
  project-owned guidance inside the prompt, never an AP-invented toolchain.
- **Canonical prompt binding.** Before issuing a consequential Worker prompt,
  the Orchestrator resolves the governing AP baseline, the consumer's governing
  project rules, any declared route applicable to the task, and its usability
  in the intended Worker boundary. When a usable applicable route exists, the
  prompt names or activates it as the canonical execution or capability path.
  Listing project files as required reading alone is not that binding.
- **Contradiction and deviation.** The prompt must not silently present a
  copied raw interpreter, shell, SSH, ambient-session reconstruction, or
  equivalent-looking command as a parallel alternative to an applicable
  declared route. An alternate route is lawful only through explicit
  task-specific prompt authority naming the declared route that could not be
  used, the exact alternate path, rationale, evidence class, bounded authority,
  and stopping condition. A deviation never becomes a second standing canonical
  route by accident.
- **Ambient-state boundary.** An IDE, integrated terminal, login shell,
  inherited environment variable, retained socket, open editor, or previous
  Worker session is convenience state under RF-06 — not authority, durable
  configuration, or a capability guaranteed in another process boundary.
  Capability, credentials, technical reachability, privilege, containment,
  task authority, and evidence remain distinct.
- **Failure classification.** When an ambient route fails and an applicable
  declared sanitized route exists, the ambient failure is classified before
  remediation, one focused reproduction through the declared route is
  preferred, the environment is not reconstructed, repaired, replaced, or
  weakened without explicit authority, and work stops when the declared route
  is unusable and no bounded deviation is authorized.

The implementation is documentation and projection only. `ap project check`
and `ap exec` enforce their declared project-operation boundary only when
used; executable `ap` does not construct or validate Worker prompts. This
decision strengthens normative, operational, structural-purpose, advisory, and
historical documentation; it adds no mechanical prompt validation.

## Semantic Ownership and Projections

- `AP.md` alone owns the RF-06 ambient-state boundary and the RF-16
  route-resolution, canonical-binding, contradiction, deviation, no-route,
  and failure-classification semantics.
- `PROMPT_CONTRACTS.md` clarifies the structural purpose of the existing
  `Commands`, `Positive authority`, and `Negative authority` fields; it adds
  no field or record.
- `AP_ORCHESTRATOR.md` and `AP_WORKER.md` are operational projections of
  pre-issuance route resolution, contradiction stopping, and ambient-failure
  classification.
- `PROMPT_ENGINEERING_PATTERNS.md` extends advisory P08 with route-binding
  adaptation questions, template lines, and one generic negative fixture.
- This ADR and `CHANGELOG.md` are historical projections.

## Compatibility

The decision is prospective. Existing consumer pins retain their original
meaning, historical Worker prompts remain interpreted under their original AP
pin, and a newer public AP revision does not govern an older consumer
retroactively. Consumer ledger reconciliation and AP-pin adoption remain
separate tasks. No migration, managed-block change, schema change, executable
change, or consumer repository change is required.

## Consequences

An Orchestrator can no longer issue an authoritative Worker prompt that
silently bypasses an applicable declared route with an equivalent-looking
ambient route, and a Worker has an explicit stop condition when it receives
one. Ambient failures gain a classification route that prefers the declared
sanitized route over environment reconstruction. Projects without a declared
route are unaffected.

The binding is normative and operational, not mechanical: nothing parses or
validates prompt wording. Proportionate documentation review under ADR-0015
applies. Independent acceptance of this candidate, publication, consumer
adoption, and logical-whole closure remain separate.

## Relationship to Earlier Decisions

- ADR-0009: this decision extends its capability/permission/containment/
  authority separation with the ambient-state boundary; it changes none of
  its routing or gate decisions.
- ADR-0012: this decision binds prompts to the declared operations ADR-0012
  defined; it does not change the closed schema, sanitized execution, or
  readiness boundary, and readiness still never grants task authority.
- ADR-0013: this decision follows the semantic-owner registry; the invariant
  lives only in RF-06/RF-16 with deliberate projections.
- ADR-0015: this decision is documentation-first protocol evolution; no
  conformance suite, validator, or test mechanism is added.
- ADR-0017: this decision reuses its compact-grant and by-reference
  disciplines; declared-route binding is the missing execution-route half of
  that work.

## Rejected Alternatives

- **No AP change**: rejected; field evidence showed a declared route silently
  bypassed by an ambient parallel route that current text did not prohibit.
- **A new structural record or field**: rejected; existing Common Worker Task
  Fields (`Commands`, `Positive authority`, `Negative authority`, mandatory
  reading, task-specific instructions) are sufficient once their purpose is
  clarified.
- **An executable prompt parser or validator**: rejected; prompt wording is
  not mechanically enforceable, and executable `ap` does not construct or
  validate Worker prompts.
- **Schema or command expansion**: rejected; schema v1 stays closed and no
  universal command is added.
- **Consumer-specific universal policy**: rejected; AP stays neutral and
  encodes no project-, vendor-, language-, or host-specific values.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../PROMPT_ENGINEERING_PATTERNS.md](../../PROMPT_ENGINEERING_PATTERNS.md)
- [0009-capability-aware-worker-routing-and-execution-gates.md](0009-capability-aware-worker-routing-and-execution-gates.md)
- [0012-baseline-bound-project-execution.md](0012-baseline-bound-project-execution.md)
- [0013-semantic-ownership-and-convergence.md](0013-semantic-ownership-and-convergence.md)
- [0015-monolithic-ap-test-suite-retirement.md](0015-monolithic-ap-test-suite-retirement.md)
- [0017-cooperator-ergonomics-cost-proportional-execution.md](0017-cooperator-ergonomics-cost-proportional-execution.md)
