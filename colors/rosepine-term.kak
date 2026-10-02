# rosepine-term.kak — Rosé Pine × Retro Terminal colorscheme for Kakoune
# OLED-friendly (pure black background), high contrast, soft Rosé Pine palette

# ── Core ─────────────────────────────────────────────────────────────────────
face global Default rgb:e0def4,rgb:000000

# ── Syntax ───────────────────────────────────────────────────────────────────
face global value rgb:f6c177
face global type rgb:5fb3d4
face global variable rgb:a8a4c2
face global module rgb:9ccfd8
face global function rgb:9ccfd8
face global string rgb:9ccfd8
face global keyword rgb:c4a7e7
face global operator rgb:eb6f92
face global attribute rgb:5fb3d4
face global comment rgb:6e6a86
face global documentation comment
face global meta rgb:eb6f92
face global builtin rgb:c4a7e7+b

# ── Markup ───────────────────────────────────────────────────────────────────
face global title rgb:f6c177+b
face global header rgb:9ccfd8+b
face global mono rgb:5fb3d4
face global block rgb:c4a7e7
face global link rgb:9ccfd8+u
face global bullet rgb:9ccfd8
face global list rgb:f6c177

# ── UI: Selections & Cursors ─────────────────────────────────────────────────
face global PrimarySelection rgb:000000,rgb:c4a7e7
face global SecondarySelection rgb:000000,rgb:5fb3d4
face global PrimaryCursor rgb:000000,rgb:e0def4
face global SecondaryCursor rgb:000000,rgb:6e6a86
face global PrimaryCursorEol rgb:000000,rgb:5fb3d4
face global SecondaryCursorEol rgb:000000,rgb:2a2739

# ── UI: Line Numbers & Whitespace ────────────────────────────────────────────
face global LineNumbers rgb:6e6a86,rgb:000000
face global LineNumberCursor rgb:e0def4,rgb:000000
face global LineNumbersWrapped rgb:6e6a86,rgb:000000
face global Whitespace rgb:6e6a86,rgb:000000
face global WhitespaceIndent rgb:6e6a86,rgb:000000
face global WrapMarker rgb:6e6a86,rgb:000000

# ── UI: Search & Match ───────────────────────────────────────────────────────
face global MatchingChar rgb:000000,rgb:f6c177
face global Search rgb:000000,rgb:f6c177

# ── UI: Status Line ──────────────────────────────────────────────────────────
face global StatusLine rgb:e0def4,rgb:000000
face global StatusLineMode rgb:000000,rgb:c4a7e7
face global StatusLineInfo rgb:000000,rgb:5fb3d4
face global StatusLineValue rgb:000000,rgb:9ccfd8
face global StatusCursor rgb:000000,rgb:e0def4
face global Prompt rgb:f6c177,rgb:000000

# ── UI: Menus & Information ──────────────────────────────────────────────────
face global MenuForeground rgb:000000,rgb:c4a7e7
face global MenuBackground rgb:e0def4,rgb:000000
face global MenuInfo rgb:5fb3d4,rgb:000000
face global Information rgb:000000,rgb:5fb3d4
face global InlineInformation rgb:5fb3d4,rgb:000000

# ── UI: Errors & Diagnostics ────────────────────────────────────────────────
face global Error rgb:000000,rgb:eb6f92
face global DiagnosticError rgb:eb6f92,rgb:000000
face global DiagnosticWarning rgb:f6c177,rgb:000000

# ── UI: Buffer Padding ───────────────────────────────────────────────────────
face global BufferPadding rgb:6e6a86,rgb:000000
