# Execution Boundary

Pre-execution authorization boundary for systems where actions have real-world consequences.

Deterministic evaluation. Pre-execution decision. Tamper-evident record.

---

## Canonical Structure

```
Layer 0  execution-boundary              ← this repo (architectural map)
Layer 1  execution-boundary-core-spec    ← structural contract
Layer 2  execution-gate                  ← reference implementation
Layer 2  agent-execution-guard           ← AI agent engine (ED25519, severity, HOLD)
Layer 3  execution-boundary-transport-profile  ← transport profile (ISO 8583, HTTP)
Layer 3  ai-execution-boundary-spec      ← AI application profile
```

One core. Multiple profiles. Same boundary pattern.

---

## Repositories

| Layer | Repo | What it defines |
|---|---|---|
| Contract | [execution-boundary-core-spec](https://github.com/Nick-heo-eg/execution-boundary-core-spec) | Envelope, Decision, Ledger, Evaluator — the structural definition |
| Implementation | [execution-gate](https://github.com/Nick-heo-eg/execution-gate) | Deterministic gate, fail-closed, YAML policy, Core Spec aligned |
| AI agent engine | [agent-execution-guard](https://github.com/Nick-heo-eg/agent-execution-guard) | ED25519 proof, 3-state severity gate, HOLD, LangChain adapter |
| Transport profile | [execution-boundary-transport-profile](https://github.com/Nick-heo-eg/execution-boundary-transport-profile) | ISO 8583, HTTP demos, Merkle ledger, canonical export |
| AI profile | [ai-execution-boundary-spec](https://github.com/Nick-heo-eg/ai-execution-boundary-spec) | AI application profile over Core Spec |

---

## Core Pattern

```
Envelope → evaluate() → Decision → Ledger → [ execute only if ALLOW ]
```

`evaluate()` is a pure function. No I/O. No randomness. No side effects.
The decision is recorded before execution — not after.

---

## Quickstart

**Transport gate demo (stdlib only, no setup):**
```bash
git clone https://github.com/Nick-heo-eg/execution-boundary-transport-profile
cd execution-boundary-transport-profile
python3 examples/iso8583/demo.py
python3 examples/http/demo.py
python3 -m pytest tests/ -v   # 28 tests
```

**AI agent guard:**
```bash
pip install agent-execution-guard
```
```python
from agent_execution_guard import ExecutionGuard, Intent, ALLOW_ALL

guard = ExecutionGuard()
result = guard.evaluate(Intent(actor="agent", action="wire_transfer",
                               payload="amount=50000"), policy=ALLOW_ALL)
```

---

## What This Is Not

- Not a firewall
- Not a heuristic guard
- Not a probabilistic policy layer
- Not post-hoc logging

→ **[Architecture definition](https://github.com/Nick-heo-eg/execution-boundary-transport-profile/blob/main/docs/03-architecture.md)**

---

## License

Apache 2.0
