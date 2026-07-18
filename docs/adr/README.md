# Architecture Decision Records

This directory contains accepted architecture decisions for Analytic
Programming.

## Status Meanings

| Status | Meaning |
|---|---|
| Accepted | Current durable decision |
| Superseded | Replaced by a later ADR; preserved only when still useful in the live tree |

## Index

| ADR | Title | Status | Relationship |
|---|---|---|---|
| [0004](0004-fresh-slice-diagnostic-lifecycle.md) | Fresh-slice implementation and diagnostic closeout lifecycle | Accepted | Absolute sequential wording partially superseded by ADR-0009; sequential independent audit retained |
| [0005](0005-single-live-protocol-and-pinned-submodule-distribution.md) | Single live protocol and pinned submodule distribution | Accepted | Unchanged |
| [0006](0006-adaptive-orchestration-and-preflight-lifecycle.md) | Adaptive orchestration and preflight lifecycle | Accepted | Unchanged |
| [0007](0007-worker-session-evidence-and-restoration-lifecycle.md) | Worker session evidence and restoration lifecycle | Accepted | Absolute sequential wording partially superseded by ADR-0009; evidence and restoration decisions retained |
| [0008](0008-worker-session-target-and-authority-renewal.md) | Worker session target and authority renewal | Accepted | Extended prospectively by ADR-0009 session-and-mode routing |
| [0009](0009-capability-aware-worker-routing-and-execution-gates.md) | Capability-aware Worker routing and execution gates | Accepted | Current routing, execution-transition, topology-exception, and trust-boundary decision |

ADR-0009 permits only an explicit bounded parallel exception. It does not
supersede fresh sequential independent audit or the remaining decisions in
ADR-0004 and ADR-0007. Their bodies remain unchanged historical decisions.

## Lifecycle Rule

Accepted ADRs are not silently rewritten to change their decision. When a
decision changes, create a new ADR that records the new decision and update this
index. Git history preserves removed or superseded records that no longer have
current value in the live tree.
