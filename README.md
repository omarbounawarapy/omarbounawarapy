### Omar Bounawara

Computer Engineering graduate (ISI, Université de Tunis El Manar) building Python systems around asynchronous I/O, information retrieval, and data pipelines. C++ for algorithms and competitive programming.

Most of what's below is either running code in this account or a documented, client-delivered pipeline I can speak to in detail but can't link publicly.

**Currently:** working on CrawlViz (focused web crawling, below) and rebuilding competitive-programming fundamentals in C++ from a clean Codeforces handle.

---

### Selected work

**[CrawlViz](https://github.com/omarbounawarapy/CrawlViz)**, a topic-focused web crawler that decides, link by link, whether a page is worth fetching, instead of crawling exhaustively.
- Two-stage relevance cascade: a local sentence-embedding pass filters candidates in milliseconds, and only the ambiguous middle band is sent to an LLM, keeping cost and latency off the critical path.
- `asyncio` event bus (57 typed events) coordinating ~12 independent pipeline stages (fetch, extract, filter, score, prioritize, export, retry) with no direct calls between them.
- FastAPI control plane, WebSocket state streaming, and a React/D3 frontend that rebuilds its own state by replaying the event log (checkpoint-assisted scrubbing, not a live-only view).
- Reference run: 50,828 links identified, 539 nodes explored (~1% retained). Reworking the fetch path around `asyncio` took the same 560-node benchmark from ~600s to ~15s (~40x wall-clock).
- Python, asyncio, aiohttp, lxml, sentence-transformers, FastAPI, WebSockets, React, SQLite. 123 backend tests.

**GAAPWise, BODACC Intelligence Pipeline** *(private client engagement, not on GitHub)*
Freelance ETL/decision system over public French legal-announcement data (BODACC), built solo end to end.
- Deterministic, config-driven classification and scoring: 9 event classes, 6 scoring components, 4 priority bands, all externalized to YAML rather than hardcoded. No ML in the decision path by design.
- Idempotent ingestion with SIREN-level identity resolution, provenance tracking, and versioned/immutable decision records so past outputs stay reproducible after rule changes.
- ~28k lines of Python (60 source modules), ~1,000 tests including real OS-level concurrency and crash-recovery tests (actual competing processes, actual SIGKILL).
- Root-caused a production slowdown to per-record DB commits instead of the enrichment API; batching commits gave a measured 17x end-to-end speedup on an identical re-run.
- Independent spec-compliance audit: 161 requirements traced, 157 compliant, 4 documented deviations, 0 non-compliant.

**[Invoice Intake Automation Tool](https://github.com/omarbounawarapy/invoice_intake_automation_tool)**, a CLI that turns semi-structured invoice PDFs (table or paragraph layout, mixed regional number formats) into validated, typed records exported to JSON/CSV/XLSX.
- No OCR, no LLM, no database: deliberately scoped as a deterministic extraction/validation tool. Pydantic schemas, 200+ regression tests across layouts and locales.

**[IR Lab](https://github.com/omarbounawarapy/IR-lab)**, information retrieval built from first principles: document/query models, analyzers, inverted-index abstractions, Boolean retrieval, and evaluation scaffolding, kept deliberately separate from any framework.

---

### Stack

<p> <img src="https://skillicons.dev/icons?i=python,cpp,fastapi,react,sqlite,linux,git,docker" alt="Python, C++, FastAPI, React, SQLite, Linux, Git, Docker" /> </p>

`asyncio` · `aiohttp` · WebSockets · Pandas · pytest · PySpark (batch/distributed data cleaning)

---

### Competitive programming

Restarted from a clean handle in C++: **68 problems solved in the first 9 days**, no imported history.

<p>
  <a href="https://codeforces.com/profile/Omar_Bounawara"><img src="https://cfrating.baoshuo.dev/rating?username=Omar_Bounawara" alt="Omar_Bounawara's Codeforces rating" /></a>
</p>

Graph algorithms, dynamic programming, and data-structure-heavy problems, most days. [codeforces.com/profile/Omar_Bounawara](https://codeforces.com/profile/Omar_Bounawara)

Earlier profile, prior account: [codeforces.com/profile/OMAR-SOLO](https://codeforces.com/profile/OMAR-SOLO) (max rating 1159).

---

### Background

Licence in Computer Engineering (Computer Systems Engineering, Networks & Systems), Institut Supérieur d'Informatique, Université de Tunis El Manar, 2023-2026.

Coursework spanning algorithms & complexity, distributed systems, databases, information retrieval, and AI. Final-year research-software-engineer project (2025-2026) is the source of CrawlViz above.

---

[LinkedIn](https://www.linkedin.com/in/omar-bounawara-py) · [Codeforces](https://codeforces.com/profile/Omar_Bounawara) · omar.bounawara.py@gmail.com
