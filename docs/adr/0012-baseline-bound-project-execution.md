# ADR-0012: Baseline-Bound Project Execution Envelope

Status: Accepted

## Context

AP's integration commands validate its pinned protocol distribution, but a
project also needs a small, reviewable source of execution truth. Ambient IDE,
AppImage, loader, Python, shell, Git, and SSH-agent state is not suitable input
to a reproducible project operation.

## Decision

The tracked project-root `ap.project.conf` owns only schema version, stable
project identity, the `sanitized-v1` environment policy, one CPython runtime,
and declared direct-execution operations. It is non-secret Git-config data.
Execution reads it with includes disabled from the named commit object, not
from a differing worktree file.

Schema v1 is closed except for ignored `extension.<name>.<field>` keys:

```ini
[ap]
    schemaVersion = 1
    projectId = owner/project
    environmentPolicy = sanitized-v1

[runtime "cpython"]
    kind = cpython
    executable = .venv/bin/python
    requiredVersion = 3.14
    sourceRoot = src                    # optional
    provenanceModule = package_name     # optional; requires sourceRoot

[operation "operation-id"]
    workingDirectory = .
    argv = -m                           # one or more values, one argv item each
    argv = package.module
    allowTrailingArgv = false
```

All paths are normalized project-relative paths without `..`. The operation ID
uses lowercase letters, digits, `_`, and `-`. Singleton duplication, includes,
unknown non-extension keys, unsupported versions, missing values, repository
identity mismatch, unsafe paths, and missing contracts are errors. `projectId`
must match the owner/project derived from `remote.origin.url`. Extensions are
ignored and cannot affect execution.

The baseline form validates committed configuration and runtime readiness:

```sh
./.ap/ap project check --root /physical/project/root --baseline <full-commit-id>
```

The candidate form reads the proposed worktree contract and performs only
configuration and readiness validation. Its output explicitly grants no
execution trust:

```sh
./.ap/ap project check --root /physical/project/root --candidate
```

A baseline-declared operation runs with:

```sh
./.ap/ap exec --root /physical/project/root --baseline <full-commit-id> \
  --operation operation-id -- trailing arguments
```

Execution is refused if the worktree contract differs from the baseline,
the operation is undeclared, or trailing arguments are not enabled. Fixed and
trailing arguments are passed directly as distinct argv entries. There is no
shell evaluation or constructed command string, and the target exit status is
the `ap exec` exit status.

The bootstrap reconstructs the process environment from empty. The child gets
only controlled `PATH`, `LC_ALL`, `LANG`, `PYTHONNOUSERSITE`,
`PYTHONDONTWRITEBYTECODE`, AP's project/baseline/operation identifiers, and—if
declared—the physical source root as the sole `PYTHONPATH`. AppImage and loader
variables, inherited `PATH`, other Python and virtualenv injection, shell and
Git injection, and `SSH_AUTH_SOCK` are not inherited. Diagnostics record
contaminated variable names/classes but never their values.

Before readiness or execution, AP keeps the baseline-declared executable as
the logical operation launch path and separately resolves its physical target
for validation. The physical interpreter is checked for the required CPython
major/minor, `sys.executable`, prefixes, stdlib, and `encodings` origin, their
internal consistency, and AppImage/Cursor path markers. User-site imports and
bytecode writes are disabled. A declared source root is injected exactly once,
and a declared provenance module must resolve inside it. Runtime ownership is
not restricted to root; a valid user-owned interpreter is allowed. Failures
direct the Worker to stop and report, never to repair Python.

Final execution uses the logical launch path, allowing CPython to discover an
adjacent `pyvenv.cfg`. A virtual-environment operation therefore observes its
logical `sys.executable`, virtual-environment `sys.prefix`, and site-packages;
direct non-venv runtimes are unchanged. Immediately before execution, AP
resolves the logical path again and refuses execution unless its regular,
executable physical target is the one already validated. A bounded TOCTOU
interval remains between that final check and kernel execution. The venv's
`pyvenv.cfg` and site-packages remain mutable runtime inputs, and AP does not
prove dependency-lock integrity.

## Security and authority boundary

`ap exec` is a validated execution envelope, not a security sandbox. It can
prevent inherited environment contamination, validate paths and runtime
identity, preserve argv boundaries, and report execution provenance. It cannot
contain malicious target code, stop that code from starting a shell or another
process, secure a compromised account or same-user host, prove mutation
authority, or replace the current authoritative Worker prompt. Technical
readiness and task authority remain separate.

This launch-path distinction introduces no schema-v1 or CLI change.

Repositories without `ap.project.conf` retain all existing `ap init`, `ap
doctor`, update, and rollback behavior. Only the new project-check and exec
surfaces require the contract.

## Consequences

The AP repository declares `.venv/bin/python` at Python 3.14 for its initial
`runtime-info` operation. AP does not create or repair that environment; a
missing or mismatched runtime makes project readiness fail explicitly.
Deployment, SSH, capabilities, profiles, secrets, browsers, daemon sessions,
and mutation authorization remain outside this decision.
