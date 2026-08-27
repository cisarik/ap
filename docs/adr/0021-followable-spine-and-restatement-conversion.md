# ADR-0021: Followable Spine, Rule Detectability, and Restatement-to-Pointer Conversion

Status: Accepted

## Date

2026-08-27

## Context

At public AP tip `eb3507bd1753e337ca7db92bb2da6cf7ec133071` the live Markdown
corpus is about 11,800 lines. Participants silently triage because nearly every
live surface reads equally mandatory. Field evidence from the era-06 findings
ledger:

- No normative per-role minimum reading existed. README, INTEGRATION, and
  consumer managed blocks named files, never sections.
- One owned rule had about eight live homes. The planning-budget rule ("one
  initial cycle and at most one targeted revision") was restated across
  `AP.md`, `PROMPT_CONTRACTS.md`, both handbooks, FAQ, glossary, pattern P11,
  and historical ADR bodies.
- A written emoji-signaling aspiration was dropped with no consequence because
  it had no detection surface. That failure generalizes: structural obligations
  already have artifact-visible spellings, while repeated semantic obligations
  often have none.

A two-class detectability test would delete real behavioral safety rules. A
three-class design is required. A spine owned outside `AP.md` would become a
second semantic owner, which
[ADR-0013](0013-semantic-ownership-and-convergence.md) forbids.

## Decision

Keep [AP.md](../../AP.md) as the sole live semantic owner. Record six elements;
add no rule family, structural record, field, schema, command, validator, or
executable surface.

1. **Per-role minimum-reading spine.** Owned in `AP.md` under Semantic
   Authority as
   [Per-Role Minimum-Reading Spine](../../AP.md#per-role-minimum-reading-spine).
   One row each for COOPERATOR, ORCHESTRATOR, and WORKER names required `AP.md`
   anchors, required projections, and reference-on-demand surfaces. The spine
   is a floor, never a ceiling. Projections may point to it and never own it.
2. **Three detectability classes and a detection-surface requirement.** Owned
   in `AP.md` as
   [Rule Detectability Classes and Detection-Surface Requirement](../../AP.md#rule-detectability-classes-and-detection-surface-requirement).
   Classes: artifact-detectable; behavioral-normative (single owner, never
   restated); undetectable-and-unenforced (advisory, or not a rule). Every newly
   added or materially revised normative rule must name its detection surface
   and class. A rule with no detection surface is advisory, or it is not added.
3. **Restatement-to-pointer conversion (one-rule-one-home).** A paraphrase of a
   rule owned elsewhere becomes a pointer plus at most one orientation sentence
   naming the owner and when the rule applies. Conversion preserves modality,
   scope, and exception carve-outs. Structural echoes in `PROMPT_CONTRACTS.md`
   remain. Historical ADR bodies are not rewritten.
4. **`00_notes.md` AP-run convention.** Operational how lives in
   `AP_ORCHESTRATOR.md`; lifecycle classification lives in
   `ARTIFACT_LIFECYCLE.md`. The filename is a local AP-run convention, not a
   universal AP field, never a task-authority gate, and never a required
   universal artifact; its absence weakens no AP rule.
5. **§19 digest bullet.** `AP.md` §19 remains this file's in-file digest of
   rejected patterns (same owner, not a second surface) and gains one bullet:
   adding a normative rule without naming its detection surface. The existing
   emoji/presentation bullet stays as the motivating case.
6. **Adopted-and-testable criteria.** A consuming project has **adopted** a new
   AP version when its `.ap` gitlink moved to the exact new commit through the
   explicit `UPDATING.md` route, the managed block / `ap.project.conf` /
   project-local rules required no migration, and the Cooperator's selection is
   recorded in the consumer's own trace. The adoption is **testable** when the
   numbered field-test checks below are demonstrable from durable artifacts
   produced under that pin. Semantic ownership of consumer pin-update mechanics
   remains [RF-15](../../AP.md#rf-15-protocol-variants-and-stable-integration)
   and [RF-05](../../AP.md#rf-05-freshcurrent-routing-and-independent-acceptance);
   this ADR records the definition for downstream field tests and adds no new
   AP rule. FrameNest pin adoption remains a separate whole.

**FrameNest field-test script** (plain language; run after a separate
pin-adoption whole):

1. Open a fresh Orchestrator chat and paste the standard resume seed.
2. Ask: "What must you read before the first exchange in a new whole?"
   Expected: one short list matching the ORCHESTRATOR spine.
3. Confirm Continuation Bootstrap Stage 2 proposes exactly one bounded next
   whole and asks the Cooperator to select it.
4. After selection, confirm `00_notes.md` exists beside the handout with a
   dated entry recording the selected whole.
5. Issue one real Worker task; confirm the prompt names coordinates and
   required reading matching the WORKER spine.
6. Confirm the Worker report begins `### Report for ORCHESTRATOR_CHAT` and
   echoes the three prompt coordinates.
7. Confirm the notes file gained a dated Worker-claim-review entry.
8. Score PASS if checks 2, 3, 4, 6, and 7 hold; any failure is an
   upgrade-ledger candidate rather than anecdotal.

## Semantic Ownership and Projections

- `AP.md` owns the spine, the three classes, the detection-surface
  requirement, the restatement-to-pointer conversion rule, and the §19 digest
  convention.
- Conversions live in the owning projections (`PROMPT_CONTRACTS.md`,
  `AP_ORCHESTRATOR.md`, `AP_WORKER.md`, `FAQ.md`, `GLOSSARY.md`,
  `PROMPT_ENGINEERING_PATTERNS.md` P11, `README.md`, `INTUITION.md`).
- `AP_ORCHESTRATOR.md` and `ARTIFACT_LIFECYCLE.md` project the notes
  convention; neither owns universal AP meaning.
- This ADR carries Appendices A and B as historical audit records; they are
  not a second semantic owner.

## Compatibility

The decision is prospective. Historical prompts and pins interpret under their
original AP pins. Historical ADR bodies (including ADR-0011 and ADR-0013
planning-budget restatements) remain interpretable under their governing pins
and are not rewritten. No managed block, schema, executable `ap` behavior,
consumer repository, Meta path, or FrameNest path changes, and no mechanical
enforcement is claimed.

## Consequences

A fresh participant can answer "what must I read before exchange 01?" from one
owned table. New rules must name a detection surface or be advisory. Live
paraphrases of the inventoried owned rules become pointers. Class-2 behavioral
rules remain binding in their single owner. Documentation-first proportional
review applies; independent acceptance of this candidate, publication,
consumer adoption, and logical-whole closure remain separate.

## Relationship to Earlier Decisions

- ADR-0013: sole semantic ownership stays in `AP.md`; the spine is not a
  second owner.
- ADR-0015: documentation-first; no validator, suite, or mechanical
  restatement gate is added.
- ADR-0011: planning budget, freshness, and finite convergence remain owned
  where ADR-0011 placed them in `AP.md`; this ADR converts live restatements
  without changing that ownership.
- ADR-0017 / ADR-0018 / ADR-0019 / ADR-0020: extend existing families and
  projections rather than adding a twentieth family; this ADR follows that
  pattern.

## Rejected Alternatives

- **Spine outside `AP.md`** (README, INTEGRATION, or `INTUITION.md`): would
  create a second semantic owner.
- **New RF family (RF-20)** for spine or detectability: the Semantic Authority
  section is the natural home; a twentieth family adds surface to the burden
  this whole reduces.
- **Deleting behavioral-normative (class-2) rules**: conduct rules without
  artifact surfaces remain real safety.
- **Mechanical validators / test suite / CI** for detectability or restatement
  counting: forbidden by ADR-0015.
- **Managed-block migration or consumer-side change now**: FrameNest pin
  adoption is a separate downstream whole.
- **`INTUITION.md` growth past 200 lines or promotion to required reading**:
  pointer-status only; optional; the spine lives in `AP.md`.
- **Rewriting historical ADR-0011 / ADR-0013 restatement text**: historical
  artifacts remain interpretable under their governing pin (RF-19).
- **Semantic simplification (merge RF families)**: deferred until field
  evidence after this Followable Spine whole.

## Related Documents

- [../../AP.md](../../AP.md)
- [../../PROMPT_CONTRACTS.md](../../PROMPT_CONTRACTS.md)
- [../../AP_ORCHESTRATOR.md](../../AP_ORCHESTRATOR.md)
- [../../AP_WORKER.md](../../AP_WORKER.md)
- [../../ARTIFACT_LIFECYCLE.md](../../ARTIFACT_LIFECYCLE.md)
- [../../INTUITION.md](../../INTUITION.md)
- [0013-semantic-ownership-and-convergence.md](0013-semantic-ownership-and-convergence.md)
- [0015-monolithic-ap-test-suite-retirement.md](0015-monolithic-ap-test-suite-retirement.md)
- [0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md](0020-intuitive-mode-orchestrator-boundary-and-intuition-projection.md)

---

## Appendix A — Per-item detectability classification

**Method.** For each normative sentence (must / never / only / prohibited /
required semantics): if a protocol-named artifact would contain the evidence of
violation → class 1; else if a participant could observe the violation in
conduct and report it → class 2; else → class 3. Definitions, examples,
explanations, and already-declared advisory text are out of scope. `should` /
`may` is evidence toward advisory but never dispositive. Force-preservation:
before any class-3 demotion, first attempt a detection-surface promotion;
demotion is the fallback; never demote a safety-anchoring rule because
violation is hard to observe.

**Coverage route completed (this implementation):** `AP.md` preamble and
artifact relationships → spine and detectability subsections → owner map →
RF-01–RF-19 capsules → Finite Convergence Contract → §1–§19 in order →
`PROMPT_CONTRACTS.md` → `AP_ORCHESTRATOR.md`, `AP_WORKER.md`,
`ARTIFACT_LIFECYCLE.md`, `INTEGRATION.md`, `UPDATING.md` → `README.md`,
`FAQ.md`, `GLOSSARY.md` → `PROMPT_ENGINEERING_PATTERNS.md`, `INTUITION.md`,
`INFOSEC.md`. Historical ADR bodies were inspected as frozen and not
reclassified as live conversion targets.

**Per-surface summary counts** (normative items at section/family grain for
class 1/2; complete per-item for class 3):

| Surface | Class 1 | Class 2 | Class 3 | Notes |
|---|---|---|---|---|
| `AP.md` RF capsules RF-01–RF-19 | 16 | 3 | 0 | RF-01 informedness and RF-02 "must not substitute judgement" are class 2; remaining capsules predominantly class 1 |
| `AP.md` Finite Convergence | 5 | 0 | 0 | Planning Budget, Implementation Authority, Acceptance/Correction, Phase-Qualified Results, Closure Signal |
| `AP.md` §§1–19 | 14 | 4 | 1 | D-01 in §6; class-2 concentrated in §7 should-list, §13 restoration signaling, §16 checklist preparation |
| `PROMPT_CONTRACTS.md` | structural/class 1 | 0 | 0 | expected; field spellings are artifact-detectable |
| `AP_ORCHESTRATOR.md` / `AP_WORKER.md` | operational pointers | remaining class 2 only via owner links | 0 | after conversion, no independent restatement |
| `ARTIFACT_LIFECYCLE.md` / `INTEGRATION.md` / `UPDATING.md` | operational class 1 via RF-14/RF-15 owners | 0 | 0 | |
| `README.md` / `FAQ.md` / `GLOSSARY.md` / `INTUITION.md` | 0 independent | 0 independent | 0 | explanatory; owner links required |
| `PROMPT_ENGINEERING_PATTERNS.md` / `INFOSEC.md` | 0 | 0 | 0 | advisory by declaration |

### Class 1 table (section/family grain)

| ID | Surface and home | Detection surface | Notes |
|---|---|---|---|
| C1-01 | RF-19 coordinate echo | Worker report / issued prompt | Worked example: missing echo is visible in the report artifact |
| C1-02 | §9 `git add .` / force / silent recovery prohibition | Git history / diff | Worked example: violation visible in the repository artifact |
| C1-03 | RF-03 terminal-report expiry | report artifact; subsequent unauthorized mutation | |
| C1-04 | RF-04 / Planning Budget and Expiry | Planning Record fields; escalation disposition; report | |
| C1-05 | RF-05 fresh/current routing | prompt `Worker session target`; acceptance record | freshness ≠ independence is class 1 for the target field and class 2 for hidden parent-context inheritance unless reported |
| C1-06 | RF-06 dimension separation | prompt authority vs capability fields | |
| C1-07 | RF-07 evidence tiers | selected-ladder / risk fields in the prompt | |
| C1-08 | RF-08 budgets | Planning/Acceptance/Correction records | |
| C1-09 | RF-09 ledger states | declared ledger file or its declared absence | |
| C1-10 | RF-10 / RF-11 / RF-13 activated surfaces | activated annex records | |
| C1-11 | RF-12 recovery classes | recovery classification in the report | |
| C1-12 | RF-14 artifact metadata | committed artifact declarations | |
| C1-13 | RF-15 / RF-16 integration and declared routes | managed block / `ap.project.conf` / prompt Commands fields | |
| C1-14 | RF-17 closure and anti-stall | closure record; third equivalent PARTIAL/BLOCKED | |
| C1-15 | RF-18 untrusted-content stop | report stop / absence of followed embedded commands | |
| C1-16 | §5 omitted permission | prompt positive/negative authority vs performed action | |
| C1-17 | Closure Signal | Orchestrator closure record; Worker report `not-closed` | |
| C1-18 | Spine presence and detection-surface rule | `AP.md` itself | P1/P2 |
| C1-19 | Report header / phase-qualified results | Worker report | structural in `PROMPT_CONTRACTS.md` |
| C1-20 | §12 "must not claim success without evidence" | report vs required checks | |

### Class 2 table (section/family grain)

| ID | Surface and home | Why class 2 | Disposition |
|---|---|---|---|
| C2-01 | §7 "ask one strategic or security-sensitive question at a time" | Worked example: binding conduct; no defined artifact reveals violation | keep in single owner; never restate |
| C2-02 | RF-01 "the Cooperator remains meaningfully informed" | Worked example: no artifact proves informedness | keep in single owner |
| C2-03 | RF-02 "must not substitute its judgement for a material human decision" | observable in routing conduct; no dedicated artifact | keep |
| C2-04 | §7 remaining Orchestrator should-list (restate intent, inspect before shaping, classify brainstorming, …) | Cooperator-observable conduct | keep in §7 |
| C2-05 | §7 synthesis before a substantial prompt | prompt quality is observable; separateness of hidden synthesis is not a distinct artifact | keep |
| C2-06 | §13 "signal a restoration boundary before reliability visibly degrades" | signaling is observable conduct | keep; safety-adjacent; not demoted |
| C2-07 | §6 separate-preflight-should-normally-be-used | safety-adjacent; prompt/report chain can show skip, but "normally" is conduct judgement | keep; force-preservation |
| C2-08 | Plan-to-Execution "substantial unrelated slice should normally use a fresh Worker" | routing heuristic with "normally"; RF-05 already requires fresh for an unrelated whole | keep as in-file digest; not demoted |

### Class 3 dispositions (complete per-item)

```text
ID: D-01
Surface and section: AP.md §6 Adaptive Orchestration Lifecycle (reasoning-profile paragraph)
Rule excerpt (≤25 words): "Reasoning should be chosen separately for preflight, implementation, diagnostic closeout, and independent audit."
Current class: 3
Disposition: demote-to-advisory
Reason: the separateness of the choice is not visible in any artifact (identical profiles may be independently correct) and is not conduct-binding safety.
Exact edit: prefixed "Advisory:" and stated it is recommended practice with no detection surface, not a binding rule.
Promotion attempt: naming a new prompt field for "reasoning re-chosen" would add a PROMPT_CONTRACTS field, which this whole prohibits. Demotion is the fallback. Not safety-anchoring.
```

No other class-3 item survived the coverage pass as a live binding rule.
Already-declared advisory text (pattern library, `INFOSEC.md`, `INTUITION.md`
quick-rules, `should` used inside disclaimers such as "ordinary software should
be developed without tests") is out of scope. The era-05 emoji aspiration is
the method's origin, not a pending disposition: verified absent as a universal
rule; only non-universal declarative statements remain.

**Worked-example reproduction**

| Class | Example | Result |
|---|---|---|
| 1 | RF-19 coordinate echo | still class 1; owner RF-19 / report contract |
| 1 | §9 `git add .` | still class 1; unchanged |
| 2 | §7 one-question-at-a-time | still class 2; unchanged in owner |
| 2 | RF-01 informedness | still class 2; unchanged in owner |
| 3 | §6 reasoning chosen separately | D-01 demote-to-advisory |

---

## Appendix B — Old-surface → single-owner conversion map

Each row: converted live surface → owner anchor → modality/scope/carve-out
comparison → reviewer check. Historical ADR-0011 and ADR-0013 restatements are
**not** converted (frozen under their pins). Structural field blocks in
`PROMPT_CONTRACTS.md` are **not** converted.

| # | Converted surface | Owner | Modality / scope / carve-out | Check |
|---|---|---|---|---|
| 1 | `PROMPT_CONTRACTS.md` Plan-to-Execution prose after the field block | [Planning Budget and Expiry](../../AP.md#planning-budget-and-expiry) | one initial; at most one targeted revision; changed-objective supersession; `allowed`+`current-worker-session` kept as structural pairing | pointer + orientation; field block kept |
| 2 | `PROMPT_CONTRACTS.md` planning-authority expiry / second-automatic-revision prose | same | expiry at terminal report/cancel/supersession; no second automatic revision; escalation spelling kept structural | pointer + structural escalation sentence |
| 3 | `PROMPT_CONTRACTS.md` Worker `not-closed` paraphrase | [Closure Signal](../../AP.md#closure-signal) | Worker never emits project signal; field value `not-closed` kept | field kept; paraphrase → owner |
| 4 | `PROMPT_CONTRACTS.md` "Omitted permission is not implied." | [§5 Task Authority](../../AP.md#5-task-authority) | owner modality "not implied permission" restored | drift corrected to owner wording + pointer |
| 5 | `PROMPT_CONTRACTS.md` "Freshness alone never establishes independence." | [RF-05](../../AP.md#rf-05-freshcurrent-routing-and-independent-acceptance) | freshness necessary ≠ sufficient | paraphrase → owner pointer; current-session preference kept |
| 6 | `PROMPT_CONTRACTS.md` emoji/non-universal-fields sentence | [§19](../../AP.md#19-anti-patterns) | never required AP fields | pointer-polish |
| 7 | `AP_ORCHESTRATOR.md` Decision Table Planning row | Planning Budget and Expiry | one-cycle default when repository-grounded uncertainty remains; stop on second automatic revision | row cites owner |
| 8 | `AP_ORCHESTRATOR.md` Finite Convergence two planning rows | Planning Budget and Expiry | one targeted revision; `NEEDS_ORCHESTRATOR_DECISION`; no second automatic revision (force in owner) | pointer-style transitions |
| 9 | `AP_ORCHESTRATOR.md` planner-artifact repair restatement | Planning Budget and Expiry + structural repair shape | prospective; no second cycle; no implementation | trimmed to owner + structural pointer |
| 10 | `AP_ORCHESTRATOR.md` "Default to one initial planning cycle…" | Planning Budget and Expiry | three targeted-revision bases named in orientation | carve-outs preserved by naming |
| 11 | `AP_ORCHESTRATOR.md` Plan-to-Execution follow-on + dangling "route above" | Plan-to-Execution Gate + Planning Budget repair | expiry; separate `not-used` prompt; Plan UI never completes the gate | dangling reference repaired to owner |
| 12 | `AP_ORCHESTRATOR.md` stop-list second automatic planning revision | Planning Budget and Expiry | stop when proposed | pointer |
| 13 | `AP_ORCHESTRATOR.md` fresh-session triggers + "does not itself prove independence" | RF-05 + Implementation Authority | necessary but not sufficient; implementer-disqualification in owner | additional seed hit converted |
| 14 | `AP_ORCHESTRATOR.md` "Omitted permission is not permission." | §5 Task Authority | owner "not implied permission" | drift corrected + pointer |
| 15 | `AP_WORKER.md` planning-budget paragraph | Planning Budget and Expiry | one-cycle; three bases; changed-objective | Plan UI sentences kept with following owner pointer |
| 16 | `AP_WORKER.md` "Freshness alone does not prove independence." | RF-05 | necessary ≠ sufficient | pointer |
| 17 | `AP_WORKER.md` "A new ordinal alone never proves independence." | RF-05 | ordinal-specific scope kept | pointer-polish of related sentence |
| 18 | `AP_WORKER.md` closure-signal paragraph | Closure Signal | never emit; report `not-closed` | orientation + owner |
| 19 | `AP_WORKER.md` stop-list second automatic revision/correction | Planning Budget; Acceptance, Correction, and Escalation | both loops named | pointers |
| 20 | `FAQ.md` planning/execution answer | Planning Budget; Implementation Authority; Plan-to-Execution | three bases; Plan UI grants nothing | re-anchored |
| 21 | `FAQ.md` freshness answer | RF-05 | verifier must not have implemented the candidate named in orientation | carve-out preserved by naming |
| 22 | `GLOSSARY.md` Fresh Worker Session | RF-05 | freshness ≠ independence | orientation + link |
| 23 | `GLOSSARY.md` Worker session target independence clause | RF-05 | target is not proof of independence | additional seed hit; pointer |
| 24 | `GLOSSARY.md` Planning Budget row | Planning Budget and Expiry | one initial + at most one qualifying targeted revision | orientation + link |
| 25 | `PROMPT_ENGINEERING_PATTERNS.md` P11 "no second automatic revision" | Planning Budget and Expiry | no second automatic revision | owner citation; template values kept |

**Non-conversion additions (not Appendix B conversion rows):** handbook and
`INTUITION.md` spine pointers; `README.md` spine row; `00_notes.md` convention
section and lifecycle row. **Not converted (frozen):** ADR-0011:54–58,
ADR-0013:28–31, CHANGELOG history, ADR index paraphrases.

**Appendix B row count:** 25 conversion rows. Live converted surfaces named in
the accepted plan (PROMPT_CONTRACTS planning and freshness and closure and
omitted-permission; both handbooks; FAQ; GLOSSARY; P11) are present. Additional
seed-re-run conversions: rows 13, 17, 23, and the Plan-to-Execution dangling
repair (row 11). Ambiguous items for Orchestrator disposition: none converted
silently; GLOSSARY Planning Budget retains a one-line orientation beside its
owner link because a glossary row that is only a link would cease to define the
term.
