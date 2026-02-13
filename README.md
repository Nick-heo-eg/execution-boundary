# Execution Boundary

Execution is not created without judgment.

This repository is the entry point to the Execution Boundary topology.

It organizes structural proof, specification, observability alignment, and demonstrations into a layered system.

---

## What Is an Execution Boundary?

An execution boundary enforces that:

- Execution is not the default.
- A decision must be issued before execution.
- Authority is explicit.
- Accountability is observable.

This is not an output filter.
This is not a guardrail.

This is structural enforcement before side effects occur.

---

## Topology Overview

The Execution Boundary project is intentionally separated into layers:

```
┌──────────────────────────────────────────┐
│  Structural Proof                        │
│  → execution-proof-public                │
├──────────────────────────────────────────┤
│  Core Specifications                     │
│  → ai-execution-boundary-spec            │
│  → agent-judgment-spec                   │
├──────────────────────────────────────────┤
│  Observability & Telemetry Alignment     │
│  → decision-only-observability           │
│  → judgment-boundary-otel-spec           │
├──────────────────────────────────────────┤
│  Demonstrations                          │
│  → telegram-judgment-demo-proof          │
│  → execution-boundary-otel-1.39-demo     │
└──────────────────────────────────────────┘
```

Each repository has a single responsibility.

---

## Start Here (Recommended Order)

1. **Structural Proof**
   - https://github.com/Nick-heo-eg/execution-proof-public
   Observable STOP enforcement (minimal reproducible demo)

2. **Core Specification**
   - https://github.com/Nick-heo-eg/ai-execution-boundary-spec
   Formal execution authority specification

3. **Observability**
   - https://github.com/Nick-heo-eg/decision-only-observability
   Recording non-executed decisions using existing telemetry systems

4. **Demonstration**
   - https://github.com/Nick-heo-eg/telegram-judgment-demo-proof
   Real-world STOP/HOLD demonstration

---

## Why Multiple Repositories?

The separation is intentional.

Execution boundaries involve:

- Judgment
- Authority issuance
- Execution
- Accountability

Each layer is isolated to prevent conceptual and structural collapse.

The repository topology mirrors the execution topology.

---

## Scope

This project demonstrates structural authority enforcement.

It does not provide:

- Production-ready software
- Safety guarantees
- Policy completeness
- Regulatory certification

It demonstrates structure.

---

## Core Principle

We do not rely on intent.
We rely on structure.
