# Trust Boundary Declaration

**Canonical Authority:** `echo-core-private` (private repository)

**Public Verification:** Defensive Layer (this repository)

---

## 1. Authority Source Definition

### Canonical Authority: echo-core-private

**Location:** Private repository (not publicly accessible)

**Role:**
- Source of truth for TOPOLOGY_REGISTRY.yaml
- Authoritative registry hash calculation
- Protocol version lock enforcement
- Engine self-integrity validation
- Freeze protocol execution

**Authority Components:**
```
echo-core-private (CANONICAL ROOT)
├── TOPOLOGY_REGISTRY.yaml (source of truth)
├── CANONICAL_REGISTRY.hash (authoritative hash)
├── ENGINE_SELF_HASH.lock (engine integrity root)
├── PROTOCOL_VERSION_LOCK.yaml (version authority)
└── judgment-integrity-engine/ (validation logic)
    ├── integrity.sh (authoritative validation)
    ├── engine_self_integrity_validator.py (preflight)
    └── protocol_version_lock_validator.py (version check)
```

**Why Private:**
- Prevents unauthorized modification of canonical source
- Limits write access to authorized maintainers
- Protects integrity engine from public tampering
- Enforces review process for topology changes

**Authoritative Operations:**
1. Calculate registry hash from TOPOLOGY_REGISTRY.yaml
2. Execute freeze protocol (scripts/freeze.sh)
3. Validate engine self-integrity
4. Generate public landing page (README.md)
5. Update FREEZE_STATUS.md with registry hash

---

## 2. Public Verification Role

### Defensive Layer: execution-boundary

**Location:** This repository (publicly accessible)

**Role:**
- Verify freeze integrity using public documents
- Detect desynchronization between public documents
- Provide accessible verification without private access
- Enable community verification of freeze state

**Public Verification Components:**
```
execution-boundary (PUBLIC ENTRY POINT)
├── VERIFY_FREEZE.sh (defensive verification script)
├── FREEZE_STATUS.md (public freeze proof)
├── README.md (auto-generated with hash footer)
├── ENGINE_TRUST_MODEL.md (trust hierarchy explanation)
├── PROTOCOL_COMPATIBILITY.md (lineage documentation)
└── TRUST_BOUNDARY.md (this document)
```

**What Public Verification CAN Do:**
- ✅ Verify FREEZE_STATUS.md hash format is valid
- ✅ Extract and validate README footer hash format
- ✅ Cross-verify hash synchronization between public documents
- ✅ Confirm freeze timestamp presence
- ✅ Validate trust model hierarchy documentation
- ✅ Detect manual editing of public documents

**What Public Verification CANNOT Do:**
- ❌ Access canonical registry in echo-core-private
- ❌ Recalculate authoritative registry hash
- ❌ Validate engine integrity (no access to judgment-integrity-engine)
- ❌ Execute freeze protocol
- ❌ Provide authoritative verification (only defensive)

**Defensive Nature:**

> Public verification is a **detection mechanism**, not an **authority mechanism**.

**Detection capabilities:**
- Desynchronization between FREEZE_STATUS.md and README.md
- Manual modification of README footer
- Incomplete freeze execution
- Missing trust model documentation

**Non-detection limitations:**
- Cannot detect if canonical source is compromised
- Cannot verify engine integrity (no access to ENGINE_SELF_HASH.lock)
- Cannot validate protocol version lock (no access to PROTOCOL_VERSION_LOCK.yaml)
- Cannot confirm registry hash is correctly calculated

**Purpose:**
Public verification serves as a **first-line defense** for users who:
- Want to verify freeze integrity quickly
- Do not have access to echo-core-private
- Need automated cross-document validation
- Seek to detect obvious tampering

It is NOT a replacement for canonical verification.

---

## 3. Engine Integrity Root

### Root of Trust: ENGINE_SELF_HASH.lock

**Location:** echo-core-private (NOT publicly accessible)

**Hash Value:** `0958aeea88dcdd1c1e654f87cba1bf86c161bff030714780c1a619113af1d03d`

**Role:**
- Cryptographic guarantee that judgment-integrity-engine has not been tampered
- Preflight validation before ANY integrity checks run
- Root of trust for entire verification system

**Why This Matters:**

> A compromised integrity engine can lie about everything.

**Threat scenario:**
1. Attacker gains write access to echo-core-private
2. Modifies integrity.sh to always return PASS
3. Compromised engine validates compromised state as "valid"
4. All subsequent integrity checks are untrusted

