# Proof Repository Non-Claims Standard Template

Every proof repository **MUST** include a "What this proof does NOT claim" section using this template.

---

## Standard Template

All proof repositories must include this section **verbatim** in their README:

```markdown
## What this proof does NOT claim

This proof does NOT claim:
- General AI safety or harm prevention
- Compliance with any regulation or legal framework
- Completeness or correctness of AI outputs
- A reusable framework or reference architecture
- Coverage beyond the specific operational claim described in this repository

This proof demonstrates only one thing:
- That the stated claim is achievable under the documented conditions

Any additional guarantees require separate proofs.
```

---

## Purpose

This section exists to prevent misinterpretation of proof scope.

Proof repositories are **completed evidence artifacts**.

They do not:
- Solve general problems
- Replace human judgment
- Guarantee safety
- Provide deployment-ready solutions

They only demonstrate that a specific, narrow claim is achievable.

---

## Enforcement

* Proof repositories without this section are not recognized as valid proofs
* The template must be used **verbatim** — no modifications, additions, or deletions
* If a proof's claim contradicts the Non-Claims section, the repository is considered invalid

---

## Rationale

Readers automatically assume that evidence implies broader guarantees.

Without explicit boundaries:
- Proofs are read as safety solutions
- Evidence is interpreted as endorsement
- Narrow claims are expanded into general frameworks

The Non-Claims section prevents this by default.

---

**Status:** Mandatory template for all Execution Boundary proof repositories
**Date:** 2026-02-09
