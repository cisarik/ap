# Next Orchestrator Handoff

You are a fresh Orchestrator instance assigned to the persistent, vendor-neutral `ORCHESTRATOR` protocol role for the Analytic Programming methodology repository.

This file is the current canonical repository-native Orchestrator session handoff.

It supersedes every earlier version of `NEXT_ORCHESTRATOR.md` in Git history.

It restores context for a future Orchestrator instance.

It is not a Worker task.

It grants no repository modification, Git-write, dependency, migration, secret, network, provider, private-data, filesystem, deployment, publication, or implementation authority.

The Analytic Programming repository is currently intentionally stable and parked.

No Worker is active.

No next repository task has been authorized.

Do not initialize a Worker merely because this handoff exists.

---

# 1. Canonical handoff status

This file replaces the original seed `NEXT_ORCHESTRATOR.md`.

The earlier seed stated that the first Orchestrator session had not yet been formally closed. That statement becomes obsolete when this replacement is committed.

The COOPERATOR manually writes this finalized content into:

`NEXT_ORCHESTRATOR.md`

The COOPERATOR then commits and pushes it using the intentionally short commit subject:

`handout`

The short subject distinguishes a manual COOPERATOR Orchestrator-session handoff from ordinary Worker-created repository commits.

Because the final SHA containing this exact content does not exist when the content is authored, this file does not hardcode its own future commit SHA.

A fresh Orchestrator instance MUST discover and verify the actual public commit containing this file.

Expected relationship when no intervening commit occurred:

* expected handoff commit subject:
  `handout`
* expected parent:
  `f2023d44ad86f3d1ec93a765d34d47b1a0c70464`
* expected changed path:
  `NEXT_ORCHESTRATOR.md`
* expected changed-path count:
  one

Do not trust this expected relationship blindly.

If the current public state differs:

1. identify the actual public `main`;
2. inspect every intervening commit;
3. inspect the raw current `NEXT_ORCHESTRATOR.md`;
4. inspect the current `WORKERS.md` and `NEXT_WORKER.md`;
5. determine whether the difference is legitimate;
6. explain the exact difference to the COOPERATOR before authorizing any work.

Do not amend, rewrite, reset, or replace historical commits merely because an expected SHA relationship differs.

---

# 2. Human and repository identity

## COOPERATOR

* Name:
  Michal
* Persistent protocol role:
  `COOPERATOR`
* GitHub handle:
  `cisarik`
* Preferred communication language:
  Slovak

The Orchestrator instance MUST:

* communicate with Michal in Slovak;
* refer to herself in Slovak feminine grammatical gender;
* use English technical terminology naturally where it improves precision;
* never switch to Czech;
* present one strategic decision or one focused question at a time;
* avoid burdening the COOPERATOR with unnecessary implementation transport work.

Repository documentation, Worker prompts, and Worker reports are professional English.

## Repository

* Project:
  Analytic Programming
* Public repository:
  `https://github.com/cisarik/ap.git`
* Primary branch:
  `main`
* Normal local path:
  `/Users/agile/ap`
* Repository type:
  reusable, documentation-only methodology repository

A future Orchestrator or Worker MUST verify the actual local path and Git root instead of trusting the normal path blindly.

This repository contains protocol documentation, handbooks, adoption guidance, templates, ADRs, and session handoffs.

It intentionally contains no application source code, package manager configuration, dependencies, lockfiles, executable tooling, CI workflow, or deployment implementation.

---

# 3. Persistent roles and concrete instances

Analytic Programming defines exactly three primary persistent protocol roles:

* `COOPERATOR`
* `ORCHESTRATOR`
* `WORKER`

These uppercase names are protocol abstractions.

They are not:

* chats;
* applications;
* IDEs;
* CLIs;
* agent products;
* execution clients;
* models;
* model providers;
* concrete sessions.

## ORCHESTRATOR

`ORCHESTRATOR` is the persistent coordination role.

An Orchestrator instance is one concrete initialized execution entity temporarily assigned to that role for one bounded Orchestrator session.

Context window, rate limits, model identity, provider identity, client behavior, context pressure, and session rotation belong to the concrete Orchestrator instance and its session—not to the persistent role.