**Protection mechanism:**
1. ENGINE_SELF_HASH.lock is locked OUTSIDE judgment-integrity-engine/
2. Engine hash is calculated and compared BEFORE any checks run
3. Hash mismatch immediately blocks ALL checks
4. No false PASS results possible

**Public Accessibility:**

> PUBLIC CANNOT VERIFY ENGINE INTEGRITY

**Why:**
- ENGINE_SELF_HASH.lock is in echo-core-private (private)
- judgment-integrity-engine/ is in echo-core-private (private)
- Public has no way to recalculate engine hash

**Implication:**
Public verification ASSUMES engine integrity.
If engine is compromised, public verification may receive false data.

**Trust assumption:**
Public verification trusts that:
1. echo-core-private maintainers verify engine integrity
2. FREEZE_STATUS.md was generated by trusted engine
3. README.md was generated by trusted generate_public_landing.py
4. Canonical registry hash in FREEZE_STATUS.md is accurate

---

## 4. Verification Escalation Path

### Escalation Levels

**Level 1: Public Defensive Verification (This Repository)**

**Command:** `bash VERIFY_FREEZE.sh`

**Access Required:** None (public repository)

**Checks:**
- ✅ FREEZE_STATUS.md hash format
- ✅ README.md footer hash format
- ✅ Cross-document hash synchronization
- ✅ Freeze timestamp presence
- ✅ Trust model documentation

**Trust Assumptions:**
- Assumes FREEZE_STATUS.md contains accurate canonical hash
- Assumes README.md was auto-generated correctly
- Assumes engine integrity (no way to verify)

**Result:**
- PASS: Public documents are synchronized
- FAIL: Desynchronization detected or format invalid

**When to Use:**
- Quick verification needed
- No echo-core-private access available
- Detect obvious tampering
- Community verification

**Limitations:**
- Cannot verify canonical source
- Cannot verify engine integrity
- Cannot validate protocol version
- Defensive only, not authoritative

---

**Level 2: Canonical Integrity Validation (Private Repository)**

**Command:** `bash judgment-integrity-engine/integrity.sh`

**Access Required:** echo-core-private repository access

**Checks:**
- ✅ Engine self-integrity (preflight)
- ✅ Entrypoint validator
- ✅ Registry hash guard
- ✅ Topology drift check
- ✅ README link audit
- ✅ Protocol version lock validator

**Trust Assumptions:**
- Assumes ENGINE_SELF_HASH.lock is accurate
- Assumes git repository integrity

**Result:**
- PASS: All canonical integrity checks passed
- FAIL: Specific check failure with recovery path

**When to Use:**
- Authoritative verification needed
- echo-core-private access available
- Before committing registry changes
- After freeze protocol execution

**Limitations:**
- Requires private repository access
- Manual execution needed
- Does not verify git history

---

**Level 3: Full Freeze Protocol (Private Repository)**

**Command:** `bash scripts/freeze.sh`

**Access Required:** echo-core-private repository write access

**Steps:**
- Step -1: Self Engine Validation
- Step 0: Protocol Lineage Validation
- Step 1: Registry Hash Calculation
- Step 2: README Footer Synchronization
- Step 3: Integrity Engine Execution
- Step 4: Adversarial Test Execution (8 tests)
- Step 5: Snapshot Document Generation
- Step 6: READY_FOR_SEAL Generation

**Trust Assumptions:**
- Assumes executor is authorized
- Assumes engine integrity

**Result:**
- Comprehensive freeze execution
- All artifacts generated
- READY_FOR_SEAL.txt created

**When to Use:**
- Topology registry modified
- Protocol version updated
- Engine updated
- Freeze state needs refresh

**Limitations:**
- Requires write access
- Manual commit authorization needed
- Does not auto-push

---

### Escalation Decision Tree

```
User wants to verify freeze integrity
    ↓
Has access to echo-core-private?
    ↓
NO  → Use Level 1 (VERIFY_FREEZE.sh)
    → Provides defensive verification
    → Detects public document tampering
    → PASS: Public documents synchronized
    → FAIL: Escalate to maintainer
    ↓
YES → Use Level 2 (integrity.sh)
    → Provides authoritative validation
    → Validates canonical source
    → PASS: Canonical integrity verified
    → FAIL: Review recovery protocol
    ↓
Registry modified?
    ↓
YES → Use Level 3 (freeze.sh)
    → Execute full freeze protocol
    → Generate all artifacts
    → Update public documents
    → Commit after review
```

---

## 5. Threat Model Summary

### Threat: Compromise Canonical Source

**Attacker Goal:** Modify TOPOLOGY_REGISTRY.yaml undetected

