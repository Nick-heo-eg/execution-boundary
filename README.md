# Execution Boundary

Pre-execution judgment gate for AI systems.
Deterministic STOP / HOLD / ALLOW before runtime.

AI proposes → Gate decides → execution proceeds only if allowed.
All decisions are logged in an append-only trail.

<!-- TODO: Replace with actual terminal recording (asciinema or GIF) -->
<!-- 2-second demo: clone → run → STOP appears -->

```
    AI Output
        │
        ▼
┌───────────────────┐
│  Judgment Gate    │
│ STOP / HOLD / ... │──▶ decision_log.jsonl (append-only)
│      ALLOW        │
└─────────┬─────────┘
          │
          ▼
        ALLOW?
          │
    ┌─────┴─────┐
   NO          YES
    │            │
    ▼            ▼
 blocked     execution
 & logged    proceeds
```

---

## Repositories

| Layer               | Repo                         | What it does                               | Try it                             |
| ------------------- | ---------------------------- | ------------------------------------------ | ---------------------------------- |
| Log Schema          | [ai-judgment-trail-spec](https://github.com/Nick-heo-eg/ai-judgment-trail-spec)       | 9-field decision log format, OTel-aligned  | `python3 examples/run_ajt_demo.py` |
| Governance Standard | [ai-execution-boundary-spec](https://github.com/Nick-heo-eg/ai-execution-boundary-spec)   | Role separation, conformance levels (AEBS) | Read `AEBS_SPEC.md`                |
| Runtime Lab         | [execution-runtime-lab](https://github.com/Nick-heo-eg/execution-runtime-lab)        | Experimental execution gates               | `npm install && npm run verify`    |
| Demo                | [telegram-judgment-demo-proof](https://github.com/Nick-heo-eg/telegram-judgment-demo-proof) | Live STOP/HOLD proof via Telegram          | See repo README                    |

---

## Quickstart (2 minutes)

**See a judgment trail:**
```bash
git clone https://github.com/Nick-heo-eg/ai-judgment-trail-spec
cd ai-judgment-trail-spec
python3 examples/run_ajt_demo.py
```

Output:
```
Decision: STOP
Reason: missing_citation
Risk Level: high
Rule: R1_REQUIRE_EVIDENCE
→ AI output blocked. No hallucination generated.
```

**See execution gating:**
```bash
git clone https://github.com/Nick-heo-eg/execution-runtime-lab
cd execution-runtime-lab
npm install && npm run verify
```

Output: 8/8 adversarial attempts blocked, all decisions logged to `decision_log.jsonl`.

---

## How the pieces connect

```
ai-judgment-trail-spec          ← what gets logged (schema)
        │                          https://github.com/Nick-heo-eg/ai-judgment-trail-spec
ai-execution-boundary-spec     ← structural rules (standard)
        │                          https://github.com/Nick-heo-eg/ai-execution-boundary-spec
execution-runtime-lab           ← experimental gate
        │                          https://github.com/Nick-heo-eg/execution-runtime-lab
telegram-judgment-demo-proof    ← live proof
                                   https://github.com/Nick-heo-eg/telegram-judgment-demo-proof
```

---

## Related

AJT decision logs align with [OpenTelemetry](https://github.com/open-telemetry/semantic-conventions) trace semantics.
Proposals: [Issue #3244](https://github.com/open-telemetry/semantic-conventions/issues/3244) · [PR #3336](https://github.com/open-telemetry/semantic-conventions/pull/3336)

---

## License

Apache 2.0
