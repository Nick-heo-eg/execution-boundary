# execution-boundary

## Important Notice

This repository defines concepts specifications or proofs related to execution or judgment boundaries This repository is not an implementation not a product and not an enforcement mechanism It provides no runtime guarantees compliance claims or safety certification It does not prevent misuse accidents or harm by itself All examples code and diagrams are illustrative and exist only to clarify ideas Any operational enforcement must be implemented outside the model and outside this repository

Questions discussions and critical review are welcome via GitHub Issues This repository intentionally separates conceptual clarity from execution responsibility

---

**Execution Boundary** defines a single invariant:

> **Execution is not created without judgment.**

This repository is a **public entry point**, not an implementation.

---

## What this is

Execution Boundary describes a structural condition under which execution is **impossible to exist**.

It is not a workflow choice.
It is not a safety heuristic.
It is not human-in-the-loop.

Judgment is treated as a **hard precondition**, not an advisory signal.

---

## What this is not

This repository does **not** provide:

* a framework
* a library
* a runtime
* a policy engine
* a governance product

It contains no enforcement code and no metrics.

---

## Why this exists

Most AI governance mechanisms focus on:

* improving decisions, or
* explaining outcomes after execution.

Execution Boundary governs **before execution exists**.

If judgment does not occur, execution is never created.

---

## Ecosystem Map

execution-boundary is the entry point. Specifications, observations, and proofs branch by role.

### Canonical Specifications

- [ai-execution-boundary-spec](https://github.com/Nick-heo-eg/ai-execution-boundary-spec) — Defines execution authority boundary and pre-execution judgment structure
- [execution-governance-spec](https://github.com/Nick-heo-eg/execution-governance-spec) — Documents execution governance concepts and decision taxonomy
- [judgment-boundary](https://github.com/Nick-heo-eg/judgment-boundary) — Constitutional specification governing downstream repositories
- [agent-judgment-spec](https://github.com/Nick-heo-eg/agent-judgment-spec) — Specifies judgment authority transfer for autonomous agents

### Observation and Telemetry

- [judgment-boundary-otel-spec](https://github.com/Nick-heo-eg/judgment-boundary-otel-spec) — OpenTelemetry-compatible observation patterns for decision boundaries
- [spec](https://github.com/Nick-heo-eg/spec) — AI Judgment Trail (AJT) minimal log schema
- [decision-only-observability](https://github.com/Nick-heo-eg/decision-only-observability) — Observation patterns for non-executed operations

### Proof and Topology

- [telegram-judgment-demo-proof](https://github.com/Nick-heo-eg/telegram-judgment-demo-proof) — Sealed proof: AI execution can be STOPPED/HELD before it happens (dual-track evidence: success + documented limitations)
- [judgment-topology](https://github.com/Nick-heo-eg/judgment-topology) — Structural topology preventing undefined AI judgments from execution
- [judgment-topology-poc](https://github.com/Nick-heo-eg/judgment-topology-poc) — Experimental demonstration of judgment topology separation
- [stop-first-operational-proof](https://github.com/Nick-heo-eg/stop-first-operational-proof) — Sealed proof that automation can stop immediately when required
- [genai-judgment-boundary](https://github.com/Nick-heo-eg/genai-judgment-boundary) — Boundary event recording adapter for GenAI systems

### Benchmarks, Demos, and Edge Cases

The following repositories are reference artifacts and not entry paths: [llm-gating-bench](https://github.com/Nick-heo-eg/llm-gating-bench), [math-solver-benchmark](https://github.com/Nick-heo-eg/math-solver-benchmark), [stop-strategy-comparison](https://github.com/Nick-heo-eg/stop-strategy-comparison), [mail-sentinel](https://github.com/Nick-heo-eg/mail-sentinel), [ajt-grounded-extract](https://github.com/Nick-heo-eg/ajt-grounded-extract), [two-stage-judgment-pipeline](https://github.com/Nick-heo-eg/two-stage-judgment-pipeline), [judgment-refinement-public](https://github.com/Nick-heo-eg/judgment-refinement-public), [k-judgment-gate](https://github.com/Nick-heo-eg/k-judgment-gate).

---

## Scope

This boundary is:

* model-agnostic
* runtime-agnostic
* policy-agnostic
* regulation-agnostic

Compliance and oversight are **consequences**, not design goals.

---

## Final note

This repository does not aim to make AI "safer".

It defines **when execution is not allowed to exist**.

---

### Status

**ENTRY POINT — READ-ONLY BY DESIGN**

---

### Commit Policy

Automated agents may propose changes, but commits must only occur after explicit human instruction.

This commit set reflects a one-time consolidation of previously approved tasks.

---

This repository is the entry point not the authority All execution responsibility remains outside this documentation
