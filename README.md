<div align="center">

# Omar Bounawara

**Computer Engineering · Python · C++ · Systems**

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&size=15&duration=2800&pause=1400&color=8B8B8B&center=true&vCenter=true&width=560&lines=asyncio+%C2%B7+event-driven+backends;LLM+pipelines+%C2%B7+evaluation+gates;deterministic+ETL+%C2%B7+client+delivery;measure+first+%C2%B7+optimize+second;information+retrieval+%C2%B7+ranking;C%2B%2B+%C2%B7+competitive+programming" alt="rotating focus areas" />

I build systems that check their own work: pipelines with deterministic verification, evaluation gates, and measurements instead of guesses. Most of what's below is running code in this account, a live demo, or a client-delivered pipeline I can describe in detail but can't link publicly.

Computer Engineering at ISI, Université de Tunis El Manar.

[GitHub](https://github.com/omarbounawarapy) · [Email](mailto:omar.bounawara.py@gmail.com)

</div>

<br>

Focus: asynchronous Python systems, LLM-backed pipelines, information retrieval, automation, and competitive programming in C++.

---

## Selected work

### CrawlViz - focused web crawler

Decides, link by link, whether a page is worth fetching, instead of crawling exhaustively.

*What I learned: the time went into waiting on I/O, not computing. Making the fetch path concurrent cut the same 560-node benchmark from ~600s to ~15s.*

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

*What I learned: the suspected culprit for a slow run was the enrichment API. I measured it, ruled it out, and found per-record database commits instead.*

`Python` `asyncio` `SQLite` `YAML config` `pytest`

`~39k Python lines` · `1,498 tests` · `17× measured speedup` · `161 requirements traced, 157 compliant`

- Deterministic, config-driven classification and scoring: **9** event classes, **6** scoring components, **4** priority bands, all externalized to YAML rather than hardcoded. No ML in the decision path, by design.
- Idempotent ingestion with SIREN-level identity resolution, provenance tracking, and versioned/immutable decision records so past outputs stay reproducible after rule changes.
- Root-caused a production slowdown to per-record DB commits rather than the enrichment API; batching commits gave a measured **17×** end-to-end speedup on an identical re-run.

<details>
<summary><strong>Engineering process and validation</strong></summary>

- Code-quality audit read the full source tree, not sampled: **27** findings (**0** critical, **2** high). Both high-severity issues fixed: an enrichment-provider exception gap that could crash a full run instead of degrading one record, and an unprotected export-write path fixed with atomic writes. Also closed a CSV/formula-injection risk in exported files.
- Specification-compliance audit traced **161** requirements (**157** compliant, **4** documented deviations, **0** non-compliant), preceded by an earlier red-team review cycle that raised **17** findings, all since resolved.
- Final acceptance ran black-box over a full month of real production data (**2026-08-12** to **2026-09-11**): **318,962** records fetched, **114,705** classified and scored, **114,389** enriched, **524** flagged, **0** errors, in **34m30s**.
- Independent validation combined a one-week live-API simulation with a **12**-sample hand-reconstruction of real records checked against pipeline output; both found zero discrepancies.
- Concurrency and crash-recovery tests exercise real conditions rather than mocks: actual competing OS processes racing the lock file, actual SIGKILL mid-run.
- Packaging audit caught a real defect before delivery: a database schema file missing from package data, which would have made a built wheel crash on first use. Fixed and verified with a real build and fresh-environment install.
- Release **0.1.1** reworked the operator experience: one exit-code contract across all commands, plain-language failure causes with the exact recovery command, crash and Ctrl-C safety, and config edits that validate before writing and can be traced back from any exported row.
- Regression check on a real week (**82,614** announcements fetched, **32,385** candidates): **0** records differed from the previous release.
- Not on GitHub, private client codebase. Described here in prose because the engagement, not the code, is what can be shared.

</details>

<br>

### [Wasel](https://wasel-mc5y.onrender.com) - cash-on-delivery refusal-risk scoring

![pre-startup team project](https://img.shields.io/badge/-pre--startup_team_project-2d2d2d?style=flat-square)

Product prototype for Tunisian e-commerce sellers who lose money on cash-on-delivery parcels refused at the door. Reads a customer chat in Darija, Arabizi or French, scores refusal risk, highlights the customer's own words as the reason, drafts the one question that lowers the risk, and rescores on reply. I assembled and led a four-person team and owned the AI/ML core, integration and merge gates.

*The LLM reads the chat and code decides the number, so the model never picks the score.*

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

Deliberately scoped as a deterministic extraction and validation tool, with no OCR, no LLM and no database.

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

## How I work

- **Measure before optimizing.** The **17×** GAAPWise speedup and the **~40×** CrawlViz speedup both started from a benchmark.
- **Verify the model, don't trust it.** In Wasel the LLM extracts and code checks every quote and computes the score.
- **Test the real thing.** Real OS processes racing a lock file, a real SIGKILL mid-run, black-box acceptance runs on a month of real data.
- **Compare honestly.** IR Lab refuses to compare two runs that differ in more than one thing, and its own black-box case study found and fixed defects in my code.

---

## Stack

**Languages**

<p>
  <img src="https://skillicons.dev/icons?i=python" height="48" alt="Python" title="Python" />
  <img src="https://skillicons.dev/icons?i=cpp" height="48" alt="C++" title="C++" />
  <img src="https://skillicons.dev/icons?i=java" height="48" alt="Java" title="Java" />
  <img src="https://skillicons.dev/icons?i=js" height="48" alt="JavaScript" title="JavaScript" />
  <img src="https://api.iconify.design/vscode-icons:file-type-sql.svg" height="48" alt="SQL" title="SQL" />
</p>

**Databases**

<p>
  <img src="https://skillicons.dev/icons?i=postgres" height="48" alt="PostgreSQL" title="PostgreSQL" />
  <img src="https://skillicons.dev/icons?i=oracle" height="48" alt="Oracle" title="Oracle" />
  <img src="https://skillicons.dev/icons?i=sqlite" height="48" alt="SQLite" title="SQLite" />
</p>

**Backend and tooling**

<p>
  <img src="https://skillicons.dev/icons?i=fastapi" height="48" alt="FastAPI" title="FastAPI" />
  <img src="https://cdn.simpleicons.org/aiohttp" height="48" alt="aiohttp" title="aiohttp" />
  <img src="https://cdn.simpleicons.org/pydantic" height="48" alt="Pydantic" title="Pydantic" />
  <img src="https://cdn.simpleicons.org/pytest" height="48" alt="pytest" title="pytest" />
  <img src="https://skillicons.dev/icons?i=docker" height="48" alt="Docker" title="Docker" />
  <img src="https://skillicons.dev/icons?i=linux" height="48" alt="Linux" title="Linux" />
  <img src="https://skillicons.dev/icons?i=git" height="48" alt="Git" title="Git" />
  <img src="https://skillicons.dev/icons?i=githubactions" height="48" alt="GitHub Actions" title="GitHub Actions" />
</p>

**Data**

<p>
  <img src="https://cdn.simpleicons.org/pandas" height="48" alt="Pandas" title="Pandas" />
  <img src="https://cdn.simpleicons.org/apachespark" height="48" alt="PySpark" title="PySpark" />
  <img src="https://cdn.simpleicons.org/scikitlearn" height="48" alt="scikit-learn" title="scikit-learn" />
</p>

**Frontend**

<p>
  <img src="https://skillicons.dev/icons?i=react" height="48" alt="React" title="React" />
  <img src="https://skillicons.dev/icons?i=tailwind" height="48" alt="Tailwind CSS" title="Tailwind CSS" />
</p>

**LLMs and AI**

<p>
  <img src="https://cdn.simpleicons.org/openrouter" height="48" alt="OpenRouter" title="OpenRouter" />
  <img src="https://cdn.simpleicons.org/langchain" height="48" alt="LangChain" title="LangChain" />
  <img src="https://cdn.simpleicons.org/huggingface" height="48" alt="Hugging Face" title="Hugging Face" />
</p>

---

## Competitive programming

I do competitive programming in C++, mostly graph algorithms, dynamic programming, and data-structure-heavy problems. It's how I keep algorithms and complexity sharp.

---

## Languages

<img src="https://flagcdn.com/w80/tn.png" width="30" align="top" alt="" /> &nbsp;**Arabic** · native<br>
<img src="https://flagcdn.com/w80/fr.png" width="30" align="top" alt="" /> &nbsp;**French** · fluent<br>
<img src="https://flagcdn.com/w80/gb.png" width="30" align="top" alt="" /> &nbsp;**English** · professional<br>

---

## Background

Licence in Computer Engineering (Computer Systems Engineering, Networks & Systems), Institut Supérieur d'Informatique, Université de Tunis El Manar, 2023–2026.

Coursework spanning algorithms & complexity, distributed systems, databases, information retrieval, and AI. Final-year research-software-engineer project (2025–2026) is the source of CrawlViz above.

**Training**

<img src="https://cdn.simpleicons.org/datacamp" height="20" align="top" alt="" /> &nbsp;DataCamp Associate AI Engineer for Developers<br>
<img src="https://cdn.simpleicons.org/datacamp" height="20" align="top" alt="" /> &nbsp;DataCamp Data Engineer with Python<br>
<img src="https://cdn.simpleicons.org/datacamp" height="20" align="top" alt="" /> &nbsp;DataCamp Associate Data Engineer in SQL<br>
<img src="https://cdn.simpleicons.org/nvidia" height="20" align="top" alt="" /> &nbsp;NVIDIA Building LLM Applications With Prompt Engineering<br>

---

<div align="center">

[GitHub](https://github.com/omarbounawarapy) · omar.bounawara.py@gmail.com

</div>
