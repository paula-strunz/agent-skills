# Purpose

Analyze the codebase architecture, identify major data flows, and generate a self-contained interactive HTML page with Mermaid.js diagrams. The page includes tab navigation, pan/zoom, lazy rendering, and source file references. Can be opened in any browser with no build step.

## Inputs

- `$ARGUMENTS`: Optional output path and/or specific flows to include. If empty, auto-detect major data flows and write to `./ai_docs/docs/data-flows.html`.

## Variables

- `OUTPUT_PATH`: `./ai_docs/docs/data-flows.html` (override via arguments)
- `MERMAID_CDN`: `https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.min.js`

## Process

### 1. Check for existing diagrams

Read `OUTPUT_PATH`. If a prior version exists, decide whether to update in-place or regenerate from scratch based on how much the architecture has changed.

### 2. Explore the codebase

Load project context per the Project Context Loading pattern in `shared-patterns.md`. Read available guidance files, architecture docs, and key source files. Identify packages, layers, and entry points.

### 3. Trace data flows

Read source files end-to-end to trace flows that cross multiple layers or modules. For each flow, document:
- Trigger (user action, scheduled job, event, API call)
- Key components involved
- Data transformations at each step
- Final output or side effect

### 4. Select 3-6 flows to diagram

Common types:
- User request-response
- Data ingestion / ETL
- Tool or plugin execution
- External service integration
- Async or background jobs

### 5. Write Mermaid diagrams

Use `flowchart TB` for pipelines, `flowchart LR` for request/response. Show components and relationships, not individual functions. Group related nodes with `subgraph` blocks.

Follow all Mermaid Syntax Rules below.

### 6. Assemble the HTML page

Build a single self-contained HTML file following the HTML Page Requirements below. Each flow gets its own tab with a diagram, file reference table, and optional legend.

### 7. Validate

Check all Mermaid syntax against the rules below. Verify: no reserved-word subgraph IDs, no node ID collisions, no forbidden characters, no nesting beyond 1 level deep.

---

## Mermaid Syntax Rules (Critical)

These prevent rendering failures. Violating any of them will produce silent breakage.

- **Subgraph IDs**: Always prefix with `SG_`. Never use bare words like `INPUT`, `OUTPUT`, `CACHE`, `TOOLS`, `UTILS`, `DEFAULT`, `GRAPH`, `END`, `STYLE`, `CLASS`. These are reserved or conflict with Mermaid internals.
- **Node IDs**: Prefix all node IDs with a unique per-diagram letter (e.g., `A_` for agent, `T_` for tool, `E_` for ETL). This prevents ID collisions when multiple diagrams exist on the same HTML page.
- **Special characters**: No `&` in labels (use "and"). No `?` inside `{}` diamond nodes.
- **HTML in labels**: `<b>`, `<i>`, `<br/>` work inside `["..."]` rectangle node labels when `securityLevel: 'loose'` and `htmlLabels: true` are set.
- **Arrows**: No `<-.->` (not valid Mermaid). Use two separate `-->` arrows for bidirectional flows.
- **Subgraph nesting**: Maximum 1 level deep. Do NOT use `direction LR/TB` inside subgraphs. This causes rendering failures in Mermaid v11.
- **Lazy rendering**: Use `startOnLoad: false` and render each diagram with `mermaid.run({ nodes: [el] })` only when its tab becomes visible. Mermaid fails silently on `display: none` elements.

## HTML Page Requirements

The output must be a **single self-contained HTML file** with:

1. Mermaid.js loaded from CDN (no build step)
2. Dark theme (GitHub dark mode palette)
3. Tab navigation (one tab per data flow)
4. Lazy rendering (diagrams render on tab switch, not on page load)
5. Pan and zoom on each diagram viewport:
   - Mouse click-and-drag to pan
   - Scroll wheel to pan (deltaX/deltaY)
   - Ctrl/Cmd + scroll or trackpad pinch to zoom toward cursor
   - Touch one-finger drag and two-finger pinch-to-zoom
   - +/- zoom buttons and a reset/fit button in the corner
