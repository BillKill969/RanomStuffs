# linux-vt.kak — Linux VT colorscheme for Kakoune
# Palette: tinted-theming/schemes, base16/linux-vt.yaml
# Author of scheme: j-c-m (https://github.com/j-c-m/)
# Straight port: all 16 colours verbatim, no blending, no derived shades.

# ── Core ─────────────────────────────────────────────────────────────────────
face global Default rgb:aaaaaa,rgb:000000

# ── Syntax ───────────────────────────────────────────────────────────────────
face global variable rgb:aa0000
face global value rgb:ff5555
face global type rgb:ffff55
face global string rgb:00aa00
face global meta rgb:00aaaa
face global function rgb:5555ff
face global keyword rgb:ff55ff
face global attribute rgb:aa5500
face global comment rgb:888888
face global documentation comment
face global operator rgb:aaaaaa
face global module rgb:cccccc
face global builtin rgb:00aaaa

# ── Markup ───────────────────────────────────────────────────────────────────
face global title rgb:00aaaa
face global header rgb:ffff55
face global mono rgb:aaaaaa
face global block rgb:aa5500
face global link rgb:00aa00
face global bullet rgb:ff55ff
face global list rgb:cccccc

# ── Selections & Cursors ─────────────────────────────────────────────────────
face global PrimarySelection rgb:ffffff,rgb:444444
face global SecondarySelection rgb:cccccc,rgb:333333
face global PrimaryCursor rgb:000000,rgb:aaaaaa
face global SecondaryCursor rgb:000000,rgb:888888
face global PrimaryCursorEol rgb:000000,rgb:00aaaa
face global SecondaryCursorEol rgb:000000,rgb:444444

# ── Gutter ───────────────────────────────────────────────────────────────────
face global LineNumbers rgb:555555,rgb:000000
face global LineNumberCursor rgb:ffffff,rgb:000000
face global LineNumbersWrapped rgb:555555,rgb:000000
face global Whitespace rgb:444444,rgb:000000
face global WhitespaceIndent rgb:444444,rgb:000000
face global WrapMarker rgb:555555,rgb:000000
face global BufferPadding rgb:444444,rgb:000000

# ── Search & Match ───────────────────────────────────────────────────────────
face global MatchingChar rgb:ffff55,rgb:333333
face global Search rgb:000000,rgb:00aaaa

# ── Status line ──────────────────────────────────────────────────────────────
face global StatusLine rgb:aaaaaa,rgb:333333
face global StatusLineMode rgb:ff55ff
face global StatusLineInfo rgb:cccccc
face global StatusLineValue rgb:ff5555
face global StatusCursor rgb:000000,rgb:ffffff
face global Prompt rgb:00aa00

# ── Menus & Information ──────────────────────────────────────────────────────
face global MenuForeground rgb:000000,rgb:cccccc
face global MenuBackground rgb:aaaaaa,rgb:333333
face global MenuInfo rgb:cccccc
face global Information rgb:ffffff,rgb:333333
face global InlineInformation rgb:00aaaa,rgb:000000

# ── Errors & Diagnostics ─────────────────────────────────────────────────────
face global Error rgb:000000,rgb:ff5555
face global DiagnosticError rgb:ff5555
face global DiagnosticWarning rgb:ffff55
