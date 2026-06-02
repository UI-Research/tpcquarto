# TPC QUARTO THEME LIBRARY

A collection of Tax Policy Center–branded Quarto templates for factsheets, slides, and reports.

---

## What is Quarto?

[Quarto](https://quarto.org) is an open-source publishing system that lets you write documents, presentations, and reports using plain text (Markdown) mixed with code. It can render to HTML, PDF, Word, and more — all from a single `.qmd` file.

---

## Prerequisites: Installing Quarto

Before using this theme library, you need Quarto installed on your machine.

1. Go to [https://quarto.org/docs/get-started/](https://quarto.org/docs/get-started/)
2. Download and run the installer for your operating system (macOS, Windows, or Linux)
3. Verify the installation by running this in your terminal:

```
quarto --version
```

You should see a version number like `1.5.x`. If not, restart your terminal and try again.

> **Tip:** Quarto works great alongside VS Code (with the [Quarto extension](https://marketplace.visualstudio.com/items?itemName=quarto.quarto)) or RStudio, both of which provide live preview.

---

## Quickstart

### 1. Install this extension

Navigate to your project folder in the terminal, then run:

```
quarto add UI-Research/tpcquarto
```

This downloads the TPC theme files into an `_extensions/` folder in your project. You only need to do this once per project.

### 2. Copy a template

Copy one of the provided template files into your project and rename it:

- `template.qmd` → for an HTML factsheet
- `template-slides.qmd` → for a slide deck

### 3. Render your document

To preview your document in a browser with live reloading:

```
quarto preview my-slides.qmd
```

To render a final output file:

```
quarto render my-slides.qmd
```

The output `.html` file will appear in the same directory.

---

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

