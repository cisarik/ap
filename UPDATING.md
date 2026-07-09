# Updating the Pinned AP Version

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
- confirm no copied AP files were reintroduced;
- confirm `.ap/` has no local dirty state;
- confirm only the intended gitlink changes unless a separate authorized change
  is included;
- stage `.ap`, then run strict `./.ap/ap doctor` before committing.

## Related Documents

- [INTEGRATION.md](INTEGRATION.md)
- [CHANGELOG.md](CHANGELOG.md)
- [AP.md](AP.md)