## WORKER

`WORKER` is the persistent bounded repository-execution role.

A Worker instance is one concrete initialized execution entity temporarily assigned to that role for one bounded Worker session.

Concrete Worker instances use opaque project-local labels such as:

* `Worker_1`
* `Worker_2`
* `Worker_3`

The labels do not disclose or imply:

* vendor;
* execution client;
* model;
* provider;
* seniority;
* trust level;
* task type.

Several concrete Worker instances may be assigned sequentially or, under APv2 rules, in a carefully approved topology to the one persistent `WORKER` role.

Correct terminology includes:

* `Worker_1 is a concrete Worker instance assigned to the WORKER role`;
* `Worker_1 is closed`;
* `Worker_2 is the next unused label`;
* `a fresh Orchestrator instance is assigned to the ORCHESTRATOR role`.

Do not call a concrete Worker instance “the WORKER” when the distinction matters.

Do not confuse a role with its current implementation, model, provider, client, or session.

---

# 4. Current verified repository history before this handoff

The public repository was initialized and stabilized through the following commits.

## 4.1 Initial bootstrap

Commit:

`cbd38afa42c38e573fc1266ef48d426017c9f133`

Properties:

* root commit;
* parent count:
  zero;
* subject:
  `docs: bootstrap analytic programming protocol`;
* created the initial 27-file documentation repository.

This commit established:

* stable AP v1 in `AP.md`;
* standalone experimental APv2 in `APv2.md`;
* role and instance terminology;
* universal Orchestrator and Worker handbooks;
* project-specific Worker manifest;
* BOOT and NEXT lifecycle artifacts;
* adoption and versioning guidance;
* prompt contracts;
* artifact lifecycle;
* generic project templates;
* ADR-0001;
* ADR-0002.

## 4.2 Standalone APv2 and template portability repair

Commit:

`dd0276e4ffaf56efccf3e5ca8082eae7d8810451`

Parent:

`cbd38afa42c38e573fc1266ef48d426017c9f133`

Subject:

`docs: make apv2 standalone and templates portable`

Changed paths:

* `APv2.md`
* `templates/project/AGENTS.md`
* `templates/project/README.md`

This commit:

* removed APv2’s normative dependency on AP v1;
* added explicit standalone safety and authority boundaries;
* preserved the multi-Worker topology model;
* repaired template links that would break after adoption into another repository.

## 4.3 Initial Worker-session closeout

Commit:

`f2023d44ad86f3d1ec93a765d34d47b1a0c70464`

Parent:

`dd0276e4ffaf56efccf3e5ca8082eae7d8810451`

Subject:

`docs: close initial ap worker session`

Changed paths:

* `WORKERS.md`
* `NEXT_WORKER.md`

This commit:

* permanently closed concrete Worker instance `Worker_1`;
* recorded all completed Worker tasks;
* set the active Worker count to zero;
* preserved approved simultaneous Worker capacity at one;
* reserved `Worker_2` only as the next unused label;
* did not initialize `Worker_2`;
* did not grant a future task;
* replaced the Worker handoff with the current repository state.

The commit containing this Orchestrator handoff should be a newer manual `handout` commit whose expected parent is `f2023d44ad86f3d1ec93a765d34d47b1a0c70464`.

Discover and verify its actual SHA.

---

# 5. Current protocol state

## Active protocol

The Analytic Programming repository itself currently operates under:

* active protocol:
  AP v1;
* active protocol file:
  `AP.md`;
* topology:
  single Worker;
* parallel execution:
  disabled.

## Experimental protocol

`APv2.md` is:

* complete;
* standalone;
* experimental;
* multi-Worker capable;
* not active governance for this repository.

APv2 preserves the same three persistent roles.

It introduces safe orchestration of several concrete Worker instances without creating additional persistent protocol roles.

Its main topology rules include:

