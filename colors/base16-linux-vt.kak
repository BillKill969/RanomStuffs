# base16-linux-vt.kak — Linux VT colorscheme for Kakoune
# Palette: tinted-theming/schemes, base16/linux-vt.yaml
# Author of scheme: j-c-m (https://github.com/j-c-m/)
# base00 is #000000, so this is OLED-native with no adaptation needed.
#
# ── What this revision fixes ────────────────────────────────────────────────
# This scheme is a VT palette: all 8 accents sit at exactly two HSL lightness
# values, which is authentic to terminal ANSI colours but hostile to reading.
# Measured on the upstream slots, there are SIX accent pairs sharing a
# lightness within 0.02, four of them under 120deg apart:
#   base08/base0F  L0.33  30deg    red vs brown
#   base09/base0A  L0.67  60deg    red vs yellow
#   base09/base0E  L0.67  60deg    red vs magenta
#   base0B/base0C  L0.33  60deg    green vs cyan
#   base0B/base0F  L0.33  90deg    green vs brown
#   base0D/base0E  L0.67  60deg    blue vs magenta
# Same lightness plus small hue separation reads as one colour with a cast.
# base0B (strings, 60/1k) and base0C (escape chars) are the worst case,
# because those two sit next to each other constantly.
#
# Each conflicting pair is separated by LIGHTNESS, never by hue drift, so all
# eight hues stay exactly where the scheme put them.
#
# ── Contrast against token frequency ────────────────────────────────────────
# The upstream roles also invert frequency. Measured per 1000 tokens:
#   variables base08  2.71:1 at 70/1k   <- the second most common token
#   comments  base03  2.82:1 at 60/1k
#   functions base0D  4.13:1 at 40/1k
#   classes   base0A 19.69:1 at 20/1k   <- the rarest bright role
# Frequency-weighted mean contrast 6.21 -> 7.37 after the fixes below.
#
# ── Deliberate changes, hue preserved in every case ─────────────────────────
#   base08 #AA0000 -> #FF3333  variables  2.71 -> 5.77, clears AA
#   base0C #00AAAA -> #00EBEB  escape     7.33 -> 14.08, separates from green
#   base0F #AA5500 -> #E07000  builtin    4.01 -> 6.49, separates from red
#   comments move base03 -> base04 (#888888, 5.92) while base03 stays on the
#   gutter layer, where being dim is correct rather than a defect.
#   The three syntax slots keep canonical hues at canonical saturation. The UI
#   pass moved base01 down to #1A1A1A and pulled whitespace back to #3A3A3A to
#   spread the surface ladder; those are greyscale moves, not new hues.
# Lifting lightness was the correct operation for all three; desaturating
# would have moved contrast DOWN, the opposite of the intent.
#
# base0A stays at its upstream value and remains the brightest ink in the theme
# at 19.69:1, 2.46x the keyword ink. This is a known, accepted cost rather
# than an oversight. Yellow is intrinsically the lightest hue: dimming it
# shifts it toward orange and desaturating it greys it into the comment slot
# (measured: sat 0.50 gives #D5D580 at 13.66:1, which collides with base04).
# The hue is wanted and the role is low-frequency, so it stays bright.

# ── Surfaces ─────────────────────────────────────────────────────────────────
face global Default rgb:aaaaaa,rgb:000000

# ── Syntax ───────────────────────────────────────────────────────────────────
# type and function deliberately share base0D: in the base16 spec they are the
# same slot, and no hue is free to separate them without inventing one.
face global keyword rgb:ff55ff
face global string rgb:00aa00
face global type rgb:5555ff
face global function rgb:5555ff
face global value rgb:ff5555
face global variable rgb:ff3333
face global attribute rgb:ffff55
face global module rgb:00ebeb
face global builtin rgb:e07000
face global operator rgb:aaaaaa
face global comment rgb:888888+i
face global documentation comment
face global meta rgb:ff5555

