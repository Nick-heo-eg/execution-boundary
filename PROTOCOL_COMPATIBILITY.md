# Protocol Compatibility Declaration

**Purpose:** Establish cryptographic lineage between echo-core-private freeze protocol and execution-boundary public landing page

---

## Registry Lineage Verification

**echo-core-private (Canonical Root):**
- Protocol Version: `v1`
- Registry Hash (full): `4532452d8ecf0810e86deaf8b564952aec5c1014ad44e3786db6020540b4a93c`
- Freeze Timestamp: `2026-02-14T10:41:23KST`

**execution-boundary (Public Entry Point):**
- README Footer Hash: `4532452d` (first 8 chars)
- Auto-Generated From: `TOPOLOGY_REGISTRY.yaml v2.0`

---

## Lineage Confirmation Method

**Definition:** Two repositories belong to the same registry lineage if their registry hash prefixes (first 12 characters) match exactly.

**Verification:**
```
echo-core-private Registry Hash (prefix 12): 4532452d8ecf
execution-boundary README Hash (prefix 12):  4532452d8ecf
```

**Status:** ✅ **LINEAGE CONFIRMED**

Both repositories derive from the same canonical registry state. Any modification to `TOPOLOGY_REGISTRY.yaml` in echo-core-private will:
1. Change the full SHA256 hash
2. Update `CANONICAL_REGISTRY.hash`
3. Regenerate execution-boundary README with new hash prefix
4. Break lineage if not synchronized

---

## Protocol Version Compatibility

| Component | Version | Lock File |
|-----------|---------|-----------|
| Freeze Protocol | v1 | `PROTOCOL_VERSION_LOCK.yaml` |
| Registry Schema | 2.0 | `TOPOLOGY_REGISTRY.yaml` |
| Public Landing | Auto-generated | `README.md` |

**Compatibility Rule:**
- execution-boundary README is compatible with echo-core-private protocol if registry hash prefix (12 chars) matches
- Protocol version changes require full freeze execution (`scripts/freeze.sh`)
- Manual README edits break compatibility and are blocked by CI

---

## Cross-Repository Validation Architecture

```
echo-core-private (canonical)
├── TOPOLOGY_REGISTRY.yaml (source of truth)
├── CANONICAL_REGISTRY.hash (SHA256 full)
├── PROTOCOL_VERSION_LOCK.yaml (version lock)
└── Pre-commit + CI validates internal consistency

        ↓ (generation)

execution-boundary (public)
├── README.md (auto-generated, hash footer)
├── FREEZE_STATUS.md (public proof)
└── CI validates footer presence and format
```

**Enforcement Layers:**
1. **Local (echo-core-private):** Pre-commit CHECK 8 blocks registry changes without hash update
2. **CI (echo-core-private):** 5-step integrity validation including protocol version lock
3. **CI (execution-boundary):** README footer validation and hash format check
4. **Archive Trail:** `ARCHIVE_CANONICAL_REGISTRY_HASH.log` preserves history

---

## Lineage Break Detection

**Scenario:** Registry hash mismatch between repositories

**Symptoms:**
- execution-boundary README footer hash (first 8 chars) ≠ echo-core-private `CANONICAL_REGISTRY.hash` (first 8 chars)
- Prefix 12-char comparison fails

**Cause:**
- Manual README edit in execution-boundary
- Out-of-sync registry state
- Unauthorized registry modification

**Recovery:**
1. Verify current `CANONICAL_REGISTRY.hash` in echo-core-private
2. Regenerate README: `python3 judgment-integrity-engine/generate_public_landing.py > ../execution-boundary/README.md`
3. Verify footer hash matches
4. Commit both repositories
5. Re-run freeze protocol if needed

---

**Lineage Status:** ✅ SYNCHRONIZED
**Last Verified:** 2026-02-14T10:41:23KST
**Protocol Reference:** `FREEZE_PROTOCOL_V1.md` (echo-core-private)