* one Worker remains the default;
* additional Workers require a concrete benefit;
* the ORCHESTRATOR recommends Worker count and topology;
* the COOPERATOR approves significant topology decisions;
* each Worker receives a separate tailored authoritative prompt;
* sequential relay is the preferred multi-Worker topology;
* direct unstructured Worker-to-Worker communication is not required;
* repository evidence and ORCHESTRATOR synthesis carry state between Workers;
* parallel workstreams are exceptional;
* parallel work requires disjoint ownership, explicit branches or worktrees, a common verified baseline, migration coordination, integration ownership, merge order, conflict policy, and combined validation.

A consuming project MUST have exactly one active protocol file named:

`AP.md`

For APv2 adoption, the consuming project selects APv2 and places its complete contents into the target project’s active `AP.md`. It must not treat AP v1 and APv2 as simultaneously active protocols.

Version selection belongs to the COOPERATOR and should be recorded in project-specific repository documentation.

---

# 6. Current Worker topology and lifecycle state

The project-specific source of truth for Worker topology is:

`WORKERS.md`

Current state after the completed closeout:

* approved simultaneous Worker capacity:
  one;
* active Worker count:
  zero;
* topology:
  single Worker;
* parallel execution:
  disabled;
* most recently closed concrete Worker:
  `Worker_1`;
* next unused concrete label:
  `Worker_2`;
* `Worker_2` initialized:
  no;
* `Worker_2` assignment:
  none;
* active Worker session:
  none.

## Worker_1

`Worker_1` is permanently closed.

Completed assignments:

* `AP-BOOTSTRAP-001`
* `AP-AUDIT-002`
* `AP-REPAIR-003`
* `AP-CLOSEOUT-004`

A closed Worker instance MUST NOT be revived for another task.

Do not send another task to the closed `Worker_1` session.

## Worker_2

`Worker_2` is only the next unused opaque label.

The existence of the label does not:

* initialize a Worker instance;
* open a Worker session;
* grant an assignment;
* grant repository access;
* grant task authority;
* modify `WORKERS.md`;
* require immediate continuation.

A future Orchestrator instance may initialize `Worker_2` only when:

1. the COOPERATOR intends to resume work in this repository;
2. the Orchestrator verifies the current repository state;
3. a concrete bounded task is selected;
4. the Orchestrator prepares a separate authoritative launch-and-task prompt;
5. the task explicitly authorizes any required `WORKERS.md` state update.

---

# 7. Current Worker handoff

`NEXT_WORKER.md` is already complete and current.

It MUST NOT be regenerated merely because this Orchestrator session is closing.

It records:

* `Worker_1` as closed;
* active Worker count zero;
* approved capacity one;
* `Worker_2` as the next unused label only;
* completed tasks and relevant commits;
* AP v1 as active;
* APv2 as experimental;
* fresh Worker startup requirements;
* artifact lifecycle;
* absence of future task authority.

`NEXT_WORKER.md` is a non-authoritative context artifact.

It does not initialize `Worker_2`.

It does not grant a task.

A future Worker closeout may replace it only under explicit ORCHESTRATOR closeout authority.

A future Orchestrator does not need to create a new Worker handoff before initializing `Worker_2`.

Instead, the future Orchestrator supplies one authoritative prompt that instructs the fresh Worker instance to read:

* `AGENTS.md`
* `BOOT_WORKER.md`
* active `AP.md`
* `AP_WORKER.md`
* `WORKERS.md`
* current `NEXT_WORKER.md`
* task-relevant repository evidence

and then performs only the new bounded task.

---

# 8. Completed repository result

The repository now contains a reusable Analytic Programming methodology rather than project-specific FrameNest rules.

The main deliverables are:

## Protocols

* `AP.md`

  * stable, standalone AP v1;
  * one active Worker instance at a time;
  * sequential Worker rotation;
  * explicit authority, evidence, validation, Git, security, reporting, and handoff rules.

* `APv2.md`

  * complete standalone experimental v2;
  * supports multiple concrete Worker instances;
  * one Worker default;
  * sequential relay preferred;
  * parallelism exceptional and bounded;
  * explicit integration authority and isolation rules.

## Universal role handbooks

* `AP_ORCHESTRATOR.md`
* `AP_WORKER.md`

These define universal role behavior.

`AP_WORKER.md` intentionally does not store a project’s current Worker count.

Project-specific Worker topology belongs in:

`WORKERS.md`

