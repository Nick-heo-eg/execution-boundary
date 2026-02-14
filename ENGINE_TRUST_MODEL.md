# Engine Trust Model

**Foundation:** The system does not rely on intent. It relies on structure.

---

## Trust Hierarchy

```
System Trust
    ↓ depends on
Structure Integrity
    ↓ depends on
Protocol Correctness
    ↓ depends on
Engine Hash Validity
    ↓ (root of trust)
```

---

## Layer Definitions

### Layer 4: System Trust

**What it is:**
- User's confidence that the Execution Boundary topology is accurate
- Belief that public README reflects canonical registry state
- Trust that repository relationships are authentic

**What it depends on:**
- Structure Integrity (Layer 3)

**What it does NOT depend on:**
- Human intent
- Developer promises
- Documentation claims
- Organizational reputation

**Failure mode:**
- If Structure Integrity fails, System Trust is mathematically impossible

---

### Layer 3: Structure Integrity

**What it is:**
- Cryptographic proof that TOPOLOGY_REGISTRY.yaml has not drifted
- Verified synchronization between canonical root and public entry point
- Tamper-evident trail for all registry modifications

**What it depends on:**
- Protocol Correctness (Layer 2)

**What it is composed of:**
- Registry hash: `4532452d8ecf0810e86deaf8b564952aec5c1014ad44e3786db6020540b4a93c`
- README footer hash: `4532452d` (first 8 chars)
- Archive trail: `ARCHIVE_CANONICAL_REGISTRY_HASH.log`
- Integrity checks: 5/5 PASS

**Enforcement mechanisms:**
- Pre-commit CHECK 8: Registry hash synchronization
- CI validation: 4-step cross-file verification
- Branch protection: Force push blocked
- Protocol version lock: `PROTOCOL_VERSION_LOCK.yaml`

**Failure mode:**
- If Protocol Correctness fails, structure can report false integrity

---

### Layer 2: Protocol Correctness

**What it is:**
- Guarantee that freeze protocol executes all validation steps
- Assurance that integrity checks actually detect violations
- Proof that enforcement mechanisms cannot be bypassed

**What it depends on:**
- Engine Hash Validity (Layer 1)

**What it is composed of:**
- 8-step freeze protocol (Step -1 through Step 6)
- 5 integrity checks (Entrypoint, Hash Guard, Drift, Links, Version Lock)
- 7 adversarial tests (Drift-ADV-01 through Drift-ADV-07)
- Recovery protocols for all failure scenarios

**Enforcement mechanisms:**
- Protocol version lock prevents unauthorized protocol changes
- Step -1 validates engine before protocol execution
- Each step has documented failure conditions and recovery paths

**Failure mode:**
- If Engine Hash Validity fails, protocol can be modified to lie

---

### Layer 1: Engine Hash Validity (Root of Trust)

**What it is:**
- Cryptographic guarantee that `judgment-integrity-engine` has not been tampered with
- Preflight validation before ANY integrity checks run
- Root of trust for the entire system

**What it depends on:**
- **Nothing.** This is the foundation.

**What it is composed of:**
- Engine root hash: `0958aeea88dcdd1c1e654f87cba1bf86c161bff030714780c1a619113af1d03d`
- Lock file: `ENGINE_SELF_HASH.lock`
- Validation script: `engine_self_integrity_validator.py`

**Calculation method:**
```bash
find judgment-integrity-engine -type f \( -name '*.py' -o -name '*.sh' \) | sort | xargs sha256sum | sha256sum
```

**Enforcement mechanisms:**
- Runs BEFORE any other integrity checks (preflight)
- If validation fails, ALL subsequent checks are blocked
- No exceptions, no bypass, no fallback

**Why this is the root:**
- A compromised integrity engine can lie about everything
- Hash verification, protocol validation, structure checks — all untrusted if engine is tampered
- Therefore, engine integrity MUST be validated first with a hash locked OUTSIDE the engine directory

**Failure mode:**
- If this fails, **the entire system is untrusted**
- No recovery within the system is possible
- Must restore from external known-good state

---

## Dependency Flow

**Question:** Why can we trust the system?

**Answer:**
1. **System Trust** exists IF structure is intact
2. **Structure Integrity** exists IF protocol executes correctly
3. **Protocol Correctness** exists IF engine is unmodified
4. **Engine Hash Validity** exists IF `ENGINE_SELF_HASH.lock` matches current state

