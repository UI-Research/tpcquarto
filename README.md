# TPC QUARTO THEME LIBRARY

A collection of Tax Policy Center–branded Quarto templates for factsheets, slides, and reports.

## Installation

```
quarto add nikhitaairi/tpcquarto
```

---

## Available Formats

### `tpc-html` — HTML Factsheet

A two-column HTML factsheet with a branded header, sidebar, and TPC color components. Best printed to PDF from the browser if a PDF is needed.

```yaml
format:
  tpc-html: default
```

See [`template.qmd`](template.qmd) for a full example.

**Custom classes:**
| Class | Description |
|---|---|
| `.sidebar-layout` / `.sidebar-box` / `.main-content` | Left sidebar + main content layout |
| `.two-col` / `.col` | Two-column grid |
| `.box-teal`, `.box-deepblue`, `.box-light` | Colored callout boxes |
| `.note-box` | Left-bordered note callout |
| `.figure-label` | Red label above a figure |

---

### `tpc-revealjs` — HTML Slides

A RevealJS presentation theme with TPC brand colors and typography.

```yaml
format:
  tpc-revealjs: default
```

See [`template-slides.qmd`](template-slides.qmd) for a full example.

**Custom classes:**
| Class | Description |
|---|---|
| `.two-col` / `.col` | Two-column slide layout |
| `.section-slide` | Dark blue section divider slide |
| `.box-teal`, `.box-deepblue`, `.box-light` | Colored callout boxes |
| `.note-box` | Left-bordered note callout |
| `.figure-label` | Red figure label |

---

## Planned Formats

- **`tpc-pdf`** — PDF factsheet via LaTeX
- **`tpc-report-html`** — Multi-page HTML report with TOC
- **`tpc-report-pdf`** — PDF report via LaTeX

---

## Brand Assets

Fonts (Avenir TPC), logos, and color tokens live in `_extensions/tpc/`. The shared brand SCSS (`shared/_brand.scss`) defines the TPC color palette and is loaded by all format themes.

**TPC Colors:**
- Deep Blue: `rgb(23, 74, 124)`
- Teal: `rgb(0, 139, 176)`
- Poppy: `rgb(240, 87, 62)`

## Notes

### Portability: fonts embedded directly in HTML

Both `tpc-html` and `tpc-revealjs` output **fully self-contained HTML files** — no companion folders, no external dependencies.

This is achieved by embedding the Avenir TPC font files as base64-encoded data URIs directly inside the shared SCSS (`shared/_brand.scss`). When Quarto compiles the stylesheet, the font data is baked into the CSS, which in turn gets inlined into the output HTML via `embed-resources: true`.

**Why this matters:**
- You can email or share the `.html` file by itself and it renders correctly on any machine, even without internet access or access to your project folder.
- No broken fonts when opening slides on a conference laptop.
- No `_files/` folder to remember to attach.

The tradeoff is that the output files are ~130KB larger (one-time cost, split across four font weights/styles). For typical factsheets and slide decks this is negligible.

