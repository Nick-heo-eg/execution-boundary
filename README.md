# Execution Boundary

Execution is not created without prior judgment.

This repository defines the structural invariant that execution must not exist unless a valid judgment has occurred.
It serves as the conceptual entry point for execution-boundary research and related specifications.

---

## Core Invariant

Execution requires prior judgment as a hard precondition.

If judgment does not occur, execution must not be created.

This is a structural condition, not a workflow preference or advisory signal.

---

## What This Repository Provides

- A definition of execution–judgment separation
- A structural model for pre-execution authority
- An entry map to related specifications, proofs, and experiments

This repository does not contain runtime enforcement code.

---

## Why This Exists

Many AI governance approaches focus on:

- improving decision quality, or
- explaining outcomes after execution.

Execution Boundary addresses a different layer:

Execution authority must be structurally dependent on prior judgment.

The concern is not how well decisions are made,
but whether execution is allowed to exist without them.

---

## Minimal Structural Model

```
Input
→ Judgment
→ (If valid) Execution
→ (If absent or invalid) No Execution
```

Judgment is treated as a required precondition, not a post-hoc review.

---

## Ecosystem Map

This repository is the entry point.

Related specifications:

- `ai-execution-boundary-spec`
- `execution-governance-spec`
- `judgment-boundary`
- `agent-judgment-spec`

Observation & telemetry:

- `judgment-boundary-otel-spec`
- `decision-only-observability`

Proof artifacts:

- `telegram-judgment-demo-proof`
- `stop-first-operational-proof`

Experimental topologies and benchmarks are listed in their respective repositories.

---

## Scope

This boundary definition is:

- model-agnostic
- runtime-agnostic
- policy-agnostic
- regulation-agnostic

It defines a structural invariant, not a product or enforcement system.

---

## Status

Entry point repository.
Read-only by design.
