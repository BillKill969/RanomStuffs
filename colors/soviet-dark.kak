# soviet-dark.kak — Soviet-inspired colorscheme for Kakoune
# Port of rezniqov/soviet.nvim (dark variant), Apache-2.0
# Palette values sourced from lua/soviet/palette.lua and lua/soviet/colors.lua
#
# Deviation from the original: statusline surfaces are lifted from #1F1D1D to
# #353232. At #1F1D1D the modeline sits at 1.13:1 against the editor
# background, which is invisible in Kakoune's single-line modeline bar. The
# original value works in Neovim because lualine is a full-width bar with
# separators. All syntax inks are unmodified from the source palette.

# ── Surfaces ─────────────────────────────────────────────────────────────────
# Editor background, warm graphite
face global Default rgb:d8cfc4,rgb:292727

# ── Syntax ───────────────────────────────────────────────────────────────────
# Printing inks, following the role assignments in colors.lua
face global keyword rgb:c58f9d
face global function rgb:d1b078
face global string rgb:65aa88
face global value rgb:d29a69
face global type rgb:5b93bc
face global module rgb:7899a0
face global builtin rgb:45a39e
face global variable rgb:c6b8aa
face global attribute rgb:b1a178
face global operator rgb:b7aaa3
face global comment rgb:a3a187+i
face global documentation comment
face global meta rgb:e36a5b

# ── Markup ───────────────────────────────────────────────────────────────────
face global title rgb:e36a5b+b
face global header rgb:c58f9d+b
face global mono rgb:c6b8aa
face global block rgb:d29a69
face global link rgb:d1b078+u
face global bullet rgb:7899a0
face global list rgb:b1a178

# ── UI: Selections & Cursors ─────────────────────────────────────────────────
# Selection #554B54 carries 5.41:1 for the default text on top of it
face global PrimarySelection rgb:d8cfc4,rgb:554b54
face global SecondarySelection rgb:d8cfc4,rgb:403a3a
face global PrimaryCursor rgb:292727,rgb:e9dfd0
face global SecondaryCursor rgb:292727,rgb:746666
face global PrimaryCursorEol rgb:292727,rgb:d1b078
face global SecondaryCursorEol rgb:292727,rgb:554b54

# ── UI: Cartographic layer (gutters, padding, faint structure) ───────────────
# Olive and khaki, the subdued map layer from colors.lua
face global LineNumbers rgb:a8ac7d,rgb:292727
face global LineNumberCursor rgb:e9dfd0,rgb:292727
face global LineNumbersWrapped rgb:a8ac7d,rgb:292727
face global Whitespace rgb:746666,rgb:292727
face global WhitespaceIndent rgb:746666,rgb:292727
face global WrapMarker rgb:a8ac7d,rgb:292727
face global BufferPadding rgb:746666,rgb:292727

# ── UI: Search & Match ───────────────────────────────────────────────────────
face global MatchingChar rgb:292727,rgb:d1b078
face global Search rgb:292727,rgb:d1b078

# ── UI: Status line ──────────────────────────────────────────────────────────
# Lifted surface, see header note. Foreground-only children so they read as
# text on that surface rather than as competing blocks.
face global StatusLine rgb:d8cfc4,rgb:353232
face global StatusLineMode rgb:5b93bc,rgb:353232
face global StatusLineInfo rgb:7899a0,rgb:353232
face global StatusLineValue rgb:d1b078,rgb:353232
face global StatusCursor rgb:292727,rgb:e9dfd0
face global Prompt rgb:d29a69,rgb:353232

# ── UI: Menus & Information ──────────────────────────────────────────────────
face global MenuForeground rgb:292727,rgb:e9dfd0
face global MenuBackground rgb:d8cfc4,rgb:292727
face global MenuInfo rgb:7899a0,rgb:292727
face global Information rgb:e9dfd0,rgb:353232
face global InlineInformation rgb:5b93bc,rgb:292727

# ── UI: Errors & Diagnostics ────────────────────────────────────────────────
face global Error rgb:292727,rgb:ef7565
face global DiagnosticError rgb:ef7565,rgb:292727
face global DiagnosticWarning rgb:d29a69,rgb:292727
