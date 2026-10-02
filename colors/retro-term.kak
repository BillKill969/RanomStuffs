# retro-term.kak — Retro terminal colorscheme for Kakoune
# OLED-friendly (pure black background), high contrast, classic terminal palette

# ── Core ─────────────────────────────────────────────────────────────────────
face global Default rgb:cccccc,rgb:000000

# ── Syntax ───────────────────────────────────────────────────────────────────
face global value rgb:ff55ff
face global type rgb:ffff55
face global variable rgb:aaaaaa
face global module rgb:55ffff
face global function rgb:55ffff
face global string rgb:55ff55
face global keyword rgb:5555ff
face global operator rgb:ff5555
face global attribute rgb:55ff55
face global comment rgb:00aaaa
face global documentation comment
face global meta rgb:ff55ff
face global builtin rgb:ff55ff+b

# ── Markup ───────────────────────────────────────────────────────────────────
face global title rgb:ffff55+b
face global header rgb:55ffff+b
face global mono rgb:55ff55
face global block rgb:ff55ff
face global link rgb:55ffff+u
face global bullet rgb:55ffff
face global list rgb:ffff55

# ── UI: Selections & Cursors ─────────────────────────────────────────────────
face global PrimarySelection rgb:000000,rgb:5555ff
face global SecondarySelection rgb:000000,rgb:005555
face global PrimaryCursor rgb:000000,rgb:cccccc
face global SecondaryCursor rgb:000000,rgb:555555
face global PrimaryCursorEol rgb:000000,rgb:00aaaa
face global SecondaryCursorEol rgb:000000,rgb:005555

# ── UI: Line Numbers & Whitespace ────────────────────────────────────────────
face global LineNumbers rgb:555555,rgb:000000
face global LineNumberCursor rgb:cccccc,rgb:000000
face global LineNumbersWrapped rgb:555555,rgb:000000
face global Whitespace rgb:555555,rgb:000000
face global WhitespaceIndent rgb:555555,rgb:000000
face global WrapMarker rgb:555555,rgb:000000

# ── UI: Search & Match ───────────────────────────────────────────────────────
face global MatchingChar rgb:000000,rgb:ffff55
face global Search rgb:000000,rgb:ffff55

# ── UI: Status Line ──────────────────────────────────────────────────────────
face global StatusLine rgb:cccccc,rgb:000000
face global StatusLineMode rgb:000000,rgb:5555ff
face global StatusLineInfo rgb:000000,rgb:00aaaa
face global StatusLineValue rgb:000000,rgb:55ff55
face global StatusCursor rgb:000000,rgb:cccccc
face global Prompt rgb:ffff55,rgb:000000

# ── UI: Menus & Information ──────────────────────────────────────────────────
face global MenuForeground rgb:000000,rgb:5555ff
face global MenuBackground rgb:cccccc,rgb:000000
face global MenuInfo rgb:00aaaa,rgb:000000
face global Information rgb:000000,rgb:00aaaa
face global InlineInformation rgb:00aaaa,rgb:000000

# ── UI: Errors & Diagnostics ────────────────────────────────────────────────
face global Error rgb:000000,rgb:ff5555
face global DiagnosticError rgb:ff5555,rgb:000000
face global DiagnosticWarning rgb:ffff55,rgb:000000

# ── UI: Buffer Padding ───────────────────────────────────────────────────────
face global BufferPadding rgb:555555,rgb:000000
