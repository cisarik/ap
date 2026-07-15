# Architecture Decision Records

This directory contains accepted architecture decisions for Analytic
Programming.

## Status Meanings

| Status | Meaning |
|---|---|
| Accepted | Current durable decision |
| Superseded | Replaced by a later ADR; preserved only when still useful in the live tree |

## Index

| ADR | Title | Status |
|---|---|---|
| [0004](0004-fresh-slice-diagnostic-lifecycle.md) | Fresh-slice implementation and diagnostic closeout lifecycle | Accepted |
| [0005](0005-single-live-protocol-and-pinned-submodule-distribution.md) | Single live protocol and pinned submodule distribution | Accepted |
| [0006](0006-adaptive-orchestration-and-preflight-lifecycle.md) | Adaptive orchestration and preflight lifecycle | Accepted |
| [0007](0007-worker-session-evidence-and-restoration-lifecycle.md) | Worker session evidence and restoration lifecycle | Accepted |

## Lifecycle Rule

Accepted ADRs are not silently rewritten to change their decision. When a
decision changes, create a new ADR that records the new decision and update this
index. Git history preserves removed or superseded records that no longer have
current value in the live tree.
