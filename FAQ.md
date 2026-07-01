# Analytic Programming - Plain-Language Guide and FAQ

> **Start here if you are new to AP, or if you are the COOPERATOR** (the human project owner).
> This is the friendly, simplified version. For the full normative rules, see [APv3.md](APv3.md).

This document has three parts:

1. **Understand AP in 5 minutes** - the short version, written for a human.
2. **FAQ** - answers to the questions a Cooperator actually asks.
3. **One-page cheat sheet** - the minimum you need at your desk.

---

## Part 1 - Understand AP in 5 minutes

### What AP is (one paragraph)

Analytic Programming (AP) is a **method for running software work safely with AI agents**. Instead of one long chat that slowly forgets things, AP splits work into **small, bounded tasks**, each given to a **Worker** that must *show evidence* it did the job. A **Coordinator layer** (the Orchestrator) shapes those tasks and checks the results. **You** - the human owner - approve the big decisions and verify the work actually works. Everything important gets written into the repository, so a fresh session can pick up exactly where the last one stopped, without anyone re-reading a giant chat.

AP is **not** software, not a package, and not tied to any specific AI tool. It is a set of rules and roles you follow.

### The three roles (plain language)

| Role | Who | What they do (simply) |
|---|---|---|
| **COOPERATOR** | You - the human owner | Decide what the project should be. Approve big/risky things. Send the Worker its task. Verify real results. |
| **ORCHESTRATOR** | The coordination layer (an AI session you talk to) | Understands what you want, inspects the repo, shapes ONE small task at a time, checks the Worker report, verifies commits. |
| **WORKER** | The agent that edits code/docs | Does exactly the one task it was given, shows evidence, stops when done or stuck. Never decides product direction on its own. |

### The whole flow in one picture

```
   YOU (COOPERATOR)
      |  I want X
      v
   ORCHESTRATOR  --- inspects the repo, shapes ONE small task
      |  hands you a ready prompt
      v
   YOU send it to the WORKER  -->  Toto posli WORKEROVI ako jeden prompt:
      |
      v
   WORKER  --- inspects first, edits only allowed files, runs tests
      |  reports back with evidence
      v
   ORCHESTRATOR verifies the public commit
      |
      v
   YOU accept  -->  next task     OR     rotate  -->  handoff + fresh session
```

### What YOU actually do (the Cooperator real job)

Most days, your job is small and human-shaped:

1. **Say what you want** - in your own words, to the Orchestrator.
2. **Approve one decision at a time** when the Orchestrator asks (should we do A or B?).
3. **Send the Worker its task** - copy the prompt the Orchestrator prepared (under the Slovak heading) into your Worker tool.
4. **Look at real results** - open the app, run it, click through. Do not just trust words.
5. **Give feedback** - PASS / FAIL / NOT TESTED on the numbered list the Orchestrator gives you.
6. **Do the physical/account things** only you can do - log into a service, plug in a device, approve a purchase, run a command on your machine that the Worker must not run.

You do **not** write the protocol, shape tasks, or verify commits yourself - that is the Orchestrator job. You steer and approve.

### The three-layer handoff (why sessions can rotate safely)

When a session gets long and tired, you start a fresh one. Three things travel between sessions, each with different weight:

```
+--------------------------------------+
|  Authoritative task (the prompt)     |  <-- the ONLY real task authority
+--------------------------------------+
|  Repository handoff  (NEXT_*.md)     |  <-- current state, NOT authority
+--------------------------------------+
|  Stable bootstrap    (BOOT_*.md)     |  <-- read once, NOT authority
+--------------------------------------+
```

- **BOOT** files = stable rules, read once at the start. Never a task.
- **NEXT** files = a snapshot of where things stand, replaced each session. Never a task.
- **The task prompt** = the only thing that actually tells the Worker what to do right now.

This is why a fresh session never needs you to paste an old chat: it reads BOOT + NEXT from the repo, then gets one new task.

---

## Part 2 - FAQ

Questions a Cooperator actually asks. Jump to the group you need.

### Understanding

#### How do I understand Analytic Programming?

Think of it as **three people doing one job safely**:
- you (the owner) decide and verify,
- an Orchestrator plans and checks,
- a Worker does the actual editing.

