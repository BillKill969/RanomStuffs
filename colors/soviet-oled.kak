# soviet-oled.kak — Soviet-inspired colorscheme for Kakoune, OLED-optimised
# Port of rezniqov/soviet.nvim (dark variant), Apache-2.0
# Palette values sourced from lua/soviet/palette.lua and lua/soviet/colors.lua
#
# OLED variant of soviet-dark.kak. Editor background is true black #000000
# so OLED pixels are fully off across the main editing area.
#
# ── Surface tiers ───────────────────────────────────────────────────────────
# One rule: a darker surface means "quieter". Measured contrast vs #000000.
#   black     1.00  editor background, pixels off
#   #0F0E0E   1.09  statusline bar, whisper-quiet against the editor
#   #141212   1.13  secondary selection / cursor-EOL fallback
#   #1E1B1E   1.23  menu and popup surfaces
#   #2A2430   1.39  secondary selection, clearly above the statusline
#   #3A2F3A   1.65  primary selection
#
# ── Deviation 1: gutters are desaturated, not raw olive ─────────────────────
# A literal port put raw olive #A8AC7D on line numbers. On pure black that
# measures 8.86:1 — BRIGHTER than every syntax ink (string 7.66, keyword 7.79,
# comment 8.01). The gutters shouted over the code, inverting the hierarchy
# the source is built on. colors.lua never uses raw olive for text: it blends
# olive to 28% over the background for map_grid. Line numbers now use #6B6E4A
# (3.95:1) — present but behind the syntax. Whitespace and padding drop to
# #44413F (2.07:1) so they are felt, not read.
#
# ── Deviation 2: statusline lifted to #0F0E0E ──────────────────────────────
# soviet-dark uses #353232. The original #1F1D1D sits at 1.25:1 on black,
# too close to read as a bar. #0F0E0E is deliberately fainter (1.09): on an
# OLED panel an almost-black bar keeps the editor ground continuous while
# still separating the status text.
#
# ── Deviation 3: foreground-on-surface, not blocks ──────────────────────────
# Statusline and menu children set only a foreground and leave the background
# at the parent surface. Kakoune's modeline is one thin line; painting each
# field as its own filled block produces a striped bar. The child colours
# separate the fields, the parent surface holds them together.
#
# All syntax inks are unmodified from palette.lua except comment, which is
# re-blended for the black ground (see Syntax section). Against true black
# every ink passes WCAG AA or better, including enamel blue #5B93BC, which was
# the single AA-large holdout on graphite (4.49 -> 6.34).

# ── Surfaces ─────────────────────────────────────────────────────────────────
# True black, warm-tinted ink on top
face global Default rgb:d8cfc4,rgb:000000

# ── Syntax ───────────────────────────────────────────────────────────────────
# Printing inks from palette.lua, with one deliberate exception: comment.
#
# Comment is #7A7965, not the source's #A3A187. The OLED swap to true black
# silently re-brightened every ink — #A3A187 measures 5.66:1 on the source's
# graphite but 8.01:1 on black, which promoted it to 6th-brightest of 12 and
# inverted the source's "comments are deliberately subdued" intent. Blending
# the same olive to 75% over black lands it at 4.75:1 — quieter than every
# other syntax ink, still above the gutters (3.95) so it never disappears, and
# the hue is unchanged. Italic is kept, matching the plugin default.
# documentation inherits from comment via @base, so it follows automatically.
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
face global comment rgb:7a7965+i
face global documentation comment
face global meta rgb:e36a5b

# ── Markup ───────────────────────────────────────────────────────────────────
# Headings progress red -> burgundy -> brass -> enamel blue, per the source
face global title rgb:e36a5b+b
face global header rgb:c58f9d+b
face global mono rgb:c6b8aa
face global block rgb:d29a69
face global link rgb:d1b078+u
face global bullet rgb:7899a0
face global list rgb:b1a178

# ── UI: Selections & Cursors ─────────────────────────────────────────────────
# Primary 1.65:1 with 8.28:1 text on it. Secondary 1.39:1 — a real step below
# primary, above the statusline, so multiple selections still read as
# separate. Cursors are solid so they are unambiguous under any syntax colour.
face global PrimarySelection rgb:d8cfc4,rgb:3a2f3a
face global SecondarySelection rgb:d8cfc4,rgb:2a2430
face global PrimaryCursor rgb:000000,rgb:e9dfd0
face global SecondaryCursor rgb:000000,rgb:8a8a8a
face global PrimaryCursorEol rgb:000000,rgb:d1b078
face global SecondaryCursorEol rgb:000000,rgb:2a2430

# ── UI: Cartographic layer (gutters, padding, faint structure) ───────────────
# Intentionally the quietest thing on screen. See deviation 1.
face global LineNumbers rgb:6b6e4a,rgb:000000
face global LineNumberCursor rgb:e9dfd0,rgb:000000
face global LineNumbersWrapped rgb:5e6142,rgb:000000
face global Whitespace rgb:44413f,rgb:000000
face global WhitespaceIndent rgb:44413f,rgb:000000
face global WrapMarker rgb:5e6142,rgb:000000
face global BufferPadding rgb:44413f,rgb:000000

# ── UI: Search & Match ───────────────────────────────────────────────────────
# Brass block, matching colors.lua bg_search. MatchingChar is deliberately
# quieter than Search: it is a passive hint, Search is an active result.
face global MatchingChar rgb:d1b078,rgb:1e1b1e+b
face global Search rgb:000000,rgb:d1b078

# ── UI: Status line ──────────────────────────────────────────────────────────
# Foreground-only children over the quiet bar. See deviation 3.
face global StatusLine rgb:d8cfc4,rgb:0f0e0e
face global StatusLineMode rgb:5b93bc,default+b
face global StatusLineInfo rgb:7899a0,default+b
face global StatusLineValue rgb:d1b078,default+b
face global StatusCursor rgb:000000,rgb:e9dfd0
face global Prompt rgb:d29a69,default+b

# ── UI: Menus & Information ──────────────────────────────────────────────────
# Popups get a real surface (#1E1B1E) so they detach from the editor, with
# MenuForeground inverting to solid. Information uses enamel blue rather than
# near-white: colors.lua sets c.info = c.enamel_blue, and near-white here
# measured 14.16:1 — the loudest element in the UI, louder than any error.
face global MenuForeground rgb:000000,rgb:e9dfd0
face global MenuBackground rgb:d8cfc4,rgb:1e1b1e
face global MenuInfo rgb:7899a0,default
face global Information rgb:e9dfd0,rgb:0f0e0e+b
face global InlineInformation rgb:5b93bc,rgb:000000

# ── UI: Errors & Diagnostics ────────────────────────────────────────────────
# red_bright for both, per colors.lua c.error. Status line inverts to a solid
# block so an error cannot be missed; in-buffer diagnostics stay as text.
face global Error rgb:000000,rgb:ef7565
face global DiagnosticError rgb:ef7565,rgb:000000+b
face global DiagnosticWarning rgb:d29a69,rgb:000000
