# Proof Repository Naming Convention

## Purpose

Proof repositories are **completed evidence artifacts**, not code bases.

Each proof repository exists to demonstrate a single, isolated operational claim
about execution boundaries.

Proof repositories do not evolve, accumulate features, or receive versioned updates.

Once sufficient evidence is established, they are sealed.

---

## When a New Proof Repository Is Required

A new proof repository **must** be created when any of the following apply:

* **New operational claim**
  A different assertion about execution-boundary behavior

* **Different failure mode or execution context**
  Different runtime, language, or enforcement layer

* **Different enforcement layer**
  Runtime / telemetry / governance / observability

Extending an existing proof repository with additional pilots, variations, or versions
is **forbidden**.

---

## Naming Pattern

All proof repositories follow this structure:

```
{domain}-{claim}-{proof-type}-proof
```

### Components

* **{domain}** — Scope or area of execution boundary
  Examples: `stop-first`, `deferred-execution`, `judgment-telemetry`

* **{claim}** — Single operational assertion being proven
  Examples: `automation-can-stop`, `execution-without-judgment-impossible`

* **{proof-type}** — Nature of the proof
  Examples: `operational`, `observability`, `governance`, `runtime`

* **-proof** — Fixed suffix (always present)

### Examples

* `stop-first-operational-proof`
  Proves: Automation can complete tasks when allowed and stop immediately when required, without exercising judgment

* `deferred-execution-governance-proof`
  (Hypothetical) Proves: Execution deferral can be enforced at governance layer

* `judgment-telemetry-observability-proof`
  (Hypothetical) Proves: Judgment events can be observed via telemetry without altering execution flow

---

## Forbidden Patterns

The following naming patterns are **explicitly prohibited**:

* ❌ Sequential pilot numbering: `pilot_003`, `pilot_004`
* ❌ Version-based names: `v0.2`, `v1.1`, `next`
* ❌ Experimentation signals: `experimental`, `wip`, `evolving`, `draft`
* ❌ Multi-claim repositories: combining unrelated proofs in one repo

**Why forbidden:**

These patterns create the false impression of:
- Ongoing development
- Feature roadmaps
- Incomplete or provisional status

Proof repositories are sealed when complete, not versioned.

---

## Sealing Rule

1. When sufficient evidence is established, the repository is declared **SEALED**
2. After sealing, commits are limited to:
   * Documentation clarification
   * Typo fixes
   * Link updates
3. No new pilots, features, or proofs may be added
4. Additional experimentation requires a **new proof repository**

**How to seal:**

Add a "Repository Status" section to README with:
- Sealed declaration
- Evidence summary
- Reason for closure
- Reference to execution-boundary for future proofs

---

## Relationship to execution-boundary

* All proof repositories are registered in execution-boundary's **Proof Family** section
* Proof repositories **never** serve as entry points
* Proof repositories link **back** to execution-boundary, not vice versa (except in Proof Family list)

---

## Compliance

All proof repositories **must** follow these rules.

Non-compliant repositories will not be listed in the execution-boundary Proof Family.

---

**Status:** Normative guidance for Execution Boundary proof management
**Date:** 2026-02-09