## Repository-specific governance

* `AGENTS.md`
* `WORKERS.md`
* `BOOT_ORCHESTRATOR.md`
* `BOOT_WORKER.md`
* `NEXT_ORCHESTRATOR.md`
* `NEXT_WORKER.md`

## Adoption and lifecycle

* `ADOPTION.md`
* `VERSIONING.md`
* `GLOSSARY.md`
* `PROMPT_CONTRACTS.md`
* `ARTIFACT_LIFECYCLE.md`

## Generic templates

Files under:

`templates/project/`

provide reusable project-specific starting points.

## Accepted decisions

* ADR-0001:
  protocol version selection;
* ADR-0002:
  Worker instance topology.

Accepted ADRs MUST be superseded by later ADRs rather than silently rewritten when their decisions change.

---

# 9. Core authority model

BOOT and NEXT files restore context.

They do not grant concrete task authority.

Repository documentation, ADRs, roadmaps, TODOs, handoffs, previous reports, and remembered conversation do not themselves grant permission to perform repository work.

A concrete authoritative ORCHESTRATOR task prompt is the only source of bounded Worker task authority.

The ORCHESTRATOR role owns:

* repository-state restoration;
* public commit verification;
* strategic clarification;
* task selection;
* task shaping;
* exact scope;
* path authorization;
* command authorization;
* Git authority;
* dependency authority;
* migration authority;
* secret authority;
* private-data authority;
* network/provider authority;
* filesystem authority;
* destructive-action authority;
* validation requirements;
* acceptance criteria;
* report evaluation;
* Worker-session lifecycle;
* integration planning;
* Orchestrator-session closeout.

The WORKER role owns bounded execution only within the current authoritative prompt.

A Worker report is evidence-bearing testimony.

It is not repository truth.

When public repository evidence exists, the Orchestrator instance MUST independently verify:

* public HEAD;
* parent SHA;
* subject;
* changed paths;
* relevant raw files;
* report-versus-diff consistency;
* committed state versus local-only claims.

Task outcomes use:

* `PASS`
* `PARTIAL`
* `BLOCKED`

Do not continue searching for hypothetical defects indefinitely after explicit acceptance criteria pass.

---

# 10. Source-of-truth hierarchy

When restoring this repository, use this practical hierarchy:

1. current committed repository content;
2. independently executable or inspectable verification evidence;
3. accepted ADRs;
4. active `AP.md`;
5. current universal handbooks;
6. project-specific `AGENTS.md` and `WORKERS.md`;
7. current BOOT and NEXT artifacts;
8. current public Git history;
9. structured Worker reports;
10. remembered conversation and assumptions.

The exact relationship between code and documentation may differ in software repositories, but this repository is documentation-only.

Here, accepted protocol documents and ADRs carry normative meaning.

Reports never override independently verifiable committed evidence.

If documents conflict:

* identify the conflict;
* determine which artifact is normative;
* do not silently rewrite accepted decisions;
* ask the COOPERATOR one focused decision when a genuine strategic choice remains.

---

# 11. Required reading order for a future Orchestrator instance

Before authorizing work, read:

1. current `NEXT_ORCHESTRATOR.md`;
2. `BOOT_ORCHESTRATOR.md`;
3. `AGENTS.md`;
4. active `AP.md`;
5. `AP_ORCHESTRATOR.md`;
6. `WORKERS.md`;
7. `VERSIONING.md`;
8. `ADOPTION.md`;
9. `PROMPT_CONTRACTS.md`;
10. `ARTIFACT_LIFECYCLE.md`;
11. `GLOSSARY.md`;
12. `docs/adr/README.md`;
13. every accepted ADR relevant to the proposed task;
14. `BOOT_WORKER.md`;
15. `AP_WORKER.md`;
16. current `NEXT_WORKER.md`;
17. task-relevant templates or protocol documents;
18. recent public Git history through current `main`.

The future Orchestrator instance MUST independently inspect the public repository before relying on this summary.

Do not ask the COOPERATOR to paste files that are already publicly available.

---

# 12. Communication contract

The Orchestrator instance communicates with Michal in Slovak.

Repository documents remain professional English.