**Attack Vector:**
1. Gain write access to echo-core-private
2. Modify TOPOLOGY_REGISTRY.yaml
3. Do NOT update CANONICAL_REGISTRY.hash
4. Attempt to commit

**Defense:**
- ✅ Pre-commit CHECK 8 blocks commit (registry hash mismatch)
- ✅ CI validates hash synchronization
- ✅ Archive log preserves history

**Detection:**
- Canonical: Pre-commit hook
- Public: N/A (no access to canonical source)

---

### Threat: Forge Public Documents

**Attacker Goal:** Make public documents appear valid without canonical authority

**Attack Vector:**
1. Modify README.md footer hash
2. Modify FREEZE_STATUS.md registry hash
3. Make hashes consistent
4. Users run VERIFY_FREEZE.sh

**Defense:**
- ❌ Public verification PASS (hashes are consistent)
- ✅ Canonical source detects forgery (different registry hash)
- ✅ Community can compare with canonical tags/releases

**Detection:**
- Canonical: Registry hash mismatch
- Public: Cross-reference with canonical commits

**Mitigation:**
- Users should verify against canonical git tags
- Published releases should reference canonical commit IDs
- FREEZE_STATUS.md should include canonical commit reference

---

### Threat: Tamper with Integrity Engine

**Attacker Goal:** Modify integrity.sh to always return PASS

**Attack Vector:**
1. Gain write access to echo-core-private
2. Modify judgment-integrity-engine/integrity.sh
3. Engine now reports PASS regardless of state
4. Run integrity checks

**Defense:**
- ✅ Engine self-integrity preflight detects modification
- ✅ Engine hash mismatch blocks ALL checks
- ✅ No false PASS results possible

**Detection:**
- Canonical: ENGINE_SELF_HASH.lock validation
- Public: N/A (cannot verify engine)

---

### Threat: Tamper with Public Verification Script

**Attacker Goal:** Modify VERIFY_FREEZE.sh to always return PASS

**Attack Vector:**
1. Fork execution-boundary repository
2. Modify VERIFY_FREEZE.sh to always output PASS
3. Users clone forked repository
4. Users run compromised verification

**Defense:**
- ⚠️ Public verification script is modifiable
- ✅ Git diff shows modification
- ✅ SHA256 snapshot in public-verify-logs
- ✅ Users should verify against canonical repository

**Detection:**
- Public: git diff, SHA256 mismatch
- Community: compare with canonical repository

**Mitigation:**
- Users should clone from official repository
- Verification script should display repository URL
- SHA256 of VERIFY_FREEZE.sh should be documented

---

### Threat: Desynchronize Public Documents

**Attacker Goal:** Create mismatch between FREEZE_STATUS.md and README.md

**Attack Vector:**
1. Manually edit README.md footer hash
2. Leave FREEZE_STATUS.md unchanged
3. Users run VERIFY_FREEZE.sh

**Defense:**
- ✅ Check 4 detects hash mismatch
- ✅ VERIFY_FREEZE.sh FAIL with clear explanation

**Detection:**
- Public: VERIFY_FREEZE.sh Check 4
- Canonical: README generation validation

---

## Trust Boundary Summary

**Canonical Authority (echo-core-private):**
- Source of truth
- Authoritative validation
- Engine integrity enforcement
- Private access only

**Public Verification (execution-boundary):**
- Defensive layer
- Community accessible
- Cross-document validation
- NOT authoritative

**Trust Model:**
```
User trusts PUBLIC VERIFICATION
    ↓ defensive detection only
Public documents synchronized?
    ↓ yes
User assumes CANONICAL AUTHORITY is valid
    ↓ trust assumption
Canonical source verified?
    ↓ requires private access
Engine integrity validated?
    ↓ root of trust
System state proven
```

**Critical Insight:**

> Public verification protects against **desynchronization**.
> It does NOT protect against **canonical compromise**.

**To fully trust the system:**
1. Verify public documents (Level 1 - anyone)
2. Verify canonical source (Level 2 - maintainers)
3. Verify engine integrity (Level 2 preflight - maintainers)

**Without Level 2 access:**
- Public verification is best-effort defense
- Trust canonical maintainers
- Cross-reference with canonical tags/releases
- Monitor git history for unexpected changes

---

**Document Status:** ACTIVE

**Last Updated:** 2026-02-14T11:15:00KST

**Authority:** This document describes trust boundaries. It does not confer authority.

**Canonical Source:** echo-core-private (private repository)

**Public Mirror:** execution-boundary (this repository)
