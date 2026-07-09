# Updating the Pinned AP Version

AP updates are explicit and auditable. A consuming project pins an exact AP
commit through the `.ap` submodule gitlink. No existing project silently changes
behavior when the AP source repository advances.

## Check for an Update

From the consuming project root:

```sh
./.ap/ap update --check
```

The command is read-only. It reports:

- current pinned AP commit;
- available canonical `main` commit;
- whether an update exists.

## Apply an Update

Use an explicit project task. Start from a clean consuming project worktree.

```sh
./.ap/ap update --apply
./.ap/ap doctor
git diff --submodule
```

The apply command:

- verifies `.ap/` is an initialized canonical AP submodule;
- refuses dirty AP submodule state;
- refuses unsafe superproject state that would conceal the pointer update;
- fetches the canonical AP `main` ref;
- moves the AP submodule worktree to the exact new commit;
- leaves the consuming superproject with a visible changed gitlink;
- never commits or pushes.

Then validate the consuming project for compatibility. When authorized, commit
the changed gitlink:

```sh
git add .ap
git commit -m "docs: update analytic programming"
```

Do not promise that a protocol update is behaviorally risk-free before project
validation.

## Roll Back

To roll back AP, move the submodule back to a known earlier AP commit, validate,
and commit the changed gitlink:

```sh
git -C .ap checkout --detach <previous-ap-sha>
./.ap/ap doctor
git diff --submodule
git add .ap
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
- run `./.ap/ap doctor`;
- run project-specific documentation, test, and policy checks;
- verify `AGENTS.md` still points to `.ap/`;
- confirm no copied AP files were reintroduced;
- confirm `.ap/` has no local dirty state;
- confirm only the intended gitlink changes unless a separate authorized change
  is included.

## Related Documents

- [INTEGRATION.md](INTEGRATION.md)
- [CHANGELOG.md](CHANGELOG.md)
- [AP.md](AP.md)
