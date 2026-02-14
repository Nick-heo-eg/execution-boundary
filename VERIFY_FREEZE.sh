#!/usr/bin/env bash
#
# VERIFY_FREEZE.sh - Public Freeze Integrity Verification
# Verifies freeze integrity using ONLY public information (no echo-core-private access)
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="${SCRIPT_DIR}/artifacts/public-verify-logs"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="${LOG_DIR}/verify-${TIMESTAMP}.log"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Create log directory
mkdir -p "${LOG_DIR}"

# Redirect all output to both console and log file
exec > >(tee -a "${LOG_FILE}")
exec 2>&1

echo "========================================"
echo "Public Freeze Integrity Verification"
echo "========================================"
echo ""
echo "⚠️  PUBLIC DEFENSIVE VERIFICATION ONLY"
echo ""
echo "This script verifies freeze integrity using"
echo "ONLY public documents in this repository."
echo ""
echo "It does NOT:"
echo "  - Access canonical source (echo-core-private)"
echo "  - Validate engine integrity"
echo "  - Provide authoritative verification"
echo ""
echo "Role: Detect desynchronization (defensive)"
echo "Authority: echo-core-private (canonical)"
echo ""
echo "See TRUST_BOUNDARY.md for complete trust model."
echo ""
echo "========================================"
echo "Timestamp: $(date +'%Y-%m-%d %H:%M:%S %Z')"
echo "Log: ${LOG_FILE}"
echo ""

FAILED=0

# ==============================================================================
# CHECK 1: Registry Hash Public Value Confirmation
# ==============================================================================

echo "----------------------------------------"
echo "Check 1: Registry Hash Public Value"
echo "----------------------------------------"

if [ ! -f "${SCRIPT_DIR}/FREEZE_STATUS.md" ]; then
    echo "❌ FAIL: FREEZE_STATUS.md not found"
    FAILED=1
else
    FREEZE_HASH=$(grep "Registry Hash:" "${SCRIPT_DIR}/FREEZE_STATUS.md" | sed 's/.*`\(.*\)`.*/\1/')

    if [ -z "$FREEZE_HASH" ]; then
        echo "❌ FAIL: Registry hash not found in FREEZE_STATUS.md"
        FAILED=1
    else
        echo "Registry Hash (FREEZE_STATUS.md): $FREEZE_HASH"

        # Validate hash format (64 hex chars)
        if [[ "$FREEZE_HASH" =~ ^[a-f0-9]{64}$ ]]; then
            echo "✅ PASS: Registry hash format valid"
        else
            echo "❌ FAIL: Invalid registry hash format"
            FAILED=1
        fi
    fi
fi

echo ""

# ==============================================================================
# CHECK 2: README Footer Hash Extraction
# ==============================================================================

echo "----------------------------------------"
echo "Check 2: README Footer Hash Extraction"
echo "----------------------------------------"

if [ ! -f "${SCRIPT_DIR}/README.md" ]; then
    echo "❌ FAIL: README.md not found"
    FAILED=1
else
    README_HASH=$(grep "Registry Hash:" "${SCRIPT_DIR}/README.md" | sed 's/.*Registry Hash: \([a-f0-9]*\).*/\1/')

    if [ -z "$README_HASH" ]; then
        echo "❌ FAIL: Registry hash not found in README footer"
        FAILED=1
    else
        echo "README Footer Hash: $README_HASH"

        # Validate hash format (8 hex chars)
        if [[ "$README_HASH" =~ ^[a-f0-9]{8}$ ]]; then
            echo "✅ PASS: README footer hash format valid"
        else
            echo "❌ FAIL: Invalid README footer hash format"
            FAILED=1
        fi
    fi
fi

echo ""

# ==============================================================================
# CHECK 3: Protocol Version Confirmation (via FREEZE_STATUS.md)
# ==============================================================================

echo "----------------------------------------"
echo "Check 3: Protocol Version Confirmation"
echo "----------------------------------------"

if [ ! -f "${SCRIPT_DIR}/FREEZE_STATUS.md" ]; then
    echo "❌ FAIL: FREEZE_STATUS.md not found"
    FAILED=1
else
    # Extract timestamp to verify freeze was executed
    FREEZE_TIMESTAMP=$(grep "Freeze Timestamp:" "${SCRIPT_DIR}/FREEZE_STATUS.md" | sed 's/.*Freeze Timestamp:\*\* \(.*\)/\1/')

    if [ -z "$FREEZE_TIMESTAMP" ]; then
        echo "❌ FAIL: Freeze timestamp not found"
        FAILED=1
    else
        echo "Freeze Timestamp: $FREEZE_TIMESTAMP"
        echo "✅ PASS: Freeze timestamp present"
    fi
