# Layer Registry

Canonical layer definitions for the Execution Boundary project.

Every repository belongs to exactly one layer.
A new repository requires a layer assignment before creation.
If a layer cannot be identified, the work belongs in an existing repository or stays private.

---

## Layer Map

```
Layer 0  Conceptual Map
Layer 1  Core Contract
Layer 2  Runtime Enforcement
Layer 3  Agent SDK
Layer 4  Domain Profiles
```

---

## Repository Assignments

| Layer | Repository | Responsibility | Change Gate |
|---|---|---|---|
| 0 | [execution-boundary](https://github.com/Nick-heo-eg/execution-boundary) | Architectural map. Entry point. | README only |
| 1 | [execution-boundary-core-spec](https://github.com/Nick-heo-eg/execution-boundary-core-spec) | Structural contract: Envelope, Decision, Ledger, Evaluator | RFC required |
| 2 | [execution-gate](https://github.com/Nick-heo-eg/execution-gate) | Minimal reference implementation. Fail-closed. YAML policy. | Tests mandatory |
| 3 | [agent-execution-guard](https://github.com/Nick-heo-eg/agent-execution-guard) | AI agent engine. ED25519 proof. Severity gate. pip package. | Semver strict |
| 4 | [execution-boundary-transport-profile](https://github.com/Nick-heo-eg/execution-boundary-transport-profile) | Transport profile: ISO 8583, HTTP. Merkle ledger. | Compatibility check |
| 4 | [ai-execution-boundary-spec](https://github.com/Nick-heo-eg/ai-execution-boundary-spec) | AI application profile over Core Spec | Compatibility check |
| 4 | [execution-observability-profile](https://github.com/Nick-heo-eg/execution-observability-profile) | OTel observability profile. eb.* semantic conventions. Collector topology. Grafana dashboards. | Compatibility check |

### Adjacent

| Repository | Role | Notes |
|---|---|---|
| [ai-judgment-trail-spec](https://github.com/Nick-heo-eg/ai-judgment-trail-spec) | Decision log schema. OTel-aligned. | Independent spec |
| [stop-first-rag](https://github.com/Nick-heo-eg/stop-first-rag) | Judgment-first retrieval pattern | Independent |
| [semantic-conventions](https://github.com/Nick-heo-eg/semantic-conventions) | OTel semantic conventions | PR in progress |

---

## New Repository Checklist

Before creating a new public repository, answer all five:

1. Which layer does this belong to?
2. Does an existing repository already own this responsibility?
3. Is this a new layer, or an extension of an existing one?
4. Does the README first paragraph define what this is AND what it is not?
5. Does the README include at least one DENY case?

If any answer is unclear → keep private until resolved.
If this is a PoC or experiment → keep private permanently.

---

## Core Contract Freeze

`execution-boundary-core-spec` (Layer 1) is frozen.

- No implementation code
- No breaking changes to Envelope, Decision, or Ledger schema
- Extensions go in Layer 4 profiles
- Any change to Layer 1 requires explicit justification as an RFC

---

## Active Development

Three repositories receive active commits:

```
execution-gate                        Layer 2 — reference impl
agent-execution-guard                 Layer 3 — pip package
execution-boundary-transport-profile  Layer 4 — transport profile
execution-observability-profile       Layer 4 — OTel observability profile
```

All other repositories are **reference only** — no active development unless a specific gap is identified.

---

## Private Repository Policy

New private repositories: allowed for experiments.
Promotion to public: requires all five checklist items above.
Cleanup cadence: quarterly.
Archive criteria: 90 days no push + no downstream dependency.

