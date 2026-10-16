<div align="center">

# Omar Bounawara

**BACKEND & DATA ENGINEERING &nbsp;·&nbsp; PYTHON &nbsp;·&nbsp; SYSTEMS**

I build backend services and data pipelines in Python, and I like checking them against real data.

[GitHub](https://github.com/omarbounawarapy) · [LinkedIn](https://www.linkedin.com/in/omar-bounawara-py) · [Email](mailto:omar.bounawara.py@gmail.com)

</div>

## Things I've built

### CrawlViz <sub>research project</sub>

A crawler that picks which links are worth following. On one run it explored 539 of 50,828 links.

- Cheap embedding filter first, LLM only for unclear pages
- 13 pipelines talking over one async event bus
- Live React/D3 graph of the crawl
- About 40x faster after switching to concurrent fetching

[Repo](https://github.com/omarbounawarapy/CrawlViz)

<br>

### GAAPWise <sub>client</sub>

A pipeline that sorts and scores French legal announcements (BODACC). It ran through a month of real data, 318,962 records, with zero errors.

- Rule-based scoring, no ML in the decisions
- 17x faster by batching database commits
- Same input always gives the same decisions

[Demo video](https://drive.google.com/file/d/1pDHOMM-HOdADbsOL1z3_fMRcbcmwycKZ/view)

<br>

### Wasel <sub>team of 5</sub>

Predicts whether a cash-on-delivery customer will refuse the parcel, from a chat in Darija, Arabizi or French. It passes a 476-case evaluation gate.

- LLM reads the chat, XGBoost picks the score
- Every quoted reason checked against the chat
- Keeps answering when an LLM provider goes down
- Prototype on synthetic data

[Live demo](https://wasel.runs-on.dev)

<br>

### Invoice Intake <sub>solo</sub>

Turns messy invoice PDFs into clean JSON, CSV or Excel records, backed by 209 regression tests.

- Handles table and paragraph layouts
- Reads mixed regional number formats
- No OCR or LLM, fully deterministic

[Repo](https://github.com/omarbounawarapy/invoice_intake_automation_tool)

<br>

### IR Lab <sub>from scratch</sub>

A small search engine framework using only the standard library, tested on the CISI collection.

- Boolean and TF-IDF retrieval
- Significance test written from scratch
- Refuses to compare runs that differ in more than one setting

[Repo](https://github.com/omarbounawarapy/IR-lab)

---

## Open source

<!-- One <a> per merged PR, 6 per row. Make the badge with scripts/make_badge.sh <slug> "<Name>" <logo> [square or circle:#hex], copy a line, and replace one locked slot with it. Add a locked line to start a new row. -->
<p align="left">
  <a href="https://github.com/scrapy/scrapyd/pull/579"><img src="assets/contributed-to/hall-scrapy.png" width="94" alt="Scrapy, merged" title="Scrapy (scrapyd)" /></a>
  <a href="https://github.com/unclecode/crawl4ai/pull/2327"><img src="assets/contributed-to/hall-crawl4ai.png" width="94" alt="Crawl4AI, merged" title="Crawl4AI" /></a>
  <a href="https://github.com/terrier-org/terrier-core/pull/271"><img src="assets/contributed-to/hall-terrier.png" width="94" alt="Terrier, merged" title="Terrier" /></a>
  <img src="assets/contributed-to/hall-empty.png" width="94" alt="Locked" title="To unlock" />
  <img src="assets/contributed-to/hall-empty.png" width="94" alt="Locked" title="To unlock" />
  <img src="assets/contributed-to/hall-empty.png" width="94" alt="Locked" title="To unlock" />
</p>

- [scrapy/scrapyd#579](https://github.com/scrapy/scrapyd/pull/579): docs for running scrapyd as a Linux service
- [unclecode/crawl4ai#2327](https://github.com/unclecode/crawl4ai/pull/2327): fix for proxy passwords with special characters
- [terrier-org/terrier-core#271](https://github.com/terrier-org/terrier-core/pull/271): restored the TREC indexing docs after the wiki went offline

---

## Stack

**Daily**

<p>
  <img src="https://skillicons.dev/icons?i=python" height="40" alt="Python" title="Python" />
  <img src="https://skillicons.dev/icons?i=fastapi" height="40" alt="FastAPI" title="FastAPI" />
  <img src="https://skillicons.dev/icons?i=sqlite" height="40" alt="SQLite" title="SQLite" />
  <img src="https://api.iconify.design/vscode-icons:file-type-sql.svg" height="40" width="40" alt="SQL" title="SQL" />
  <img src="https://skillicons.dev/icons?i=git" height="40" alt="Git" title="Git" />
  <img src="https://skillicons.dev/icons?i=linux" height="40" alt="Linux" title="Linux" />
  <img src="https://skillicons.dev/icons?i=githubactions" height="40" alt="GitHub Actions" title="GitHub Actions" />
  <img src="https://cdn.simpleicons.org/pytest" height="40" alt="pytest" title="pytest" />
</p>

**In some projects**

<p>
  <img src="https://skillicons.dev/icons?i=react" height="40" alt="React" title="React" />
  <img src="https://skillicons.dev/icons?i=docker" height="40" alt="Docker" title="Docker" />
  <img src="https://cdn.simpleicons.org/aiohttp" height="40" alt="aiohttp" title="aiohttp" />
  <img src="https://cdn.simpleicons.org/pandas" height="40" alt="Pandas" title="Pandas" />
  <img src="https://cdn.simpleicons.org/apachespark" height="40" alt="PySpark" title="PySpark" />
  <img src="https://cdn.simpleicons.org/pydantic" height="40" alt="Pydantic" title="Pydantic" />
  <img src="https://cdn.simpleicons.org/scikitlearn" height="40" alt="scikit-learn" title="scikit-learn" />
  <img src="https://cdn.simpleicons.org/openrouter" height="40" alt="OpenRouter" title="OpenRouter" />
</p>

**Still learning**

<p>
  <img src="https://skillicons.dev/icons?i=js" height="40" alt="JavaScript" title="JavaScript" />
  <img src="https://skillicons.dev/icons?i=tailwind" height="40" alt="Tailwind CSS" title="Tailwind CSS" />
  <img src="https://skillicons.dev/icons?i=java" height="40" alt="Java" title="Java" />
  <img src="https://cdn.simpleicons.org/langchain" height="40" alt="LangChain" title="LangChain" />
  <img src="https://cdn.simpleicons.org/huggingface" height="40" alt="Hugging Face" title="Hugging Face" />
</p>

---

<img src="https://flagcdn.com/w80/tn.png" width="22" align="top" alt="" /> Arabic &nbsp;·&nbsp; <img src="https://flagcdn.com/w80/fr.png" width="22" align="top" alt="" /> French &nbsp;·&nbsp; <img src="https://flagcdn.com/w80/gb.png" width="22" align="top" alt="" /> English

Studying computer engineering at ISI, Université de Tunis El Manar.