fi

echo ""

# ==============================================================================
# CHECK 4: FREEZE_STATUS.md Registry Hash Cross-Verification
# ==============================================================================

echo "----------------------------------------"
echo "Check 4: Registry Hash Cross-Verification"
echo "----------------------------------------"

if [ -n "${FREEZE_HASH:-}" ] && [ -n "${README_HASH:-}" ]; then
    # Extract first 8 chars from FREEZE_STATUS.md hash
    FREEZE_HASH_PREFIX="${FREEZE_HASH:0:8}"

    echo "FREEZE_STATUS.md Hash Prefix: $FREEZE_HASH_PREFIX"
    echo "README Footer Hash:           $README_HASH"

    if [ "$FREEZE_HASH_PREFIX" = "$README_HASH" ]; then
        echo "✅ PASS: Registry hash synchronized across public documents"
    else
        echo "❌ FAIL: Registry hash mismatch detected"
        echo "  Expected: $FREEZE_HASH_PREFIX (from FREEZE_STATUS.md)"
        echo "  Got:      $README_HASH (from README.md)"
        FAILED=1
    fi
else
    echo "❌ FAIL: Cannot perform cross-verification (missing hash values)"
    FAILED=1
fi

echo ""

# ==============================================================================
# CHECK 5: ENGINE_TRUST_MODEL.md Hierarchy Validation
# ==============================================================================

echo "----------------------------------------"
echo "Check 5: Trust Model Hierarchy Validation"
echo "----------------------------------------"

if [ ! -f "${SCRIPT_DIR}/ENGINE_TRUST_MODEL.md" ]; then
    echo "❌ FAIL: ENGINE_TRUST_MODEL.md not found"
    FAILED=1
else
    # Verify key trust model components are documented
    CHECKS=(
        "Layer 1.*Engine Hash Validity"
        "Layer 2.*Protocol Correctness"
        "Layer 3.*Structure Integrity"
        "Layer 4.*System Trust"
        "engine_root_hash:"
    )

    TRUST_MODEL_OK=1
    for CHECK in "${CHECKS[@]}"; do
        if grep -q "$CHECK" "${SCRIPT_DIR}/ENGINE_TRUST_MODEL.md"; then
            echo "  ✓ Found: $CHECK"
        else
            echo "  ✗ Missing: $CHECK"
            TRUST_MODEL_OK=0
        fi
    done

    if [ $TRUST_MODEL_OK -eq 1 ]; then
        echo "✅ PASS: Trust model hierarchy documented"
    else
        echo "❌ FAIL: Trust model hierarchy incomplete"
        FAILED=1
    fi
fi

echo ""

# ==============================================================================
# CHECK 6: PROTOCOL_COMPATIBILITY.md Lineage Verification
# ==============================================================================

echo "----------------------------------------"
echo "Check 6: Protocol Compatibility Lineage"
echo "----------------------------------------"

if [ ! -f "${SCRIPT_DIR}/PROTOCOL_COMPATIBILITY.md" ]; then
    echo "⚠️  WARNING: PROTOCOL_COMPATIBILITY.md not found"
    echo "  (Non-critical: lineage verification skipped)"
else
    if grep -q "LINEAGE CONFIRMED" "${SCRIPT_DIR}/PROTOCOL_COMPATIBILITY.md"; then
        echo "✅ PASS: Protocol lineage confirmed"
    else
        echo "⚠️  WARNING: Protocol lineage status unclear"
    fi
fi

echo ""

# ==============================================================================
# FINAL RESULT
# ==============================================================================

echo "========================================"
if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}VERIFICATION: PASS${NC}"
    echo "========================================"
    echo ""
    echo "Public freeze integrity verified."
    echo "All checks passed using only public information."
    echo ""
    echo "Summary:"
    echo "  ✅ Registry hash format valid"
    echo "  ✅ README footer hash format valid"
    echo "  ✅ Registry hash synchronized"
    echo "  ✅ Freeze timestamp present"
    echo "  ✅ Trust model hierarchy documented"
    echo ""
    exit 0
else
    echo -e "${RED}VERIFICATION: FAIL${NC}"
    echo "========================================"
    echo ""
    echo "Public freeze integrity verification FAILED."
    echo "One or more checks did not pass."
    echo ""
    echo "This indicates:"
    echo "  - Manual modification of public documents"
    echo "  - Desynchronization between canonical and public state"
    echo "  - Incomplete freeze execution"
    echo ""
    echo "Review log for details: ${LOG_FILE}"
    echo ""
    exit 1
fi