The trick is that the Worker is never trusted on its word - it must show evidence (files changed, tests run, a public commit). And no session lives forever: when one gets tired, you start fresh, and the repo carries the memory forward. That is the whole idea.

#### Is AP a tool, a framework, software, or a methodology?

A **methodology** - a set of roles and rules. It is documentation only. There is nothing to install. You apply it by following the files in this repository. It works on top of whatever AI coding assistant you already use.

#### What are the three roles, and which one am I?

- **COOPERATOR** = the human owner. That is **you**.
- **ORCHESTRATOR** = the coordination layer (the AI session you chat with to plan).
- **WORKER** = the AI agent that actually edits the repository.

You are always the COOPERATOR. The other two are AI sessions/tools you interact with.

#### Do I need to be a developer to be a Cooperator?

No. You need to understand your own project goals and be willing to look at real results (run the app, click through, read a report). The Orchestrator and Worker handle the technical shaping. You approve direction and verify outcomes. Technical literacy helps, but you do not write code or the protocol.

### Using AP (the simple way)

#### How do I use AP the simplest way?

The minimum loop, repeated:

1. Tell the Orchestrator what you want.
2. Let it inspect the repo and hand you ONE small task prompt (under `Toto posli WORKEROVI ako jeden prompt:`).
3. Send that prompt to your Worker tool.
4. Read the Worker report (it starts with `### Report for ORCHESTRATOR_CHAT`).
5. Tell the Orchestrator whether to continue or stop.

That is it. You do not need to read the full protocol to start. As you get comfortable, the Orchestrator will ask you for approvals and acceptance checks.

#### What does a normal session look like, step by step?

```
1. You state a goal
2. Orchestrator inspects the repo
3. Orchestrator shapes ONE small task
4. You send the task to the Worker
5. Worker inspects, edits allowed files, runs tests
6. Worker reports with evidence
7. Orchestrator verifies the public commit
8. You accept  -->  repeat from 1 with the next goal
   OR rotate  -->  Worker writes NEXT handoff, you start a fresh session
```

#### How do I know the Worker actually did the work?

Three layers of trust:
- **The report** says what changed and what tests ran (a claim, not proof).
- **The public commit** can be inspected independently by the Orchestrator (real proof of what landed).
- **You running the result** is the final check - open the app, do the thing. For anything user-visible, the Orchestrator gives you a numbered list to mark PASS/FAIL/NOT TESTED.

Never call something done just because the report sounds good. Look at the real result.

### Using AP as an advanced Cooperator

#### How do I use AP as an advanced Cooperator?

Once the basics feel natural, add these habits:

- **Ask for the lightest artifact first.** Before any implementation, have the Orchestrator request a small inspection report, not a big build. Decide direction from evidence.
- **Approve one decision at a time.** When the Orchestrator offers alternatives, pick one with a reason. Do not bundle many decisions into one vague yes.
- **Demand bounded tasks.** One task = one outcome, one commit, one report. Push back if a task looks like a multi-stage monster.
- **Require explicit Git authority.** Every task that commits must say so. The Worker must never `git add .`, force-push, or rewrite history without you knowing.
- **Use the numbered acceptance list** for anything you can see or click (see below).

#### When should I rotate to a fresh session?

Rotate when the current session gets unreliable. Signals:
- the session keeps asking the same things again;
- it forgets constraints you already gave;
- commits get confused or scope starts creeping;
- a natural checkpoint is reached (a feature done, a phase finished);
- the tool shows roughly 80-85% context used (if it shows a meter).

A checkpoint on purpose is better than waiting until the session is exhausted. At rotation, the closing Worker writes a NEXT handoff, and you start fresh - the repo carries the memory.

#### What are the numbered acceptance items, and when do I use them?

For any work you can see, hear, or interact with (a UI, a video, a device, a running service), the Orchestrator prepares a numbered list of things to check. You answer each line:

- **PASS** - it works.
- **FAIL** - it does not work (add a comment).
- **NOT TESTED** - you did not check this one.
- **+ comment** - extra note or new idea (does not change PASS/FAIL).

The Orchestrator sorts your answers into: accepted behavior, real defects (become small fix tasks), missing evidence, new product ideas (separate, not auto-added). This keeps your feedback precise instead of a vague yes/no.

