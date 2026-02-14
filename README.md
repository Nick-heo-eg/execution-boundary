# Execution Boundary

<!-- AUTO-GENERATED FROM TOPOLOGY_REGISTRY.yaml - DO NOT EDIT MANUALLY -->

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
│  → execution-proof-public                 │
│  → telegram-judgment-demo-proof           │
├──────────────────────────────────────────┤
│  Core Specifications                     │
│  → ai-execution-boundary-spec             │
│  → spec                                   │
├──────────────────────────────────────────┤
│  Observability & Telemetry Alignment     │
│  → decision-only-observability            │
│  → judgment-boundary-otel-spec            │
│  → execution-boundary-otel-1.39-demo      │
└──────────────────────────────────────────┘
```

Each repository has a single responsibility.

---

## Start Here (Recommended Order)

1. **Structural Proof**
   - https://github.com/Nick-heo-eg/execution-proof-public 🆕
   Latest sealed structural STOP proof

2. **Structural Proof**
   - https://github.com/Nick-heo-eg/telegram-judgment-demo-proof
   Real-world STOP/HOLD demonstration

3. **Core Specification**
   - https://github.com/Nick-heo-eg/ai-execution-boundary-spec
   Formal execution authority specification

4. **Observability**
   - https://github.com/Nick-heo-eg/decision-only-observability
   Decision recording using existing telemetry

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

---

*Last auto-generated: 2026-02-14 00:10:20 UTC*
*Source: TOPOLOGY_REGISTRY.yaml v2.0*
*Registry Hash: 26bec01c*

---

**Topology Lock:** `TOPOLOGY_V1_FREEZE` / `LANDING_V1_LOCK`