6. Expandable file reference table (`<details>`) below each diagram
7. Color-coded subgraphs with `classDef` styles
8. Auto-fit (each diagram scales to fit the viewport on first render)

## Output

After generating, report:
- Number of data flows diagrammed
- Output file path
- List of flows with one-line descriptions
- Any flows that were considered but excluded, with reason

Save the HTML file to `OUTPUT_PATH` (default: `./ai_docs/docs/data-flows.html`). Create directories if they do not exist.

---

## Troubleshooting

Common Mermaid.js rendering issues encountered when building multi-tab diagram pages.

### "Syntax error in text" on tabs that render fine in isolation

**Symptom**: Each diagram renders correctly in its own standalone HTML file, but shows "Syntax error in text" when combined into a multi-tab page.

**Root cause**: `startOnLoad: true` makes Mermaid process ALL `<pre class="mermaid">` elements on page load, including those inside `display: none` tab sections. Mermaid cannot compute SVG dimensions for hidden elements and fails silently.

**Fix**: Set `startOnLoad: false` in `mermaid.initialize()` and render each diagram lazily with `mermaid.run({ nodes: [el] })` only when its tab becomes visible. This is the single most important rule in this cookbook.

### Reserved-word subgraph IDs cause silent failures

**Symptom**: Diagram fails to render with no clear syntax error. The Mermaid code looks valid.

**Root cause**: Bare subgraph IDs like `INPUT`, `OUTPUT`, `CACHE`, `TOOLS`, `UTILS`, `DEFAULT`, `GRAPH`, `END`, `STYLE`, `CLASS` collide with Mermaid keywords or internal parser tokens.

**Fix**: Always prefix subgraph IDs with `SG_` (e.g., `subgraph SG_INPUT["Document Input"]`).

### `&` character breaks labels in loose security mode

**Symptom**: Diagram fails to parse when a node label contains `&`.

**Root cause**: With `securityLevel: 'loose'` and `htmlLabels: true`, Mermaid parses labels as HTML. The `&` character is interpreted as the start of an HTML entity.

**Fix**: Replace `&` with the word "and" in all node labels.

### `<-.->` bidirectional dotted arrow is not valid

**Symptom**: Parse error on a line using `<-.->` between two nodes.

**Root cause**: Mermaid does not support `<-.->` as a valid arrow type.

**Fix**: Use two separate arrows: `A -.-> B` and `B -.-> A`.

### `direction LR/TB` inside subgraphs breaks Mermaid v11

**Symptom**: Diagram renders in Mermaid v10 but fails or produces broken layout in v11.

**Root cause**: `direction LR` or `direction TB` inside a `subgraph` block is not reliably supported in Mermaid v11 and causes rendering failures.

**Fix**: Remove all `direction` statements from inside subgraphs. Only use `flowchart TB` or `flowchart LR` at the top level.

### Pan/zoom not responding to mouse drag or trackpad

**Symptom**: The +/- zoom buttons work, but clicking and dragging does nothing. Trackpad pinch-to-zoom does nothing.

**Root cause**: Using `overflow: auto` or CSS-only scroll does not provide drag-to-pan or pinch-to-zoom behavior. You need explicit JavaScript event handlers.

**Fix**: Wrap the `<pre class="mermaid">` element in a `diagram-inner` div, then attach `mousedown`/`mousemove`/`mouseup` handlers for drag, `wheel` handler (checking `e.ctrlKey` for pinch-to-zoom vs scroll-to-pan), and `touchstart`/`touchmove`/`touchend` for mobile. Apply `transform: translate(x, y) scale(z)` to the inner wrapper.

### Node ID collisions across diagrams on the same page

**Symptom**: Arrows connect to wrong nodes, or some nodes disappear. Diagrams look broken when multiple tabs exist.

**Root cause**: Mermaid uses node IDs globally across the page. If two diagrams both have a node called `LLM`, they collide.

**Fix**: Prefix all node IDs with a unique per-diagram letter (e.g., `A_LLM` for agent flow, `T_LLM` for tool flow).