#### What is compact communication mode?

An optional way to keep prompts and reports short. Instead of pasting all the rules into every prompt, the prompt references the rule files in the repo and keeps only the task-specific bits. Reports target roughly 800-1000 words and summarize commands rather than dumping them. It saves time and context without weakening safety. You do not need to do anything special - if your project turns it on, the Orchestrator and Worker follow it.

### Choosing a Worker

#### Which agent / Worker should I use?

AP is vendor-neutral: it does not care which tool you use, only what it can do. Pick any AI coding assistant that can do the things your tasks need. Decide by capability, not by brand.

Check what a task requires, then make sure your tool can do it:

| Capability | Needed when |
|---|---|
| Read the repository | almost always |
| Edit files | any implementation task |
| Run shell commands | tests, builds, git checks |
| Git read/write | commits and verification |
| Network/web | fetching docs, public checks |
| Run tests | code tasks |
| Multimodal (see images) | reviewing screenshots/UI |

Generic types that can fill the WORKER role: an IDE-integrated coding agent, a command-line agent, a local or remote coding agent, a general execution agent, a multi-agent system exposed as one accountable endpoint, or - where a project allows - even a human following the same task contract. Several coding assistants on the market can do this; the protocol endorses none of them. The choice is yours and may change between sessions.

The key rule: whatever you pick, it must follow the task boundaries - inspect first, edit only allowed files, show evidence, stop when done. If a tool cannot do that, it is not a good Worker for AP.

#### Can I use more than one Worker at the same time?

**No.** The active protocol (AP v3) is a **single-Worker** model. One Worker at a time. A previous experimental version (v2) sketched a multi-Worker topology, but that stayted theoretical - managing multiple Workers by hand is hard, so the active protocol keeps it simple. You rotate to a fresh Worker *sequentially*, never run several in parallel.

### Adopting AP

#### How do I use AP in a brand-new empty repo?

1. Create the new repository.
2. Copy `APv3.md` into it and rename the copy to `AP.md` (that is your active protocol).
3. Copy the universal files: `AP_ORCHESTRATOR.md`, `AP_WORKER.md`, `PROMPT_CONTRACTS.md`, `ARTIFACT_LIFECYCLE.md`.
4. Copy and customize the templates from `templates/project/`: `AGENTS.md`, `WORKERS.md`, `BOOT_ORCHESTRATOR.md`, `BOOT_WORKER.md`, `NEXT_ORCHESTRATOR.md`, `NEXT_WORKER.md`, `README.md`. Replace placeholders like `<PROJECT_NAME>` and `<REPOSITORY_URL>`.
5. In `WORKERS.md`, set up one Worker: `Worker_1`.
6. Open a fresh Orchestrator session, read `BOOT_ORCHESTRATOR.md`, verify the repo.
7. Issue the first task prompt for `Worker_1`.

End state: exactly one active `AP.md` (containing v3), one Worker, ready to go. See [ADOPTION.md](ADOPTION.md).

#### How do I use AP in an existing repo?

Same idea, but your code already exists, so keep it:

1. Copy `APv3.md` into the repo and rename it to `AP.md`.
2. Copy the universal handbooks and companion files (same list as above).
3. Copy and customize the templates - especially `AGENTS.md` (project identity, language, constraints) and `WORKERS.md` (one `Worker_1`).
4. Do **not** let AP rewrite your existing code or docs. The first few tasks should be read-only inspections so the Orchestrator learns your project before changing anything.
5. Record the AP adoption in an ADR if your project uses ADRs.

Your existing code stays yours. AP layers coordination rules on top; it does not replace your stack.

#### How do I use this source repository (the ap repo)?

This repository *is* the documentation. You do not run it. You read it, and you copy the files you need into your own project. The active protocol here is [APv3.md](APv3.md); `AP.md` is a redirect to it. To adopt AP, follow the adoption steps above using this repo as the source of the files. See [README.md](README.md) for the file map.

#### What is the difference between BOOT and NEXT files?

| File | Stability | What it holds | Is it a task? |
|---|---|---|---|
| `BOOT_*.md` | Stable, rarely changes | Roles, repo identity, safety rules, reading order | No |
| `NEXT_*.md` | Replaced every session close | Where the work stands right now, open risks, next likely step | No |

