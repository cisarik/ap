# Architecture Decision Records

This directory contains accepted decisions for the Analytic Programming source repository.

## Purpose

Architecture Decision Records (ADRs) capture significant decisions that affect protocol structure, repository governance, or adoption workflow. They complement normative protocol documents by recording *why* a decision was made.

## Status meanings

| Status | Meaning |
|---|---|
| Proposed | Under discussion; not yet binding |
| Accepted | Current authoritative decision |
| Superseded | Replaced by a later ADR; retained for history |

## Index

| ADR | Title | Status |
|---|---|---|
| [0001](0001-protocol-version-selection.md) | Protocol version selection | Accepted |
| [0002](0002-worker-instance-topology.md) | Worker instance topology | Accepted |
| [0003](0003-apv3-protocol-generation.md) | AP v3 protocol generation | Accepted |
| [0004](0004-fresh-slice-diagnostic-lifecycle.md) | Fresh-slice implementation and diagnostic closeout lifecycle | Accepted |

## Lifecycle rule

Accepted ADRs MUST NOT be silently rewritten. When a decision changes, create a new ADR that supersedes the earlier record and update this index.
