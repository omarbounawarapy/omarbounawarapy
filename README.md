<div align="center">

# Omar Bounawara

**Computer Engineering · Python · C++ · Systems**

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&size=15&duration=2800&pause=1400&color=8B8B8B&center=true&vCenter=true&width=560&lines=asyncio+%C2%B7+event-driven+backends;information+retrieval+%C2%B7+ranking;C%2B%2B+%C2%B7+competitive+programming" alt="rotating focus areas" />

Computer Engineering graduate (ISI, Université de Tunis El Manar). Most of what's below is either running code in this account or a documented, client-delivered pipeline I can speak to in detail but can't link publicly.

[LinkedIn](https://www.linkedin.com/in/omar-bounawara-py) · [Codeforces](https://codeforces.com/profile/Omar_Bounawara) · [Email](mailto:omar.bounawara.py@gmail.com)

</div>

<br>

Focus: asynchronous Python systems, information retrieval, automation, and competitive programming in C++.

---

## Selected work

### CrawlViz - focused web crawler

Decides, link by link, whether a page is worth fetching, instead of crawling exhaustively.

`Python` `asyncio` `aiohttp` `lxml` `sentence-transformers` `FastAPI` `WebSockets` `React` `D3` `SQLite`

`50,828 links` → `539 explored` · `~40× faster` (600s → 15s) · `57 typed events` · `123 backend tests`

- Two-stage relevance cascade: a local sentence-embedding pass filters candidates in milliseconds; only the ambiguous middle band goes to an LLM, keeping cost and latency off the critical path.
- `asyncio` event bus (57 typed events) coordinating ~12 independent pipeline stages (fetch, extract, filter, score, prioritize, export, retry) with no direct calls between them.
- FastAPI control plane, WebSocket state streaming, and a React/D3 frontend that rebuilds its own state by replaying the event log (checkpoint-assisted scrubbing, not a live-only view).

<details>
<summary><strong>Architecture and benchmark detail</strong></summary>

- Reference run: 50,828 links identified, 539 nodes explored (~1% retained for downstream exploration).
- Reworking the fetch path around `asyncio` took the same 560-node benchmark from ~600s to ~15s wall-clock (~40×).
- Declarative crawl blueprints define seeds, domains, extraction rules, scoring, and stopping conditions.
- Explicit runtime state, retries, and structured exports; the frontend never depends on a live connection to reconstruct history.
- 123 backend tests.

**[View repository →](https://github.com/omarbounawarapy/CrawlViz)**

</details>

<br>

### GAAPWise - BODACC Intelligence Pipeline

![private client engagement](https://img.shields.io/badge/-private_client_engagement-2d2d2d?style=flat-square)

Freelance ETL/decision system over public French legal-announcement data (BODACC), built solo end to end.

`Python` `asyncio` `SQLite` `YAML config` `pytest`

`~28k Python lines` · `~1,000 tests` · `17× measured speedup` · `161 requirements traced, 157 compliant`

- Deterministic, config-driven classification and scoring: 9 event classes, 6 scoring components, 4 priority bands, all externalized to YAML rather than hardcoded. No ML in the decision path, by design.
- Idempotent ingestion with SIREN-level identity resolution, provenance tracking, and versioned/immutable decision records so past outputs stay reproducible after rule changes.
- Root-caused a production slowdown to per-record DB commits rather than the enrichment API; batching commits gave a measured 17× end-to-end speedup on an identical re-run.

<details>
<summary><strong>Scale and validation detail</strong></summary>

- ~28k lines of Python across 60 source modules, ~1,000 tests including real OS-level concurrency tests (actual competing processes) and real crash-recovery tests (actual SIGKILL mid-run).
- Independent spec-compliance audit: 161 requirements traced, 157 compliant, 4 documented deviations, 0 non-compliant.
- Not on GitHub, private client codebase. Described here in prose because the engagement, not the code, is what can be shared.

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

Information retrieval built from first principles: document/query models, analyzers, inverted-index abstractions, Boolean retrieval, and evaluation scaffolding, kept deliberately separate from any framework.

`Python`

**[View repository →](https://github.com/omarbounawarapy/IR-lab)**

---

## Stack

**Primary** &nbsp;<sub>daily use, tested in production across projects</sub>

<p>
  <img src="https://skillicons.dev/icons?i=python,cpp,fastapi,sqlite,git,linux" alt="Python, C++, FastAPI, SQLite, Git, Linux" />
  <img src="https://cdn.simpleicons.org/pytest" height="48" alt="pytest" title="pytest" />
</p>

**Secondary** &nbsp;<sub>used extensively within a specific project</sub>

<p>
  <img src="https://skillicons.dev/icons?i=react,docker" alt="React, Docker" />
  <img src="https://cdn.simpleicons.org/aiohttp" height="48" alt="aiohttp" title="aiohttp (asyncio-based fetch layer, CrawlViz)" />
  <img src="https://cdn.simpleicons.org/pandas" height="48" alt="Pandas" title="Pandas" />
  <img src="https://cdn.simpleicons.org/apachespark" height="48" alt="PySpark" title="PySpark (distributed data cleaning)" />
  <img src="https://cdn.simpleicons.org/pydantic" height="48" alt="Pydantic" title="Pydantic (Invoice Intake Tool)" />
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

<p>
  <a href="https://codeforces.com/profile/Omar_Bounawara"><img src="https://cfrating.baoshuo.dev/rating?username=Omar_Bounawara" alt="Omar_Bounawara's Codeforces rating" /></a>
</p>

Active on a clean Codeforces handle, mostly graph algorithms, dynamic programming, and data-structure-heavy problems in C++. [codeforces.com/profile/Omar_Bounawara](https://codeforces.com/profile/Omar_Bounawara)

<details>
<summary>Earlier account and progress notes</summary>

Prior handle: [codeforces.com/profile/OMAR-SOLO](https://codeforces.com/profile/OMAR-SOLO) (max rating 1159). Restarted from a clean handle with no imported history, 68 problems solved in the first 9 days.

</details>

---

## Background

Licence in Computer Engineering (Computer Systems Engineering, Networks & Systems), Institut Supérieur d'Informatique, Université de Tunis El Manar, 2023–2026.

Coursework spanning algorithms & complexity, distributed systems, databases, information retrieval, and AI. Final-year research-software-engineer project (2025–2026) is the source of CrawlViz above.

---

<div align="center">

[LinkedIn](https://www.linkedin.com/in/omar-bounawara-py) · [Codeforces](https://codeforces.com/profile/Omar_Bounawara) · omar.bounawara.py@gmail.com

</div>
