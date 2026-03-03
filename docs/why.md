# Why Execution Boundary

## The Problem

AI systems can propose actions. Most systems let them execute those actions immediately.

There is no structural separation between "the agent decided to do X" and "X happened."

When something goes wrong, the audit trail shows what happened — not what was authorized before it happened. That is not an audit trail. It is a log of outcomes.

## Why Existing Approaches Fall Short

**Prompt-based guards** are probabilistic. The same input can produce a different output. A guard that blocks a request today may not block the same request tomorrow. This is not a tuning problem — it is a category problem.

**Post-hoc logging** records what happened after execution. If the action was unauthorized, the log is a record of the failure, not a prevention of it.

**Heuristic filters** are subject to tuning and drift. The threshold that works today may not hold under a different input distribution.

None of these provide a structural guarantee that execution cannot occur without a prior authorization decision.

## What Execution Boundary Changes

A single structural rule:

> Execution occurs only after an explicit ALLOW decision. DENY is recorded. The record is tamper-evident.

This means:

- The evaluator runs before the action, not after
- DENY decisions are recorded — absence of execution is provable
- The ledger cannot be modified without detection
- The same inputs always produce the same decision

## What It Is Not

- Not a firewall (operates on semantics, not packets)
- Not a rate limiter (operates on authorization, not volume)
- Not an LLM guard (deterministic, not probabilistic)
- Not compliance infrastructure (no regulatory certification)
- Not a guarantee that callers cannot bypass it — it guarantees that if used, the record is complete