**Reverse (attack scenario):**
1. To compromise **System Trust**, attacker must break **Structure Integrity**
2. To break **Structure Integrity**, attacker must bypass **Protocol Correctness**
3. To bypass **Protocol Correctness**, attacker must modify **Engine Hash**
4. To modify **Engine Hash**, attacker must tamper with `judgment-integrity-engine/`

**Detection guarantee:**
- ANY modification to `judgment-integrity-engine/` changes the tree hash
- Changed hash triggers Step -1 FAIL
- Step -1 FAIL blocks ALL subsequent steps
- No checks run → No false PASS results → Attack is visible

---

## Why "Structure, Not Intent"

**Traditional trust model (intent-based):**
```
User trusts developers
  → Developers promise correctness
    → System is trusted by proxy
```

**Problem:** Intent can change, be forgotten, or be misrepresented.

**Structural trust model (evidence-based):**
```
User verifies engine hash
  → Engine validates protocol
    → Protocol validates structure
      → Structure proves system state
```

**Advantage:** No step depends on belief. Each step is cryptographically verifiable.

---

## Attack Surface Analysis

### Attack Vector 1: Modify TOPOLOGY_REGISTRY.yaml without detection
**Blocked by:** Structure Integrity (Layer 3)
- Pre-commit CHECK 8 blocks commit
- CI hash validation fails
- Archive trail captures attempt

### Attack Vector 2: Forge hash in README footer
**Blocked by:** Structure Integrity (Layer 3)
- execution-boundary CI validates footer format
- Manual edits detected by AUTO-GENERATED marker check
- Hash mismatch triggers drift detection

### Attack Vector 3: Bypass protocol validation
**Blocked by:** Protocol Correctness (Layer 2)
- Protocol version lock prevents unauthorized protocol changes
- freeze.sh Step 0 validates lineage before execution

### Attack Vector 4: Modify integrity checks to always return PASS
**Blocked by:** Engine Hash Validity (Layer 1)
- Step -1 preflight detects engine modification
- ALL checks blocked if engine hash fails
- Attack is visible before any compromised code runs

### Attack Vector 5: Modify ENGINE_SELF_HASH.lock to match tampered engine
**Blocked by:** Git commit trail + Manual review
- ENGINE_SELF_HASH.lock changes are visible in git diff
- Lock file updates require explicit authorization
- Hash changes must be documented with reason

**Note:** Layer 1 is the only layer that requires human verification (git diff review). All other layers are automated.

---

## Trust Invariant

**Theorem:**

> IF engine_hash(current) = ENGINE_SELF_HASH.lock
> AND protocol_version(TOPOLOGY_REGISTRY.yaml) = protocol_version(PROTOCOL_VERSION_LOCK.yaml)
> AND registry_hash(TOPOLOGY_REGISTRY.yaml) = CANONICAL_REGISTRY.hash
> AND readme_footer_hash(execution-boundary) = CANONICAL_REGISTRY.hash[0:8]
> THEN system structure is cryptographically proven intact

**Proof:**
- Condition 1 ensures engine integrity (untampered validation logic)
- Condition 2 ensures protocol integrity (no unauthorized protocol changes)
- Condition 3 ensures registry integrity (no unauthorized topology changes)
- Condition 4 ensures cross-repository integrity (public matches canonical)

**Contrapositive:**

> IF system structure is compromised
> THEN at least one of the four conditions MUST fail

This is why drift without trace is structurally impossible.

---

## Operational Philosophy

**We do not trust intent. We verify structure.**

- Intent: "I didn't modify the registry"
  Structure: `git diff TOPOLOGY_REGISTRY.yaml` shows zero changes

- Intent: "The integrity engine is unmodified"
  Structure: `engine_root_hash` matches `ENGINE_SELF_HASH.lock`

- Intent: "The README is auto-generated"
  Structure: Footer hash `4532452d` matches canonical hash prefix

- Intent: "Protocol version is locked"
  Structure: `freeze_protocol_version` in two files match exactly

**Every claim has a structural proof. If proof fails, claim is rejected.**

---

**Trust Model Status:** ACTIVE
**Root of Trust:** `ENGINE_SELF_HASH.lock`

engine_root_hash: 9b26a98c64d3474f23a03cf6e5bbdea5e41ba2ea18d04da776666f5c518cd3cc

**Last Updated:** 2026-02-14T11:28:01KST
