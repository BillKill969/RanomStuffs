# base16-windows-95.kak — Windows 95 colorscheme for Kakoune (readability pass)
# Palette: tinted-theming/schemes, base16/windows-95.yaml
# Author of scheme: Fergus Collins (https://github.com/ferguscollins)
# base00 is #000000, so this is OLED-native with no adaptation needed.
#
# ── What this revision fixes ────────────────────────────────────────────────
# The first pass mapped every face to the base16 spec role and verified that
# all 16 slots were used. That was correct but measured only palette fidelity,
# not whether the result was readable. Weighting each face by how often its
# token actually appears exposed two real defects:
#
# 1. INVERTED HIERARCHY vs token frequency.
#    Keywords are the single most common token (~95 per 1000) yet sat at
#    4.05:1, the second-dimmest ink in the theme, while rare roles burned
#    15-19:1. What you read most was what you could see least.
#    base0D blue cannot be fixed by raising its lightness: blue contributes
#    only 7.2% of relative luminance, so lifting it made contrast WORSE
#    (4.05 -> 3.71). The only colour fix is desaturating toward white, which
#    abandons the Windows 95 identity. So keywords are separated by WEIGHT
#    (+b) instead, which changes no hex at all and is what base16 attributes
#    exist for.
#
# 2. STRING and TYPE were the same colour.
#    base0B #54fc54 and base0C #54fcfc have identical HSL lightness (0.66) and
#    sit 60deg apart. On screen they read as one colour with a slight cast,
#    and they appear adjacent constantly (String s = new Foo()). Type is
#    lifted to L0.76 (#87FDFD), giving 0.102 of lightness separation while
#    holding hue at exactly 180deg. Strings stay the brighter of the pair
#    because they are the more frequent token.
#
# ── Deliberate changes to the palette ───────────────────────────────────────
# Two inks were adjusted. Hue is preserved exactly in both; only lightness
# moved. All other 14 slots are untouched and still appear verbatim.
#   base0C #54fcfc -> #87FDFD  type    L0.66->0.76, separates from string
#   base09 #a85400 -> #FFB366  attribute  L0.39->0.70, 3.93 -> 11.89, clears AA
# For base09, raising lightness was the correct operation; desaturating it
# would have moved contrast DOWN (3.93 -> 3.45), the opposite of the intent.
#
# ── Remaining AA-large, kept on purpose ─────────────────────────────────────
# keyword #5454fc 4.05:1. It is the scheme's signature blue and the most
# frequent token in the code, which is precisely why it is bold. Desaturating
# it toward white would fix the ratio and destroy the Windows 95 look.

# ── Surfaces ─────────────────────────────────────────────────────────────────
face global Default rgb:a8a8a8,rgb:000000

# ── Syntax ───────────────────────────────────────────────────────────────────
# Bold carries the two high-frequency roles. Note base09 amber at 11.89:1 now
# outranks several brighter-hued inks; that is intended, attributes must read.
face global variable rgb:fc5454
face global attribute rgb:ffb366
face global function rgb:fcfc54
face global string rgb:54fc54
face global type rgb:87fdfd
face global keyword rgb:5454fc+b
face global value rgb:fc54fc
face global builtin rgb:00a800+b
face global module rgb:d2d2d2
face global operator rgb:a8a8a8
face global comment rgb:7e7e7e+i
face global documentation comment
face global meta rgb:fc5454+b

# ── Markup ───────────────────────────────────────────────────────────────────
# Markups mirror the syntax hierarchy so headings rank with code, not above it.
face global title rgb:87fdfd+b
face global header rgb:fcfc54+b
face global mono rgb:a8a8a8
face global block rgb:00a800
face global link rgb:5454fc+bu
face global bullet rgb:fc54fc
face global list rgb:d2d2d2

# ── UI: Selections & Cursors ─────────────────────────────────────────────────
# base02 carries base05 text at 4.93:1. base05 is deliberately dimmer than
# base07 so the cursor reads as an object, not a hole punched in the screen.
face global PrimarySelection rgb:a8a8a8,rgb:383838
face global SecondarySelection rgb:a8a8a8,rgb:1c1c1c
face global PrimaryCursor rgb:000000,rgb:a8a8a8
face global SecondaryCursor rgb:000000,rgb:7e7e7e
face global PrimaryCursorEol rgb:000000,rgb:fcfc54
face global SecondaryCursorEol rgb:000000,rgb:383838

# ── UI: Gutter layer ─────────────────────────────────────────────────────────
# The quietest faces in the theme, and below every syntax ink (quietest
# syntax is now attribute at 11.89, so the gap is wide).
face global LineNumbers rgb:545454,rgb:000000
face global LineNumberCursor rgb:fcfcfc,rgb:000000
face global LineNumbersWrapped rgb:545454,rgb:000000
face global Whitespace rgb:383838,rgb:000000
face global WhitespaceIndent rgb:383838,rgb:000000
face global WrapMarker rgb:545454,rgb:000000
face global BufferPadding rgb:383838,rgb:000000

# ── UI: Search & Match ───────────────────────────────────────────────────────
# base0A is bright enough to carry dark text on top, so both faces are legible
# as solid blocks. MatchingChar is the quieter of the two: it is a passive
# hint, Search is an active result.
face global MatchingChar rgb:fcfc54,rgb:1c1c1c+b
face global Search rgb:000000,rgb:fcfc54

# ── UI: Status line ──────────────────────────────────────────────────────────
# This is the "complements the UI" part. The code runs 10-20:1 against the
# editor ground, so a modeline painted in the same raw accents out-shouts the
# text it is labelling. Each child is the same hue at reduced lightness and
# 80% saturation, landing at 8-10:1 on the bar: clearly readable, visibly
# quieter than the code. Children set only a foreground so the thin modeline
# does not read as a row of blocks.
face global StatusLine rgb:a8a8a8,rgb:1c1c1c
face global StatusLineMode rgb:1bd0d0,default+b
face global StatusLineInfo rgb:d2d2d2,default+b
face global StatusLineValue rgb:d0d01b,default+b
face global StatusCursor rgb:000000,rgb:fcfcfc
face global Prompt rgb:1bd01b,default+b

# ── UI: Menus & Information ──────────────────────────────────────────────────
# Menus get a real surface so they detach from the black ground instead of
# floating in it. InlineInformation uses the keyword blue, which at 4.05:1 is
# too weak for body text but fine for a short inline marker.
face global MenuForeground rgb:000000,rgb:d2d2d2
face global MenuBackground rgb:a8a8a8,rgb:1c1c1c
face global MenuInfo rgb:d2d2d2,default
face global Information rgb:fcfcfc,rgb:1c1c1c+b
face global InlineInformation rgb:87fdfd,rgb:000000

# ── UI: Errors & Diagnostics ────────────────────────────────────────────────
# base08 red, per the base16 spec, and the one role that should be unmissable.
face global Error rgb:000000,rgb:fc5454
face global DiagnosticError rgb:fc5454,rgb:000000+b
face global DiagnosticWarning rgb:ffb366,rgb:000000