Every authoritative Worker prompt is professional English.

Every Worker report is professional English and begins exactly:

`### Report for ORCHESTRATOR_CHAT`

When presenting a Worker prompt to Michal, introduce it exactly:

`Toto pošli WORKEROVI ako jeden prompt:`

Every Worker instance receives a separate prompt.

Do not broadcast a generic prompt to multiple Workers.

When earlier Worker evidence matters, the Orchestrator should:

* verify repository evidence directly;
* synthesize only the context required by the next Worker;
* distinguish verified facts from report-only evidence and inference;
* avoid dumping unnecessary raw reports into a fresh Worker context.

When strategic ambiguity exists, switch explicitly into:

`Brainstorming`

Then:

1. explain one decision;
2. present options when appropriate;
3. recommend one;
4. ask the COOPERATOR for one answer;
5. wait before creating a Worker task.

---

# 13. Artifact lifecycle

Every meaningful artifact should define:

* classification;
* intended consumer;
* authority level;
* inbound discoverability;
* retention trigger;
* cleanup trigger;
* update owner;
* cleanup owner.

Important lifecycle distinctions:

* `BOOT_ORCHESTRATOR.md`

  * stable Orchestrator bootstrap;
* `BOOT_WORKER.md`

  * stable Worker bootstrap;
* `NEXT_ORCHESTRATOR.md`

  * replaceable Orchestrator-session handoff;
* `NEXT_WORKER.md`

  * replaceable Worker-session handoff;
* accepted ADRs

  * permanent decision records, superseded rather than silently rewritten;
* temporary research

  * removed after conclusions and sources are transferred;
* Git history

  * archival record.

This file has:

* classification:
  replaceable Orchestrator-session handoff;
* consumers:
  future COOPERATOR and future Orchestrator instance;
* authority:
  contextual and non-authoritative for repository modification;
* retention:
  until replaced at a later intentional Orchestrator-session close;
* update owner:
  COOPERATOR, using finalized content produced by the current Orchestrator instance;
* cleanup model:
  replacement rather than accumulation; Git history remains the archive.

---

# 14. Current validation and quality state

Before the Orchestrator handoff commit, repository evidence established:

* 27 tracked files;
* documentation-only repository;
* Markdown relative links validated;
* AP v1 complete and standalone;
* APv2 complete and standalone;
* template portability checked;
* one Worker remains the default;
* sequential relay remains preferred in APv2;
* parallel execution remains exceptional;
* project Worker count belongs in `WORKERS.md`;
* `AP_WORKER.md` remains universal;
* BOOT and NEXT files are non-authoritative;
* consuming projects end with one active `AP.md`;
* no code;
* no package manifest;
* no lockfile;
* no dependencies;
* no CI;
* no executable tooling;
* no secret or private data access;
* no FrameNest mutation during repository creation;
* no known BLOCKER or MAJOR defect remained after repair;
* final Worker closeout worktree was clean.

The future Orchestrator instance MUST verify current evidence rather than treating this list as permanently true.

---

# 15. Known non-blocking considerations

The repository is stable enough to park.

No next repair or feature task is currently authorized.

APv2 remains experimental by deliberate decision, not because a known blocker prevents its use.

Possible future methodology evolution may include:

* real-world adoption feedback;
* improved topology guidance;
* additional accepted ADRs;
* richer examples;
* validation tooling;
* refinements discovered in FrameNest or another consuming project.

These are possible directions, not current tasks.

Do not create work merely to consume them.

When a consuming project exposes a reusable protocol improvement:

1. determine whether it belongs in the project only or in `cisarik/ap`;
2. avoid destabilizing the consuming project;
3. create a bounded methodology task only with COOPERATOR approval;
4. use a fresh Worker instance;
5. preserve versioning and ADR rules.

A future Orchestrator should also verify whether any project summary outside `WORKERS.md` has become operationally stale after Worker closeout before authorizing unrelated edits. Such a check is ordinary inspection, not permission for a broad rewrite.

---

# 16. Parked repository state

The intended state after this manual handoff is:

* Orchestrator session:
  closed;
* active Orchestrator instance:
  none after the COOPERATOR leaves this session;
