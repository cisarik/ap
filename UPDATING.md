# Updating the Pinned AP Version

Artifact relationship: **operational update guide** for
[RF-15](AP.md#rf-15-protocol-variants-and-stable-integration). `AP.md` owns
meaning; this guide projects the unchanged check, candidate-validation, commit,
and rollback workflow. It grants no update, Git, or publication authority.

AP updates are explicit and auditable. A consuming project pins an exact AP
commit through the `.ap` submodule gitlink. No existing project silently changes
behavior when the AP source repository advances.

## Check for an Update

From the consuming project root:

```sh
./.ap/ap update --check
```

The command does not change the superproject worktree, index, refs,
`.gitmodules`, submodule worktree, submodule index, remotes, or Git
configuration. It fetches the canonical AP `main` commit and may update the
submodule's Git object database and `FETCH_HEAD`.

It reports:

- current pinned AP commit;
- available canonical `main` commit;
- whether a forward update exists.

If canonical `main` is behind the current AP commit or has diverged from it,
normal update is refused. That protects against accidental downgrade,
rewritten history, or a supply-chain anomaly.

## Apply an Update

Use an explicit project task. Start from a clean consuming project worktree.

```sh
./.ap/ap update --apply
./.ap/ap doctor --candidate
git diff --submodule
```

The apply command:

- verifies `.ap/` is an initialized canonical AP submodule;
- refuses dirty AP submodule state;
- refuses unsafe superproject state that would conceal the pointer update;
- fetches the canonical AP `main` ref;
- moves the AP submodule worktree to the exact new commit;
- leaves the consuming superproject with a visible changed gitlink;
- refuses target commits that do not contain an executable `ap` tool;
- never commits or pushes.

`doctor --candidate` validates the intentionally changed `.ap` checkout before
the consuming project stages or commits the new gitlink. Strict `doctor` still
rejects gitlink drift.

Then validate the consuming project for compatibility. When authorized, stage
the changed gitlink and run strict doctor against the staged pin:

```sh
git add .ap
./.ap/ap doctor
git commit -m "docs: update analytic programming"
```

Candidate mode validates the proposed checkout but does not declare it
governing while it differs from the recorded gitlink. After `git add .ap`,
strict doctor re-establishes checkout/gitlink equality, validates the rest of
the canonical compatibility tuple, and reports
`OK resolved governing variant: stable`.

Do not promise that a protocol update is behaviorally risk-free before project
validation.

## Roll Back

To roll back AP, move the submodule back to a known earlier AP commit, validate,
and commit the changed gitlink:

```sh
git -C .ap checkout --detach <previous-ap-sha>
./.ap/ap doctor --candidate
git diff --submodule
git add .ap
./.ap/ap doctor
git commit -m "docs: roll back analytic programming"
```

The consuming project's history records both the update and rollback.

## Versioning Policy

The canonical AP source tree has one live normative protocol file:

```text
AP.md
```

Historical generations are available through Git history, immutable commit
SHAs, and future tags or releases if the project adopts them. Consuming projects
pin exact commits through the submodule gitlink.

AP does not require users to delete one protocol file and rename another during
upgrades.

## Review Checklist

Before committing an AP update in a consuming project:

- read the AP diff or changelog between old and new commits;
- run `./.ap/ap doctor --candidate` after moving `.ap`;
- run project-specific documentation, test, and policy checks;
- verify `AGENTS.md` still points to `.ap/`;
- verify or refresh optional project-owned declarations in `AGENTS.md` outside
  the managed block, such as a Cooperator presentation profile (e.g. status
  marks 🟢🟡🔴, delivery capsule), development envelope, or upgrade ledger per
  [INTEGRATION.md](INTEGRATION.md#optional-presentation-profile-development-envelope-and-trace-grammar);
- confirm no copied AP files were reintroduced;
- confirm `.ap/` has no local dirty state;
- confirm only the intended gitlink changes unless a separate authorized change
  is included;
- stage `.ap`, then run strict `./.ap/ap doctor` before committing and confirm
  that it resolves the governing variant as `stable`.

## Related Documents

- [INTEGRATION.md](INTEGRATION.md)
- [CHANGELOG.md](CHANGELOG.md)
- [AP semantic authority](AP.md#semantic-authority-and-artifact-relationships)
