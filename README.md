<div align="center">

# Omar Bounawara

**BACKEND & DATA ENGINEERING &nbsp;·&nbsp; PYTHON &nbsp;·&nbsp; SYSTEMS**

Python engineer working on backend services and data pipelines. I check my work with tests, evaluation gates and benchmarks on real data. The projects below are a client pipeline for French legal announcements, a hosted risk-scoring prototype, a focused crawler and two tools written from scratch.

[GitHub](https://github.com/omarbounawarapy) · [LinkedIn](https://www.linkedin.com/in/omar-bounawara-py) · [Email](mailto:omar.bounawara.py@gmail.com)

**CONTRIBUTED TO**

<!-- One <a> per project, merged PRs only. Copy a line, change href, src and name. -->
<p>
  <a href="https://github.com/scrapy/scrapyd/pull/579"><img src="https://github.com/scrapy.png?size=96" height="48" alt="Scrapy" title="Scrapy (scrapyd)" /></a>&nbsp;&nbsp;
  <a href="https://github.com/unclecode/crawl4ai/pull/2327"><img src="https://raw.githubusercontent.com/unclecode/crawl4ai/main/deploy/docker/static/assets/crawl4ai-logo.png" height="48" alt="Crawl4AI" title="Crawl4AI" /></a>&nbsp;&nbsp;
  <a href="https://github.com/terrier-org/terrier-core/pull/271"><img src="https://github.com/terrier-org.png?size=96" height="48" alt="Terrier" title="Terrier" /></a>
</p>

</div>

---

## Selected work

### CrawlViz - focused web crawler

Decides link by link whether a page is worth fetching, so it does not crawl exhaustively.

> *What I learned: the time went into waiting on I/O, not computing, so the fix was a concurrent fetch path.*

`Python` `asyncio` `aiohttp` `lxml` `sentence-transformers` `FastAPI` `WebSockets` `React` `D3` `SQLite`

`50,828 links` → `539 explored` · `~40× faster` (600s → 15s on a 560-node benchmark) · `248 backend tests`

- Two-stage relevance cascade: a local sentence-embedding pass filters candidates in milliseconds, and only the ambiguous middle band goes to an LLM, which keeps cost and latency off the critical path.
- `asyncio` event bus (**57** typed events) coordinating **13** independent pipelines (fetch, extract, filter, score, prioritize, export, retry) with no direct calls between them.
- FastAPI control plane, WebSocket state streaming, and a React/D3 frontend that rebuilds its own state by replaying the event log, so it never depends on a live connection to reconstruct history.
- Declarative crawl blueprints define seeds, domains, extraction rules, scoring and stopping conditions.

**[View repository →](https://github.com/omarbounawarapy/CrawlViz)**

<br>

### GAAPWise - BODACC Intelligence Pipeline

![client engagement](https://img.shields.io/badge/-client_engagement-2d2d2d?style=flat-square)

Client engagement, August to September 2026, remote: an ETL and decision pipeline over public French legal-announcement data (BODACC), built solo and delivered as versioned releases (**0.1.0**, then **0.1.1** answering the client's written review).

> *What I learned: the suspected culprit for a slow run was the enrichment API. I measured it, ruled it out, and found per-record database commits instead.*

`Python` `asyncio` `SQLite` `YAML config` `pytest`

- Deterministic, config-driven classification and scoring with idempotent ingestion and reproducible decision records. No ML in the decision path, by design.
- Batching the per-record commits gave a measured **17×** end-to-end speedup on an identical re-run.
- Validated black-box on a month of real data (**318,962** records fetched, **0** errors); **161** requirements traced, **157** compliant, **4** documented deviations.

**[Watch the demo video →](https://drive.google.com/file/d/1pDHOMM-HOdADbsOL1z3_fMRcbcmwycKZ/view)**

<br>

### Wasel - cash-on-delivery refusal-risk scoring

![pre-startup team project](https://img.shields.io/badge/-pre--startup_team_project-2d2d2d?style=flat-square)

Product prototype for Tunisian e-commerce sellers who lose money on cash-on-delivery parcels refused at the door. Reads a customer chat in Darija, Arabizi or French, scores refusal risk, highlights the customer's own words as the reason, drafts the one question that lowers the risk, and rescores on reply. I assembled and led a five-person team (three other engineers and a content lead) and owned the AI/ML core.

> *The LLM reads the chat and code decides the number, so the model never picks the score.*

`Python` `FastAPI` `Pydantic` `SQLite` `XGBoost` `scikit-learn` `pytest` `GitHub Actions`

`347 tests` · `476-case evaluation gate` · `0 hallucinated quotes (offline)`

- The LLM only extracts facts, and every quote is verified against the source text. The score comes from a monotone-constrained XGBoost model plus config rules.
- Provider chain (Groq 120b, Groq 20b, Gemini, rules) with a circuit breaker, daily caps and deadlines, so an LLM outage never surfaces as an HTTP error. Prompts are hash-locked with one-step rollback.
- Prompt-injection guardrails and a three-layer check on outgoing drafts, plus a drift and faithfulness monitor.
- Uses synthetic data only. It is a working prototype with no production validation.

**[Live demo →](https://wasel.runs-on.dev)** <sub>runs read-only sample orders; free tier, may take about a minute to wake</sub>

<details>
<summary><strong>Team, leadership and engineering detail</strong></summary>

- Matched people to work that fit them (backend and WhatsApp I/O, frontend and infrastructure, and content and demos for a non-coding member), split the work by lane with folder-level ownership and frozen interface contracts, and delegated follow-up work as **25** written issues.
- Owned integration: `make check` (tests plus evaluation gate) was the merge criterion, with CI on every push.
- Signed WhatsApp Cloud API webhook (signature check, deduplication, delivery statuses) that fails closed.
- Analyzer for silent failures in agent conversations: **6** detectors (unsupported success claims, repeated questions, ignored tool errors and others) with evidence, confidence and a ranked issue list.
- Deployed on Render, with a Cloudflare Worker, container and R2 deployment kit; CI boots the app with no configuration and requires safe public defaults.
- The repository is private.

</details>

<br>

### Invoice Intake Automation Tool

CLI that turns semi-structured invoice PDFs (table or paragraph layout, mixed regional number formats) into validated, typed records.

`Python` `Pydantic` `pdfplumber` `Pandas` `pytest`

`209 regression tests` · `JSON / CSV / XLSX export`

A deterministic extraction and validation tool with no OCR, LLM or database.

**[View repository →](https://github.com/omarbounawarapy/invoice_intake_automation_tool)**

<br>

### IR Lab

Search engine framework implemented from scratch with no runtime dependencies (standard library only). Every experiment is a JSON config, every run is persisted and reproducible, and comparisons are statistically tested.

`Python` `pytest`

`42 tests` · `~2,500 source lines` · `CISI: 1,460 documents, 112 queries`

- Boolean retrieval over a positional inverted index (query parser, RPN evaluator, skip lists) and TF-IDF retrieval as a structurally different second model, with a composable analyzer pipeline built from JSON.
- Evaluation implemented in the framework: precision, recall, F1, MAP, MRR and nDCG@k, plus a paired t-test written from scratch (no SciPy).
- `compare_runs` refuses to compare two runs if anything other than the declared dimension differs, so a comparison cannot silently mix variables.
- Black-box case study through the public API found and fixed two defects: TF-IDF had no top-k cutoff (precision **0.0198** to **0.1473** at top 10), and Boolean retrieval crashed on punctuation-only terms.

**[View repository →](https://github.com/omarbounawarapy/IR-lab)**

## Open source

- **[scrapy/scrapyd#579](https://github.com/scrapy/scrapyd/pull/579)** (merged, October 2026): wrote the "Running as a Linux service" section of the deployment docs, covering a systemd unit, a dedicated user, restart policy and journal logging. Closes the maintainers' open documentation issue. Documentation only.
- **[unclecode/crawl4ai#2327](https://github.com/unclecode/crawl4ai/pull/2327)** (merged, October 2026): fixed proxy credentials containing `#`, `/`, `?` or `%` in the HTTP crawler by percent-encoding them once, decoded already-encoded proxy strings after maintainer review, and added pytest regression tests.
- **[terrier-org/terrier-core#271](https://github.com/terrier-org/terrier-core/pull/271)** (merged, October 2026): restored the TREC collection indexing examples in the docs after the project wiki went offline, recovering the configuration for ten test collections from archived copies. Closes the broken-links issue. Documentation only.

---

## Stack

**PRIMARY** &nbsp;<sub>daily use across projects</sub>

<p>
  <img src="https://skillicons.dev/icons?i=python" height="48" alt="Python" title="Python" />
  <img src="https://skillicons.dev/icons?i=fastapi" height="48" alt="FastAPI" title="FastAPI" />
  <img src="https://skillicons.dev/icons?i=sqlite" height="48" alt="SQLite" title="SQLite" />
  <img src="https://api.iconify.design/vscode-icons:file-type-sql.svg" height="48" width="48" alt="SQL" title="SQL" />
  <img src="https://skillicons.dev/icons?i=git" height="48" alt="Git" title="Git" />
  <img src="https://skillicons.dev/icons?i=linux" height="48" alt="Linux" title="Linux" />
  <img src="https://skillicons.dev/icons?i=githubactions" height="48" alt="GitHub Actions" title="GitHub Actions" />
  <img src="https://cdn.simpleicons.org/pytest" height="48" alt="pytest" title="pytest" />
</p>

**SECONDARY** &nbsp;<sub>used extensively within a specific project</sub>

<p>
  <img src="https://skillicons.dev/icons?i=react" height="48" alt="React" title="React" />
  <img src="https://skillicons.dev/icons?i=docker" height="48" alt="Docker" title="Docker" />
  <img src="https://cdn.simpleicons.org/aiohttp" height="48" alt="aiohttp" title="aiohttp" />
  <img src="https://cdn.simpleicons.org/pandas" height="48" alt="Pandas" title="Pandas" />
  <img src="https://cdn.simpleicons.org/apachespark" height="48" alt="PySpark" title="PySpark" />
  <img src="https://cdn.simpleicons.org/pydantic" height="48" alt="Pydantic" title="Pydantic" />
  <img src="https://cdn.simpleicons.org/scikitlearn" height="48" alt="scikit-learn" title="scikit-learn" />
  <img src="https://cdn.simpleicons.org/openrouter" height="48" alt="OpenRouter" title="OpenRouter" />
</p>

**EXPOSURE / TRAINING** &nbsp;<sub>coursework or project-level exposure, not production depth</sub>

<p>
  <img src="https://skillicons.dev/icons?i=js" height="48" alt="JavaScript" title="JavaScript" />
  <img src="https://skillicons.dev/icons?i=tailwind" height="48" alt="Tailwind CSS" title="Tailwind CSS" />
  <img src="https://skillicons.dev/icons?i=java" height="48" alt="Java" title="Java" />
  <img src="https://cdn.simpleicons.org/langchain" height="48" alt="LangChain" title="LangChain" />
  <img src="https://cdn.simpleicons.org/huggingface" height="48" alt="Hugging Face" title="Hugging Face" />
</p>

---

## Languages

<img src="https://flagcdn.com/w80/tn.png" width="30" align="top" alt="" /> &nbsp;**Arabic** · native<br>
<img src="https://flagcdn.com/w80/fr.png" width="30" align="top" alt="" /> &nbsp;**French** · fluent<br>
<img src="https://flagcdn.com/w80/gb.png" width="30" align="top" alt="" /> &nbsp;**English** · professional<br>

---

## Background

Licence en Ingénierie Réseaux et Systèmes (Computer Engineering), Institut Supérieur d'Informatique, Université de Tunis El Manar, 2023–2026.

Coursework spanning algorithms & complexity, distributed systems, databases, information retrieval, and AI. Final-year research-software-engineer project (2025–2026) is the source of CrawlViz above.

**TRAINING**

<img src="https://cdn.simpleicons.org/datacamp" height="20" align="top" alt="" /> &nbsp;DataCamp Associate AI Engineer for Developers<br>
<img src="https://cdn.simpleicons.org/datacamp" height="20" align="top" alt="" /> &nbsp;DataCamp Data Engineer with Python<br>
<img src="https://cdn.simpleicons.org/datacamp" height="20" align="top" alt="" /> &nbsp;DataCamp Associate Data Engineer in SQL<br>
<img src="https://cdn.simpleicons.org/nvidia" height="20" align="top" alt="" /> &nbsp;NVIDIA Building LLM Applications With Prompt Engineering<br>