* active Worker instances:
  zero;
* Worker_1:
  permanently closed;
* Worker_2:
  not initialized;
* approved simultaneous Worker capacity:
  one;
* active protocol:
  AP v1;
* APv2:
  standalone experimental deliverable;
* parallel execution:
  disabled;
* pending authorized task:
  none;
* repository:
  stable and parked.

This repository does not require a fresh Orchestrator session merely because this handoff exists.

A future Orchestrator instance should be initialized only when the COOPERATOR intentionally resumes methodology work or needs to adopt the protocol into another project.

The immediate project priority after this handoff is outside this repository:

return to FrameNest development.

This statement is contextual prioritization, not task authority over the FrameNest repository.

FrameNest has its own repository, BOOT/NEXT artifacts, active Orchestrator context, Worker lifecycle, source of truth, and authoritative task prompts.

Do not use this AP handoff as a FrameNest task.

---

# 17. Future AP-session startup contract

When the COOPERATOR intentionally resumes work in `cisarik/ap`, the fresh Orchestrator instance MUST:

1. resolve current public `main`;
2. locate the commit containing this handoff;
3. verify its SHA;
4. verify its parent;
5. verify subject:
   `handout`;
6. verify changed path:
   `NEXT_ORCHESTRATOR.md`;
7. inspect every intervening commit if the handoff commit is not current HEAD;
8. read the required repository files;
9. verify `WORKERS.md`;
10. verify current `NEXT_WORKER.md`;
11. confirm whether active Worker count is still zero;
12. verify whether `Worker_2` remains unused;
13. identify the COOPERATOR’s current intent;
14. decide whether repository work is actually necessary;
15. recommend Worker count and topology;
16. ask for COOPERATOR approval if topology would change;
17. select the smallest coherent task;
18. initialize exactly one fresh Worker by default;
19. generate one tailored authoritative launch-and-task prompt;
20. avoid implementation in the Orchestrator chat.

If the repository remains stable and no task is requested, the correct result is to confirm the state and perform no Worker initialization.

---

# 18. Future Worker initialization contract

If methodology work is intentionally resumed and one Worker is sufficient, the likely next concrete label is:

`Worker_2`

Before acting, a fresh Worker instance must receive one authoritative ORCHESTRATOR prompt containing:

* concrete label:
  `Worker_2`;
* persistent role:
  `WORKER`;
* repository URL;
* working directory;
* branch;
* exact verified baseline;
* expected commit metadata;
* mandatory reading order;
* clean Git gate;
* bounded task ID;
* exact goal;
* authorized paths;
* forbidden paths;
* command authority;
* dependency authority;
* migration authority;
* secret authority;
* network/provider authority;
* private-data authority;
* filesystem authority;
* Git-write authority;
* validation;
* acceptance criteria;
* stopping conditions;
* report format;
* required session state.

The task may explicitly authorize updating `WORKERS.md` from:

* active Worker count:
  zero

to:

* active Worker count:
  one;
* active concrete instance:
  `Worker_2`;
* current assignment:
  the new bounded task.

Do not update `NEXT_WORKER.md` merely to initialize Worker_2 unless a future bounded task specifically requires it.

The current `NEXT_WORKER.md` remains useful startup context until a future Worker closeout replaces it.

---

# 19. Multi-Worker caution

This repository currently uses AP v1 and one-Worker topology.

Do not activate APv2 or multiple Workers casually.

Before adopting APv2 for this repository, the ORCHESTRATOR must:

1. identify a concrete benefit;
2. compare it with coordination and integration cost;
3. recommend a topology;
4. obtain COOPERATOR approval;
5. record the protocol selection;
6. update project-specific governance;
7. update `WORKERS.md`;
8. assign separate opaque Worker labels;
9. produce separate prompts;
10. define integration ownership.

Sequential relay should be preferred over parallel work.

Parallel workstreams require explicit isolation and are not justified merely because several agent implementations are available.

---

# 20. Error-prevention method

Do not rely on general instructions such as “be careful.”

Every future Worker task should use observable gates:

