# Execution Boundary Operations

This document tracks operational commands and stabilization evidence for the Execution Boundary chain.

---

## Stabilization Evidence (v1.0.0)

**v1.0.0 marks the first internally stabilized Execution Boundary chain, where Authority, Gate, and CI have been verified under deterministic and fail-safe conditions.**

### Verification Scope

- **Authority rule loop verified**: Risk flag override and 10-run streak logic confirmed
- **Mode transitions verified**: HOLD → CANDIDATE → AUTO state machine tested
- **Gate exit mapping verified**: Exit codes 0/1/3 correspond to AUTO/CANDIDATE/FAIL-SAFE
- **Fail-safe verified**: Missing artifact triggers exit 3 without execution

### Drill Evidence

Stabilization drills archived in `ops/drills/`:
- `authority-mode-flip.txt`: violation → reset → 10x clean sequence
- `gate-auto.txt`: AUTO certification → exit 0
- `gate-candidate.txt`: CANDIDATE certification → exit 1
- `gate-missing-artifact.txt`: Missing artifact → exit 3

### Baseline State Definition

Internal neutral baseline:
```json
{
  "clean_streak": 0,
  "risk_flag": false,
  "execution_mode": "HOLD"
}
```

This baseline represents a fresh Authority state before any clean runs accumulate.

---

## Authority Commands

Authority operations (authority-repo or equivalent):

```bash
# Apply events to state
python update_state.py clean_run    # Increment clean streak
python update_state.py violation    # Set risk flag, reset streak
python update_state.py reset        # Clear all flags and streak

# Issue certification artifact
python issue_certification.py       # Outputs certification.json
```

---

## Gate Commands

Gate operations (pr-risk-guard or equivalent):

```bash
# Check certification and determine execution mode
python3 main.py --cert certification.json

# Exit codes:
# 0 = AUTO (proceed)
# 1 = CANDIDATE (block)
# 3 = FAIL-SAFE (missing artifact)
```

---

## CI Integration Flow

```
Authority → certification.json → Gate → exit code → CI decision
```

1. Authority evaluates state and issues certification
2. Gate reads certification artifact
3. Gate exits with mode-specific code
4. CI pipeline interprets exit code (0=pass, non-zero=fail)

---

## Operational Notes

- Certification schema is frozen (see `FREEZE_STATUS.md`)
- Topology registry is hashed and verified
- Rule loop is deterministic and reversible
- All mode transitions have been drilled and verified

---

## Version History

- **v1.0.0-internal-baseline** (2026-02-24): First stabilized chain with verified Authority→Gate→CI flow
