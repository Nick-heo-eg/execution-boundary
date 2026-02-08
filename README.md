# execution-boundary

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

## Where the boundary is defined

The operational specification and proofs live in the following repositories:

* **AI Execution Boundary Specification**
  [https://github.com/Nick-heo-eg/ai-execution-boundary-spec](https://github.com/Nick-heo-eg/ai-execution-boundary-spec)

* **Judgment Boundary (Canonical, Sealed)**
  [https://github.com/Nick-heo-eg/judgment-boundary](https://github.com/Nick-heo-eg/judgment-boundary)

* **Stop-First Operational Proof (Sealed)**
  [https://github.com/Nick-heo-eg/stop-first-operational-proof](https://github.com/Nick-heo-eg/stop-first-operational-proof)

* **Decision-Only Observability**
  [https://github.com/Nick-heo-eg/decision-only-observability](https://github.com/Nick-heo-eg/decision-only-observability)

---

## Proof Family

This repository references sealed and active proof artifacts that demonstrate
specific, isolated execution-boundary claims.

### Sealed Proofs

**stop-first-operational-proof (SEALED)**

Claim:
Automation can complete tasks when allowed and stop immediately when required,
without exercising judgment.

Status:
Sealed. Sufficient evidence established via two executed pilots (pilot_001, pilot_002).
No further pilots will be added to avoid false signals of ongoing experimentation.

### Active Proofs

None (as of now)

New execution-boundary claims are proven via new repositories,
not by extending sealed proof artifacts.

**Principles:**
- One proof repository proves one operational claim.
- Proof repositories do not evolve; they are sealed once sufficient evidence exists.
- New conditions or claims require new proof repositories.

All proof repositories **must** follow the naming rules defined in [PROOF_REPOSITORY_NAMING.md](docs/PROOF_REPOSITORY_NAMING.md).

All proof repositories **must** include the Non-Claims section defined in [PROOF_NON_CLAIMS_TEMPLATE.md](docs/PROOF_NON_CLAIMS_TEMPLATE.md).

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
