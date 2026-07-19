# Agent Browser Skill

> Browser automation CLI designed for AI agents. Compact text output minimizes context usage.

## When to Use

Use this skill whenever the user asks you to:
- Browse a website, check a page, or interact with web UI
- Fill forms, click buttons, or navigate web apps
- Take screenshots or capture page state
- Test a web application end-to-end
- Scrape or extract content from a live page
- Debug frontend behavior in a real browser

## Prerequisites

```bash
# Install (one-time)
npm install -g agent-browser
agent-browser install  # downloads Chrome
```

Verify with: `agent-browser doctor --quick`

## Core Workflow

```bash
# 1. Open a page
agent-browser open "https://example.com"

# 2. Get the accessibility snapshot (compact, token-efficient)
agent-browser snapshot

# 3. Interact using @refs from the snapshot
agent-browser click @e5
agent-browser fill @e12 "hello world"

# 4. Screenshot for visual confirmation
agent-browser screenshot

# 5. Close when done
agent-browser close
```

## Key Concepts

### Ref-Based Selection
`snapshot` returns an accessibility tree where each element gets a unique ref (`@e1`, `@e2`...). Use these refs to target elements precisely:

```bash
agent-browser snapshot          # see refs
agent-browser click @e3         # click element @e3
agent-browser fill @e7 "text"   # fill input @e7
agent-browser get text @e2      # extract text from @e2
```

### Semantic Finders (no snapshot needed)
```bash
agent-browser find role button click        # click first button
agent-browser find text "Sign In" click     # click by visible text
agent-browser find label "Email" fill "x@y.com"
agent-browser find placeholder "Search" fill "query"
```

### Waiting
```bash
agent-browser wait @e5                      # wait for element
agent-browser wait --text "Success"         # wait for text
agent-browser wait --url "/dashboard"       # wait for navigation
agent-browser wait --load networkidle       # wait for page load
agent-browser wait 2000                     # wait ms
```

## Command Reference (Quick)

| Category | Commands |
|----------|----------|
| **Navigate** | `open`, `back`, `forward`, `reload`, `close` |
| **Interact** | `click`, `dblclick`, `hover`, `focus`, `drag`, `scroll`, `scrollintoview` |
| **Forms** | `fill`, `type`, `select`, `check`, `uncheck`, `upload` |
| **Keyboard** | `press`, `keydown`, `keyup`, `keyboard type` |
| **Read** | `get text`, `get html`, `get value`, `get attr`, `get title`, `get url`, `get count` |
| **State** | `is visible`, `is enabled`, `is checked` |
| **Find** | `find role`, `find text`, `find label`, `find placeholder`, `find alt`, `find testid` |
| **Wait** | `wait <sel>`, `wait --text`, `wait --url`, `wait --load`, `wait --fn` |
| **Capture** | `screenshot`, `screenshot --full`, `screenshot --annotate`, `pdf`, `snapshot` |
| **Exec** | `eval <js>` |
| **Tabs** | `tab`, `tab new`, `tab close`, `frame` |
| **Network** | `network route`, `network requests`, `network har` |
| **Storage** | `cookies`, `storage local`, `storage session` |
| **Auth** | `auth save`, `auth login`, `auth list` |
| **Config** | `set viewport`, `set device`, `set media`, `set offline` |

## Useful Flags

| Flag | Purpose |
|------|---------|
| `--headed` | Show browser window (not headless) |
| `--session <name>` | Isolated session |
| `--annotate` | Number elements in screenshots |
| `--max-output <n>` | Truncate long output |
| `--json` | Structured JSON output |
| `--allowed-domains <list>` | Restrict navigation |

## Patterns

### Login Flow
```bash
agent-browser open "https://app.example.com/login"
agent-browser find label "Email" fill "user@example.com"
agent-browser find label "Password" fill "secret"
agent-browser find role button click --name "Sign In"
agent-browser wait --url "/dashboard"
agent-browser screenshot
```

### Form Testing
```bash
agent-browser open "https://app.example.com/form"
agent-browser snapshot
agent-browser fill @e4 "Jane Doe"
agent-browser select @e8 "Option B"
agent-browser check @e10
agent-browser click @e15  # submit
agent-browser wait --text "Success"
```

### Extract Data
```bash
agent-browser open "https://example.com/pricing"
agent-browser snapshot
agent-browser get text @e12
agent-browser eval "document.querySelectorAll('.price').length"
```

### Batch Commands
```bash
agent-browser batch "open https://example.com" "snapshot" "screenshot"
```

## Tips

- Always run `snapshot` before interacting to get fresh refs
- Refs are ephemeral: after navigation or major DOM changes, re-run `snapshot`
- Use `--headed` for debugging so you can see what's happening
- Use `screenshot --annotate` to get numbered labels on elements
- Combine with `wait` to handle async pages before reading state
- Use `--session` to run multiple independent browser contexts
