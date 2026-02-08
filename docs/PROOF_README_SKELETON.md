# Proof Repository README Skeleton

This file defines the mandatory README structure for all proof repositories
under the execution-boundary family.

Proof repositories are evidence artifacts.
They are not projects, frameworks, or evolving systems.

---

## Required Sections

### 1. Claim

A single, precise operational claim this repository proves.

- One repository = one claim
- No compound or extended claims

---

### 2. Scope

What conditions, environments, or assumptions this proof applies to.

This section defines where the claim is valid.

---

### 3. Non-Claims

(Required. Must use the standard Non-Claims template verbatim.)

See: PROOF_NON_CLAIMS_TEMPLATE.md

---

### 4. Evidence

The concrete artifacts that demonstrate the claim.

- pilots
- logs
- traces
- minimal code or scripts (if any)

No abstraction. No framework.

---

### 5. Why This Proof Stops Here

An explicit explanation of why no further pilots or extensions are added.

This section prevents false expectations of ongoing experimentation.

---

### 6. Repository Status

One of:
- ACTIVE (collecting evidence)
- SEALED (sufficient evidence obtained)

Once SEALED, the repository must not evolve.

---

### 7. Relationship to Other Proofs

Links to:
- execution-boundary (entry point)
- related proofs (if any)

New claims require new repositories.

---

**Status:** Mandatory structure for all Execution Boundary proof repositories
**Date:** 2026-02-09