Neither gives the Worker permission to do anything. Only the **task prompt** does. BOOT = the rulebook you read once. NEXT = the sticky note from the last session.

### Suitability

#### What kind of projects is AP good for?

AP shines when:
- an AI agent is editing a real repository (code or substantial docs);
- you care about not breaking things and want verifiable, small steps;
- work spans multiple sessions and you cannot afford to lose context;
- decisions matter and should be recorded (ADRs, specs).

It is equally useful for software projects and for documentation-heavy projects (like this very repository - AP was used to build it).

#### When is AP overkill?

For a one-off question, a single quick edit, throwaway scripts, or casual brainstorming with no repo involved, AP adds ceremony you do not need. It pays off when there is a real repository, real risk, and more than one session of work.

#### Does AP require Git or a public repository?

Git is strongly recommended (commits are the verifiable evidence AP relies on). A public remote makes commit verification possible, but AP works with a private or local-only repo too - the Orchestrator then relies on Worker-supplied evidence for local-only state. AP does not require any specific hosting service.

### When things go wrong

#### What if my Worker changes things I did not ask for?

That is **overreach** and it must be called out. Tell the Orchestrator exactly what was unexpected. The Orchestrator will either reject it, ask the Worker to revert, or - if the change is actually useful - turn it into a separate authorized task. Never silently accept scope creep; it is how projects rot.

#### What if the Worker says it is done but I am not sure?

Do not mark it PASS on trust. Ask the Orchestrator for the numbered acceptance list and actually check the items yourself. If you cannot verify something, mark it NOT TESTED. If the public commit does not match the report, the Orchestrator will catch the mismatch. Honest doubt is better than a fake yes.

#### What if the Worker gets stuck (BLOCKED)?

A BLOCKED report is a good thing - it means the Worker stopped instead of improvising. Read why it is blocked: missing capability, missing authority, a precondition that failed, or a secret it must not touch. Then either give the missing approval, pick a different Worker that has the capability, or reshape the task with the Orchestrator. Do not pressure a blocked Worker to just try harder - that is how unsafe workarounds happen.

---

## Part 3 - One-page cheat sheet

### The minimal Cooperator loop

```
state goal  ->  approve direction  ->  send task to Worker
   ^                                           |
   |                                           v
accept/rotate  <----  Orchestrator verifies  <----  Worker reports
```

### Key files and what they are for

| File | One-line purpose |
|---|---|
| `APv3.md` | The active protocol rules (the real rulebook). |
| `AP.md` | A redirect to `APv3.md`. |
| `AGENTS.md` | Your project-specific rules and identity. |
| `WORKERS.md` | Your Worker roster (one `Worker_1`). |
| `AP_ORCHESTRATOR.md` | How the Orchestrator behaves. |
| `AP_WORKER.md` | How the Worker behaves. |
| `BOOT_*.md` | Stable session-start rules (read once). |
| `NEXT_*.md` | Current session state (replaced each close). |
| `PROMPT_CONTRACTS.md` | The shape of a task prompt and a report. |
| `ARTIFACT_LIFECYCLE.md` | What to keep, delete, and for how long. |
| `ADOPTION.md` | How to set AP up in a new project. |
| `VERSIONING.md` | Which protocol version is active. |

### The two fixtures you will see constantly

- The Orchestrator hands you a task under this heading (copy it to your Worker):

  `Toto posli WORKEROVI ako jeden prompt:`

- Every Worker report begins with:

  `### Report for ORCHESTRATOR_CHAT`

### Golden rules (if you remember nothing else)

1. **One small task at a time.**
2. **Inspect before changing.**
3. **Evidence, not words.** Look at the real result.
4. **Explicit permission only.** No Git writes, installs, or scope creep without it.
5. **Rotate on purpose**, with a handoff - do not ride a session to exhaustion.


## Related reading

- [README.md](README.md) - full repository overview
- [APv3.md](APv3.md) - the complete active protocol
- [ADOPTION.md](ADOPTION.md) - step-by-step adoption
- [GLOSSARY.md](GLOSSARY.md) - term definitions