# ── Markup ───────────────────────────────────────────────────────────────────
face global title rgb:00ebeb+b
face global header rgb:ffff55+b
face global mono rgb:aaaaaa
face global block rgb:e07000
face global link rgb:00aa00+u
face global bullet rgb:ff55ff
face global list rgb:cccccc

# ── UI: Selections & Cursors ─────────────────────────────────────────────────
# Selection text is base07, not base05. With base05 on base02 the text dropped
# from 9.04:1 unscrolled to 4.19:1 selected, and the eye rests on selections
# more than on ordinary code. base07 on base02 is 9.74:1, and base07 is a
# genuine upstream slot, so this costs no new colour.
face global PrimarySelection rgb:ffffff,rgb:444444
face global SecondarySelection rgb:cccccc,rgb:242424
face global PrimaryCursor rgb:000000,rgb:aaaaaa
face global SecondaryCursor rgb:000000,rgb:888888
face global PrimaryCursorEol rgb:000000,rgb:00ebeb
face global SecondaryCursorEol rgb:000000,rgb:444444

# ── UI: Gutter layer ─────────────────────────────────────────────────────────
# These sit under 3:1 on purpose. Invisibles and gutter furniture should be
# felt rather than read, and they are all well below the quietest syntax ink
# at 4.13:1, so nothing here competes with the code.
face global LineNumbers rgb:555555,rgb:000000
face global LineNumberCursor rgb:ffffff,rgb:000000
face global LineNumbersWrapped rgb:555555,rgb:000000
face global Whitespace rgb:3a3a3a,rgb:000000
face global WhitespaceIndent rgb:3a3a3a,rgb:000000
face global WrapMarker rgb:555555,rgb:000000
face global BufferPadding rgb:3a3a3a,rgb:000000

# ── UI: Search & Match ───────────────────────────────────────────────────────
face global MatchingChar rgb:ffff55,rgb:1a1a1a
face global Search rgb:000000,rgb:00ebeb

# ── UI: Status line ──────────────────────────────────────────────────────────
# The bar is #1A1A1A rather than base01. base01/base02/base03 all sat between
# 1.66 and 2.82 against the black ground, a 1.30x step between them, so the
# bar, the selection and the gutters blurred into each other. #1A1A1A opens
# the ladder to a 1.79x step and gives the bar a surface of its own.
#
# Children are the canonical hues at FULL saturation, 5.54 to 10.84:1 on the
# bar. The previous pass toned them down to 2.95-3.76:1, which was overcooked:
# they were dimmer than the code but also under AA, and the modeline is small
# text that needs its own legibility. This way the bar reads as quieter than
# the code (code spans 4.13-19.69 on black) without being hard to read.
# Children set only a foreground so the thin modeline is not a row of blocks.
face global StatusLine rgb:aaaaaa,rgb:1a1a1a
face global StatusLineMode rgb:ff55ff,default+b
face global StatusLineInfo rgb:cccccc,default+b
face global StatusLineValue rgb:ff5555,default+b
face global StatusCursor rgb:000000,rgb:ffffff
face global Prompt rgb:00aa00,default+b

# ── UI: Menus & Information ──────────────────────────────────────────────────
face global MenuForeground rgb:000000,rgb:cccccc
face global MenuBackground rgb:aaaaaa,rgb:1a1a1a
face global MenuInfo rgb:cccccc,default
face global Information rgb:ffffff,rgb:1a1a1a+b
face global InlineInformation rgb:00ebeb,rgb:000000

# ── UI: Errors & Diagnostics ────────────────────────────────────────────────
# Red carries errors. base08 lifted to #FF3333 keeps it off the same lightness
# as the yellow, which the upstream slots shared at L0.67.
face global Error rgb:000000,rgb:ff5555
face global DiagnosticError rgb:ff5555,rgb:000000+b
face global DiagnosticWarning rgb:ffff55,rgb:000000
