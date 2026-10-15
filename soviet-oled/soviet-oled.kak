# soviet-oled.kak — Refined OLED Dark colorscheme for Kakoune
# Inspired by Soviet visual culture (book burgundy, workshop brass, enamel blue, green ink, poster red)
# Optimised for OLED displays: pure #000000 canvas, non-destructive selections, and consistent typographic hierarchy.
# Reference: https://github.com/rezniqov/soviet.nvim

evaluate-commands %sh{
    # ── Palette ──────────────────────────────────────────────────────────
    # True OLED pitch black base
    bg="rgb:000000"
    bg_statusline="rgb:0c0b0b"   # Hairline lift for bottom bar
    bg_surface="rgb:121010"      # Active line number / subtle highlight
    bg_popup="rgb:181616"        # Floating windows / completion menu
    border="rgb:4a4040"          # Warm graphite border
    border_subtle="rgb:282222"   # Guides, whitespace, buffer padding (~)

    # Non-destructive selection tints (preserve syntax colors underneath)
    selection="rgb:382e36"           # Muted plum for primary selection
    selection_secondary="rgb:251e24" # Deeper plum for secondary multi-selections

    # Typography & Base Readings
    fg="rgb:d8cfc4"              # Warm book-paper text (soft, non-fatiguing)
    fg_bright="rgb:e9dfd0"       # High-contrast bright text
    operator="rgb:a89e97"        # Operators & punctuation (clear yet calm)
    muted="rgb:b7aaa3"           # Status text & secondary UI labels
    gutter="rgb:544c44"          # Cartographic gutter numbers
    comment="rgb:828068"         # Olive-khaki comment (subdued, WCAG AA compliant)
    documentation="rgb:b1a178"   # Warmer khaki for docstrings

    # Soviet Inks & Enamels (Semantic Hierarchy)
    red="rgb:e36a5b"             # Poster printing red (focal points, cursor, mode)
    red_bright="rgb:ef7565"      # Errors & critical alerts
    red_dark="rgb:a14c45"        # Error badges & deleted diffs
    burgundy="rgb:c58f9d"        # Book-cover burgundy (keywords, control flow)
    brass="rgb:d1b078"           # Workshop brass (functions, search, line cursor)
    ochre="rgb:d29a69"           # Ochre ink (numbers, booleans, constants, warnings)
    string="rgb:65aa88"          # Green printing ink (strings, characters)
    enamel_blue="rgb:5b93bc"     # Enamel blue (types, classes, interfaces)
    steel="rgb:7899a0"           # Industrial steel (modules, attributes, preprocessor)
    teal="rgb:45a39e"            # Turquoise enamel (builtins, links)
    olive="rgb:a8ac7d"           # Cartographic olive (hints, diagnostics)
    property="rgb:c6b8aa"        # Warm parchment for properties & identifiers

    printf "%s\n" "
        # ── Code & Syntax Highlighting ───────────────────────────────────
        # Typographic hierarchy: Bold keywords & types, calm functions & literals
        face global keyword             ${burgundy}+b
        face global builtin             ${teal}+b
        face global type                ${enamel_blue}+b
        face global function            ${brass}
        face global variable            ${fg}
        face global identifier          ${property}
        face global module              ${steel}
        face global string              ${string}
        face global value               ${ochre}
        face global operator            ${operator}
        face global attribute           ${steel}
        face global comment             ${comment}+i
        face global documentation       ${documentation}+i
        face global meta                ${steel}

        # ── Markup (Markdown, AsciiDoc) ──────────────────────────────────
        face global title               ${red}+b
        face global header              ${burgundy}+b
        face global mono                ${string}
        face global block               ${ochre}
        face global link                ${teal}+u
        face global bullet              ${red}
        face global list                ${fg}

        # ── Built-in Editor UI & Flow ────────────────────────────────────
        face global Default             ${fg},${bg}

        # Selections: '+g' sets only background, letting syntax highlighting
        # shine through without turning text into a monochrome block.
        face global PrimarySelection    default,${selection}+g
        face global SecondarySelection  default,${selection_secondary}+g

        # Cursors: Solid high-visibility badges on pitch black
        face global PrimaryCursor       ${bg},${red}+F
        face global SecondaryCursor     ${bg},${brass}+F
        face global PrimaryCursorEol    ${bg},${red}+F
        face global SecondaryCursorEol  ${bg},${brass}+F

        # Search Highlights
        face global Search              ${bg},${brass}+F

        # Gutter & Line Numbers
        face global LineNumbers         ${gutter},${bg}
        face global LineNumberCursor    ${brass},${bg_surface}+b
        face global LineNumbersWrapped  ${border_subtle},${bg}

        # Completion Menus & Information Floats
        face global MenuBackground      ${fg},${bg_popup}
        face global MenuForeground      ${bg},${brass}+b
        face global MenuInfo            ${steel},${bg_popup}+i
        face global Information         ${fg},${bg_popup}
        face global InlineInformation   ${fg},${bg_popup}

        # Status Line
        face global StatusLine          ${muted},${bg_statusline}
        face global StatusLineMode      ${bg},${red}+b
        face global StatusLineInfo      ${brass},${bg_statusline}
        face global StatusLineValue     ${string},${bg_statusline}
        face global StatusCursor        ${bg},${red}+F
        face global Prompt              ${red},${bg_statusline}+b

        # Diagnostics & Errors
        face global Error               ${fg_bright},${red_dark}+b
        face global DiagnosticError     ${red_bright}
        face global DiagnosticWarning   ${ochre}
        face global DiagnosticInfo      ${enamel_blue}
        face global DiagnosticHint      ${olive}

        # Structural & Auxiliary Highlighters
        face global MatchingChar        ${fg_bright},${selection}+b
        face global BufferPadding       ${border_subtle},${bg}
        face global Whitespace          ${border_subtle},${bg}+d
        face global WhitespaceIndent    ${border_subtle},${bg}
        face global WrapMarker          ${border_subtle},${bg}
    "
}