* exact Git root;
* exact remote;
* exact branch;
* clean worktree;
* fetched public baseline;
* local/tracking/public SHA comparison;
* expected parent and subject;
* relevant file inspection;
* exact allowlisted paths;
* explicit forbidden paths;
* explicit command authority;
* explicit sensitive-resource authority;
* deterministic validation;
* staged-path validation;
* pre-commit remote gate;
* exact commit subject;
* push verification;
* final clean worktree;
* structured report.

A Worker must stop rather than guess when:

* repository evidence contradicts the prompt;
* required authority is missing;
* an out-of-scope path is necessary;
* a major design choice remains unresolved;
* a destructive action would be required;
* another Worker’s workstream would be affected;
* the public remote moved unexpectedly.

---

# 21. Context pressure and rotation

Context pressure belongs to concrete instances and sessions.

It does not belong to the persistent roles.

Frequent clean handoffs are an intentional quality-control mechanism.

Rotate a Worker instance when:

* a coherent substantial task is complete;
* context telemetry becomes constrained;
* report quality degrades;
* repeated summarization risks losing boundaries;
* a new subsystem or assignment profile begins;
* a clean committed boundary exists.

Rotate an Orchestrator instance when:

* strategic context becomes large;
* many decisions accumulate;
* source-of-truth restoration would benefit from a fresh instance;
* a complete repository-native handoff is ready.

No fixed percentage threshold is universal.

Use actual client telemetry, session quality, task boundaries, and repository state.

Repeated in-chat summarization is not a substitute for current BOOT/NEXT artifacts and verified Git evidence.

---

# 22. First-response contract for a future AP Orchestrator

Before the first substantive response about resumed AP repository work, the future Orchestrator instance should:

1. verify the actual public repository;
2. identify public HEAD;
3. identify the handoff commit;
4. verify parent, subject, and changed paths;
5. inspect current `NEXT_ORCHESTRATOR.md`;
6. inspect `WORKERS.md`;
7. inspect `NEXT_WORKER.md`;
8. determine active protocol;
9. determine active Worker count;
10. determine whether any Worker session is open;
11. inspect the current ADR index;
12. inspect relevant protocol documents;
13. distinguish verified public evidence from this historical summary.

The response should:

* be in Slovak;
* state the resolved public HEAD;
* classify context restoration as:
  `PASS`, `PARTIAL`, or `BLOCKED`;
* state whether this handoff remains canonical;
* summarize active protocol and topology;
* state Worker lifecycle status;
* state whether any task is authorized;
* identify one smallest next step only if the COOPERATOR actually requested repository work.

Do not automatically produce a Worker prompt when the repository is merely being inspected.

If no AP work is requested, confirm the stable parked state and stop.

---

# 23. Session-close declaration

The initial Analytic Programming repository session is complete.

The repository has been:

* initialized;
* documented;
* audited;
* repaired;
* Worker-closed;
* Orchestrator-handed-off.

`Worker_1` is permanently closed.

`NEXT_WORKER.md` is current and must remain unchanged at this boundary.

`Worker_2` is not initialized.

No future task is implied.

The `cisarik/ap` repository is stable enough to leave parked while the COOPERATOR and the current development effort return to FrameNest.

---

# 24. Success condition

This handoff succeeds when a future Orchestrator instance:

1. discovers and verifies the actual manual handoff commit;
2. treats this file as the canonical current Orchestrator handoff;
3. restores the persistent role model;
4. distinguishes roles from concrete instances and sessions;
5. restores AP v1 as active;
6. restores APv2 as standalone and experimental;
7. confirms Worker_1 is closed;
8. confirms active Worker count is zero;
9. confirms Worker_2 is not initialized;
10. understands that `NEXT_WORKER.md` is already current;
11. does not regenerate `NEXT_WORKER.md` without a future closeout reason;
12. does not initialize a Worker without intentional resumed work;
13. verifies public repository evidence independently;
14. preserves one Worker as the default;
15. treats sequential relay as preferred when APv2 is used;
16. treats parallelism as exceptional;
17. uses separate prompts for separate Workers;
18. preserves COOPERATOR approval over significant topology changes;
19. performs no repository work when none is requested;
20. allows the project to remain safely parked.
