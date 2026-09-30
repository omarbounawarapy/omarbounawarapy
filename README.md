<div align="center">

# Omar Bounawara

**Computer Engineering · Python · C++ · Systems**

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&size=15&duration=2800&pause=1400&color=8B8B8B&center=true&vCenter=true&width=560&lines=asyncio+%C2%B7+event-driven+backends;information+retrieval+%C2%B7+ranking;C%2B%2B+%C2%B7+competitive+programming" alt="rotating focus areas" />

Computer Engineering graduate (ISI, Université de Tunis El Manar). Most of what's below is either running code in this account or a documented, client-delivered pipeline I can speak to in detail but can't link publicly.

[GitHub](https://github.com/omarbounawarapy) · [Email](mailto:omar.bounawara.py@gmail.com)

</div>

<br>

Focus: asynchronous Python systems, LLM-backed pipelines with deterministic verification, information retrieval, automation, and competitive programming in C++.

---

## Selected work

### CrawlViz - focused web crawler

Decides, link by link, whether a page is worth fetching, instead of crawling exhaustively.

`Python` `asyncio` `aiohttp` `lxml` `sentence-transformers` `FastAPI` `WebSockets` `React` `D3` `SQLite`

`50,828 links` → `539 explored` · `~40× faster` (600s → 15s) · `57 typed events` · `123 backend tests`

- Two-stage relevance cascade: a local sentence-embedding pass filters candidates in milliseconds; only the ambiguous middle band goes to an LLM, keeping cost and latency off the critical path.
- `asyncio` event bus (**57** typed events) coordinating **13** independent pipelines (fetch, extract, filter, score, prioritize, export, retry) with no direct calls between them.
- FastAPI control plane, WebSocket state streaming, and a React/D3 frontend that rebuilds its own state by replaying the event log (checkpoint-assisted scrubbing, not a live-only view).

<details>
<summary><strong>Architecture and benchmark detail</strong></summary>

- Reference run: **50,828** links identified, **539** nodes explored (**~1%** retained for downstream exploration).
- Reworking the fetch path around `asyncio` took the same **560**-node benchmark from **~600s** to **~15s** wall-clock (**~40×**).
- Declarative crawl blueprints define seeds, domains, extraction rules, scoring, and stopping conditions.
- Explicit runtime state, retries, and structured exports; the frontend never depends on a live connection to reconstruct history.
- **123** backend tests.

**[View repository →](https://github.com/omarbounawarapy/CrawlViz)**

</details>

<br>

### GAAPWise - BODACC Intelligence Pipeline

![private client engagement](https://img.shields.io/badge/-private_client_engagement-2d2d2d?style=flat-square)

Client consulting engagement: ETL/decision system over public French legal-announcement data (BODACC), built solo end to end and delivered as versioned releases (**0.1.0**, then **0.1.1** answering the client's written review point by point).

`Python` `asyncio` `SQLite` `YAML config` `pytest`

`~39k Python lines` · `1,498 tests` · `17× measured speedup` · `161 requirements traced, 157 compliant`

- Deterministic, config-driven classification and scoring: **9** event classes, **6** scoring components, **4** priority bands, all externalized to YAML rather than hardcoded. No ML in the decision path, by design.
- Idempotent ingestion with SIREN-level identity resolution, provenance tracking, and versioned/immutable decision records so past outputs stay reproducible after rule changes.
- Root-caused a production slowdown to per-record DB commits rather than the enrichment API; batching commits gave a measured **17×** end-to-end speedup on an identical re-run.

<details>
<summary><strong>Engineering process and validation</strong></summary>

- Code-quality audit read the full source tree, not sampled: **27** findings (**0** critical, **2** high). Both high-severity issues fixed: an enrichment-provider exception gap that could crash a full run instead of degrading one record, and an unprotected export-write path fixed with atomic writes. Also closed a CSV/formula-injection risk in exported files.
- Specification-compliance audit traced **161** requirements (**157** compliant, **4** documented deviations, **0** non-compliant), preceded by an earlier red-team review cycle that raised **17** findings, all since resolved.
- Final acceptance ran black-box over **30** real days of production data (**2026-08-12** to **2026-09-11**): **318,962** records fetched, **114,705** classified and scored, **114,389** enriched, **524** flagged, **0** errors, in **34m30s**.
- Independent validation combined a one-week live-API simulation with a **12**-sample hand-reconstruction of real records checked against pipeline output; both found zero discrepancies.
- Concurrency and crash-recovery tests exercise real conditions rather than mocks: actual competing OS processes racing the lock file, actual SIGKILL mid-run.
- Packaging audit caught a real defect before delivery: a database schema file missing from package data, which would have made a built wheel crash on first use. Fixed and verified with a real build and fresh-environment install.
- Release **0.1.1** reworked the operator experience: one exit-code contract across all commands, plain-language failure causes with the exact recovery command, crash and Ctrl-C safety, and config edits that validate before writing and can be traced back from any exported row.
- Regression check on a real week (**82,614** announcements fetched, **32,385** candidates): **0** records differed from the previous release.
- Not on GitHub, private client codebase. Described here in prose because the engagement, not the code, is what can be shared.

</details>

<br>

### Wasel - cash-on-delivery refusal-risk scoring

![pre-startup team project](https://img.shields.io/badge/-pre--startup_team_project-2d2d2d?style=flat-square)

Product prototype for Tunisian e-commerce sellers who lose money on cash-on-delivery parcels refused at the door. Reads a customer chat in Darija, Arabizi or French, scores refusal risk, highlights the customer's own words as the reason, drafts the one question that lowers the risk, and rescores on reply. I assembled and led a four-person team and owned the AI/ML core, integration and merge gates.

`Python` `FastAPI` `Pydantic` `SQLite` `XGBoost` `scikit-learn` `pytest` `GitHub Actions`

`347 tests` · `476-case evaluation gate` · `0 hallucinated quotes (offline)` · `AUC 0.784 (synthetic holdout)`

- The LLM only extracts facts, and every quote is verified against the source text. The score comes from a monotone-constrained XGBoost model plus config rules, so the model never picks a number.
- Provider chain (Groq 120b, Groq 20b, Gemini, rules) with a circuit breaker, daily caps and deadlines, so an LLM outage never surfaces as an HTTP error. Prompts are hash-locked with one-step rollback.
- Prompt-injection guardrails and a three-layer check on outgoing drafts, with an evaluation gate in CI and a drift and faithfulness monitor on top.
- Built with synthetic data only; a working prototype, not a validated production model.

<details>
<summary><strong>Team, leadership and engineering detail</strong></summary>

- Matched people to work that fit them (backend and WhatsApp I/O, frontend and infrastructure, and content and demos for a non-coding member), split the work by lane with folder-level ownership and frozen interface contracts, and delegated follow-up work as **25** written issues.
- Owned integration: `make check` (tests plus evaluation gate) was the merge criterion, with CI on every push.
- Signed WhatsApp Cloud API webhook (signature check, deduplication, delivery statuses) that fails closed.
- Analyzer for silent failures in agent conversations: **6** detectors (unsupported success claims, repeated questions, ignored tool errors and others) with evidence, confidence and a ranked issue list.
- Deployed on Render and Cloudflare (Worker, container, R2); CI boots the app with no configuration and requires safe public defaults.
- Repository is private; the live demo runs read-only sample orders.

**[Live demo →](https://wasel-mc5y.onrender.com)** <sub>free tier, may take about a minute to wake</sub>

</details>

<br>

### Invoice Intake Automation Tool

CLI that turns semi-structured invoice PDFs (table or paragraph layout, mixed regional number formats) into validated, typed records.

`Python` `Pydantic` `pdfplumber` `Pandas` `pytest`

`200+ regression tests` · `JSON / CSV / XLSX export`

No OCR, no LLM, no database: deliberately scoped as a deterministic extraction/validation tool.

**[View repository →](https://github.com/omarbounawarapy/invoice_intake_automation_tool)**

<br>

### IR Lab

Search engine framework implemented from scratch with no runtime dependencies (standard library only). Every experiment is a JSON config, every run is persisted and reproducible, and comparisons are statistically tested instead of eyeballed.

`Python` `pytest`

`42 tests` · `~2,500 source lines` · `CISI: 1,460 documents, 112 queries`

- Boolean retrieval over a positional inverted index (query parser, RPN evaluator, skip lists) and TF-IDF retrieval as a structurally different second model, with a composable analyzer pipeline built from JSON.
- Evaluation implemented in the framework: precision, recall, F1, MAP, MRR and nDCG@k, plus a paired t-test written from scratch (no SciPy).
- `compare_runs` refuses to compare two runs if anything other than the declared dimension differs, so a comparison cannot silently mix variables.
- Black-box case study through the public API found and fixed two defects: TF-IDF had no top-k cutoff (precision **0.0198** to **0.1473** at top 10), and Boolean retrieval crashed on punctuation-only terms.

**[View repository →](https://github.com/omarbounawarapy/IR-lab)**

---

## Stack

**Primary** &nbsp;<sub>daily use, tested in production across projects</sub>

<p>
  <img src="https://skillicons.dev/icons?i=python,cpp,fastapi,sqlite,git,linux,githubactions" alt="Python, C++, FastAPI, SQLite, Git, Linux, GitHub Actions" />
  <img src="https://cdn.simpleicons.org/pytest" height="48" alt="pytest" title="pytest" />
</p>

**Secondary** &nbsp;<sub>used extensively within a specific project</sub>

<p>
  <img src="https://skillicons.dev/icons?i=react,docker" alt="React, Docker" />
  <img src="https://cdn.simpleicons.org/aiohttp" height="48" alt="aiohttp" title="aiohttp (asyncio-based fetch layer, CrawlViz)" />
  <img src="https://cdn.simpleicons.org/pandas" height="48" alt="Pandas" title="Pandas" />
  <img src="https://cdn.simpleicons.org/apachespark" height="48" alt="PySpark" title="PySpark (distributed data cleaning)" />
  <img src="https://cdn.simpleicons.org/pydantic" height="48" alt="Pydantic" title="Pydantic (Invoice Intake Tool, Wasel)" />
  <img src="https://cdn.simpleicons.org/scikitlearn" height="48" alt="scikit-learn" title="scikit-learn (Wasel)" />
  <img src="https://cdn.simpleicons.org/openrouter" height="48" alt="OpenRouter" title="OpenRouter (selective LLM routing, CrawlViz)" />
</p>

**Exposure / training** &nbsp;<sub>coursework or project-level exposure, not production depth</sub>

<p>
  <img src="https://skillicons.dev/icons?i=js,tailwind,java" alt="JavaScript, Tailwind, Java" />
  <img src="https://cdn.simpleicons.org/langchain" height="48" alt="LangChain" title="LangChain (training/exposure)" />
  <img src="https://cdn.simpleicons.org/huggingface" height="48" alt="Hugging Face" title="Hugging Face (training/exposure)" />
</p>

---

## Competitive programming

I do competitive programming in C++, mostly graph algorithms, dynamic programming, and data-structure-heavy problems.

---

## Background

Licence in Computer Engineering (Computer Systems Engineering, Networks & Systems), Institut Supérieur d'Informatique, Université de Tunis El Manar, 2023–2026.

Coursework spanning algorithms & complexity, distributed systems, databases, information retrieval, and AI. Final-year research-software-engineer project (2025–2026) is the source of CrawlViz above.

Training: DataCamp Associate AI Engineer for Developers, Data Engineer with Python, Associate Data Engineer in SQL; NVIDIA Building LLM Applications With Prompt Engineering.

---

<div align="center">

[GitHub](https://github.com/omarbounawarapy) · omar.bounawara.py@gmail.com

</div>
