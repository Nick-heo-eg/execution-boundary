# Execution Authority Runtime - RC2 Strict Aligned

> **Public Entry Specification Repository** — Runtime and internal orchestration files removed.

> **Runtime implementation moved to:** [execution-runtime-lab](https://github.com/Nick-heo-eg/execution-runtime-lab) — [v0.1.0-runtime-lab](https://github.com/Nick-heo-eg/execution-runtime-lab/releases/tag/v0.1.0-runtime-lab)

> **BASELINE SEALED:** RC2_STRICT_ALIGNED is the current stable baseline. All future releases reference this as the structural foundation for mediation-layer pre-execution enforcement.

[![Release](https://img.shields.io/github/v/release/Nick-heo-eg/execution-boundary?label=RC2_STRICT_ALIGNED)](https://github.com/Nick-heo-eg/execution-boundary/releases/tag/RC2_STRICT_ALIGNED)
[![Policy Alignment](https://img.shields.io/badge/Policy%20Alignment-100%25-brightgreen)](https://github.com/Nick-heo-eg/execution-boundary/tree/main/artifacts/release_candidates/RC2_STRICT_ALIGNED)
[![Pre-Runtime Blocking](https://img.shields.io/badge/Pre--Runtime%20Blocking-7%2F7%20STOP-red)](https://github.com/Nick-heo-eg/execution-boundary/releases/tag/RC2_STRICT_ALIGNED)
[![Baseline](https://img.shields.io/badge/Baseline-RC2__STRICT__ALIGNED-blue)](https://github.com/Nick-heo-eg/execution-boundary/tree/main)
[![Runtime Lab - CI Verified](https://github.com/Nick-heo-eg/execution-runtime-lab/actions/workflows/adversarial-proof.yml/badge.svg)](https://github.com/Nick-heo-eg/execution-runtime-lab/actions/workflows/adversarial-proof.yml)

## Latest Stable Release

**RC2_STRICT_ALIGNED – Strict Mediation Pre-Runtime Enforcement**

This release implements **mediation-layer pre-execution enforcement** with 100% policy alignment and deterministic strict threshold.

**This IS:**

- ✅ Mediation layer enforcement
- ✅ Pre-runtime blocking (execution prevented BEFORE `execution_call()`)
- ✅ Policy-based authorization
- ✅ Application-layer governance

**This IS NOT:**

- ❌ Kernel isolation mechanism
- ❌ Operating system sandbox
- ❌ Container runtime security
- ❌ Hardware-level isolation

### Release Metrics

| Metric                       | Value                     |
| ---------------------------- | ------------------------- |
| **Policy Alignment**         | 100%                      |
| **Test Scenarios**           | 8/8 matched               |
| **STOP Verdicts**            | 7 (pre-runtime blocked)   |
| **ALLOW Verdicts**           | 1 (executed successfully) |
| **Architectural Violations** | 0                         |
| **RC1 Status**               | FROZEN, UNCHANGED         |
| **integrity.yaml Status**    | FROZEN, UNCHANGED         |

**Download:** [RC2_STRICT_ALIGNED.zip](https://github.com/Nick-heo-eg/execution-boundary/releases/tag/RC2_STRICT_ALIGNED)

---

## Quick Reproduce (3 minutes)

```bash
# 1. Clone the repository
git clone https://github.com/Nick-heo-eg/execution-boundary.git
cd execution-boundary

# 2. Checkout the release branch
git checkout RC2_STRICT_ALIGNED

# 3. Install dependencies (if Node.js test available)
npm install 2>/dev/null || true

# 4. Verify the release artifacts
cd artifacts/release_candidates/RC2_STRICT_ALIGNED
ls -lh

# 5. Verify ZIP integrity
sha256sum ../RC2_STRICT_ALIGNED.zip
# Expected: adc9bdeeb2e4416235e98304a8cdffdd5e12bb579b641961e43a9287b38823ea

# 6. View enforcement results
cat final_policy_alignment_results.json
```

### Expected Output

When viewing `final_policy_alignment_results.json`, you should see:

```json
{
  "test_results": {
    "total_tests": 8,
    "matched": 8,
    "failed": 0,
    "match_rate": "100%",
    "stop_verdicts": 7,
    "allow_verdicts": 1,
    "architectural_violations": 0
  },
  "enforcement_configuration": {
    "strict_threshold": 1,
    "deterministic_mode": true,
    "execution_blocked_pre_runtime": true,
    "policy_alignment": "100_percent"
  }
}
```

**Key Indicators:**

- ✅ `execution_blocked_pre_runtime: true` - STOP verdicts prevent execution BEFORE `execution_call()`
- ✅ `policy_alignment: "100_percent"` - Client-server threshold aligned
- ✅ `deterministic_mode: true` - No heuristics, pure risk score enforcement
- ✅ `architectural_violations: 0` - Verdict-execution separation maintained

---

## Release Artifact Structure

```
artifacts/release_candidates/
├── RC2_STRICT_ALIGNED/                     # Release directory (9 files)
│   ├── REFERENCE_MANIFEST.yaml             # Version 1 enforcement scope definition
│   ├── RELEASE_DECLARATION.txt             # Mediation layer implementation scope (7.5K)
│   ├── RC2_STRICT_ALIGNED.integrity.yaml   # File-level hash manifest
│   ├── verification_log.txt                # Hash verification results
│   ├── final_policy_alignment_results.json # 100% policy alignment proof (13K)
│   ├── enforcement_summary.txt             # Enforcement metrics summary (4.6K)
│   ├── verification_summary.txt            # Verification details (4.8K)
│   ├── git_state_snapshot.txt              # Git state at release time
│   └── runtime_sha256.txt                  # Individual file hashes
├── RC2_STRICT_ALIGNED.zip                  # Sealed release archive (15K)
└── RC2_STRICT_ALIGNED.integrity.yaml       # ZIP integrity manifest
```

**Key Documents:**

1. **REFERENCE_MANIFEST.yaml** - Defines enforcement scope (mediation_layer, NOT kernel isolation)
2. **RELEASE_DECLARATION.txt** - Full implementation scope clarification
3. **final_policy_alignment_results.json** - Test results and enforcement metrics
4. **verification_log.txt** - Hash verification proof (manifest_hash_verified=true, zip_hash_verified=true)

---

## Enforcement Configuration

```yaml
enforcement_scope: mediation_layer
execution_boundary: pre_runtime_blocking
strict_threshold: 1
deterministic_mode: true
policy_alignment_percent: 100
```

**Mediation Flow:**

```
OpenClaw Input → EAR Client → Gateway → Policy Evaluation → Verdict
                                                              ↓
ExecutionBridge ← Verdict ← Gateway Response ← Risk Scoring
```

**Execution Control:**

```typescript
verdict === ALLOW ? execute() : block();
```

**Blocking Point:** BEFORE `execution_call()`

---

## Integrity Verification

**ZIP Archive SHA256:**

```
adc9bdeeb2e4416235e98304a8cdffdd5e12bb579b641961e43a9287b38823ea
```

**Verify locally:**

```bash
sha256sum artifacts/release_candidates/RC2_STRICT_ALIGNED.zip
```

**All file hashes are documented in:**

- `RC2_STRICT_ALIGNED/runtime_sha256.txt`
- `RC2_STRICT_ALIGNED/RC2_STRICT_ALIGNED.integrity.yaml`

---

## Package Contents (Historical)

This repository also contains earlier demo packages:

1. **EAR_DEMO_STAGE_01_TUI_SKELETON.zip**
   - UI scaffold for mediation visualization

2. **EAR_STAGE_03_RUNTIME.zip**
   - Risk Engine + Pending Queue + Scope-bound Token Skeleton

---

## Core Principle

**The agent may reason freely.**
**Execution is physically separated.**

Tagline:
_OpenClaw runs 24/7. The runtime holds the keys._

---

## License

See [LICENSE](LICENSE) file for details.

---

## Links

- **GitHub Release:** https://github.com/Nick-heo-eg/execution-boundary/releases/tag/RC2_STRICT_ALIGNED
- **Release Branch:** https://github.com/Nick-heo-eg/execution-boundary/tree/release/rc2_strict_aligned_public
- **Main Branch:** https://github.com/Nick-heo-eg/execution-boundary/tree/main
- **Artifacts:** https://github.com/Nick-heo-eg/execution-boundary/tree/main/artifacts/release_candidates/RC2_STRICT_ALIGNED
