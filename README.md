<div align="center">

# Omar Bounawara

**BACKEND & DATA ENGINEERING &nbsp;·&nbsp; PYTHON &nbsp;·&nbsp; SYSTEMS**

I build backend services and data pipelines in Python, and I like checking them against real data.

[GitHub](https://github.com/omarbounawarapy) · [LinkedIn](https://www.linkedin.com/in/omar-bounawara-py) · [Email](mailto:omar.bounawara.py@gmail.com)

</div>

**CONTRIBUTED TO**

<!-- One <a> per merged PR, 6 per row. Make the badge with scripts/make_badge.sh <slug> "<Name>" <logo> [square or circle:#hex], copy a line, and replace one locked slot with it. Add a locked line to start a new row. -->
<p align="left">
  <a href="https://github.com/scrapy/scrapyd/pull/579"><img src="assets/contributed-to/hall-scrapy.png" width="94" alt="Scrapy, merged" title="Scrapy (scrapyd)" /></a>
  <a href="https://github.com/unclecode/crawl4ai/pull/2327"><img src="assets/contributed-to/hall-crawl4ai.png" width="94" alt="Crawl4AI, merged" title="Crawl4AI" /></a>
  <a href="https://github.com/terrier-org/terrier-core/pull/271"><img src="assets/contributed-to/hall-terrier.png" width="94" alt="Terrier, merged" title="Terrier" /></a>
  <img src="assets/contributed-to/hall-empty.png" width="94" alt="Locked" title="To unlock" />
  <img src="assets/contributed-to/hall-empty.png" width="94" alt="Locked" title="To unlock" />
  <img src="assets/contributed-to/hall-empty.png" width="94" alt="Locked" title="To unlock" />
</p>

---

## Things I've built

### [CrawlViz](https://github.com/omarbounawarapy/CrawlViz)

A crawler that decides which links are worth following instead of fetching everything.

- Cheap embedding filter first, LLM only for unclear pages
- 13 pipelines talking over one async event bus
- Live React/D3 graph of the crawl
- About 40x faster after switching to concurrent fetching

<br>

### GAAPWise

A client pipeline that sorts and scores French legal announcements (BODACC). [Demo video](https://drive.google.com/file/d/1pDHOMM-HOdADbsOL1z3_fMRcbcmwycKZ/view)

- Rule-based scoring, no ML in the decisions
- 17x faster by batching database commits
- A month of real data with zero errors

<br>

### [Wasel](https://wasel.runs-on.dev)

Predicts whether a cash-on-delivery customer will refuse the parcel, from a chat in Darija, Arabizi or French. Built with a team of five I put together.

- LLM reads the chat, XGBoost picks the score
- Every quoted reason checked against the chat
- Keeps answering when an LLM provider goes down
- Prototype on synthetic data

<br>

### [Invoice Intake](https://github.com/omarbounawarapy/invoice_intake_automation_tool)

Turns messy invoice PDFs into clean JSON, CSV or Excel records.

<br>

### [IR Lab](https://github.com/omarbounawarapy/IR-lab)

A small search engine framework using only the standard library.

- Boolean and TF-IDF retrieval
- Significance test written from scratch
- Refuses to compare runs that differ in more than one setting

## Open source

- [scrapy/scrapyd#579](https://github.com/scrapy/scrapyd/pull/579): docs for running scrapyd as a Linux service
- [unclecode/crawl4ai#2327](https://github.com/unclecode/crawl4ai/pull/2327): fix for proxy passwords with special characters
- [terrier-org/terrier-core#271](https://github.com/terrier-org/terrier-core/pull/271): restored the TREC indexing docs after the wiki went offline

---

## Stack

**Daily**

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

**In some projects**

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

**Still learning**

<p>
  <img src="https://skillicons.dev/icons?i=js" height="48" alt="JavaScript" title="JavaScript" />
  <img src="https://skillicons.dev/icons?i=tailwind" height="48" alt="Tailwind CSS" title="Tailwind CSS" />
  <img src="https://skillicons.dev/icons?i=java" height="48" alt="Java" title="Java" />
  <img src="https://cdn.simpleicons.org/langchain" height="48" alt="LangChain" title="LangChain" />
  <img src="https://cdn.simpleicons.org/huggingface" height="48" alt="Hugging Face" title="Hugging Face" />
</p>

---

<img src="https://flagcdn.com/w80/tn.png" width="22" align="top" alt="" /> Arabic &nbsp;·&nbsp; <img src="https://flagcdn.com/w80/fr.png" width="22" align="top" alt="" /> French &nbsp;·&nbsp; <img src="https://flagcdn.com/w80/gb.png" width="22" align="top" alt="" /> English

Studying computer engineering at ISI, Université de Tunis El Manar.
