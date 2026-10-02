# vintage.kak — Commodore 64 / 8-bit retro theme for Kakoune (OLED-friendly)
# Deep blacks, muted retro colors tuned for long coding sessions

evaluate-commands %sh{
    # OLED-optimized palette — pure black bg, carefully balanced colors
    # for reduced eye strain and clear syntax differentiation

    bg="rgb:000000"            # pure black — OLED pixels off
    bg_soft="rgb:1a1a1a"       # soft black — status line, subtle UI
    fg="rgb:a8c0d8"           # muted steel blue — easy on eyes for long sessions
    fg_bright="rgb:e8e8e8"    # bright white — keywords, selections

    # Syntax hues — each distinct, none harsh
    c_keyword="rgb:e8e8e8"    # bright white + bold — commands/keywords
    c_type="rgb:6fb3d8"       # medium blue — types, classes
    c_string="rgb:8fc98f"     # soft green — strings
    c_value="rgb:d8b86f"      # warm amber — numbers, booleans, constants
    c_function="rgb:e8c86f"   # warm yellow — function names
    c_comment="rgb:5a6a7a"   # desaturated blue-grey — recedes but readable
    c_variable="rgb:b8a8d8"   # soft lavender — variables, params
    c_module="rgb:6fc8c8"     # teal — modules, namespaces
    c_operator="rgb:8a9aa8"   # neutral grey — operators, punctuation
    c_attribute="rgb:c8a86f"  # golden — decorators, annotations
    c_meta="rgb:9878b8"       # muted purple — preprocessor, metadata
    c_builtin="rgb:78b8d8"    # light blue — builtins, stdlib

    # UI colors
    c_cursor="rgb:2a2a2a"     # near-black — cursor bg
    c_selection="rgb:1a2a4a"  # deep blue — selections
    c_status_bg="rgb:1a1a1a"  # soft black — status line
    c_error="rgb:cc5555"      # soft red — errors
    c_warning="rgb:ccaa44"    # warm amber — warnings
    c_info="rgb:5588aa"       # blue — info windows
    c_success="rgb:55aa55"    # green — success states
    c_line_num="rgb:3a4a5a"   # dark blue-grey — line numbers
    c_border="rgb:2a3a4a"     # subtle border

    echo "
        # ── Base / UI ──────────────────────────────────────────
        face global Default ${fg},${bg}
        face global PrimarySelection ${fg_bright},${c_selection}
        face global SecondarySelection ${fg},${c_selection}
        face global PrimaryCursor ${bg},${fg_bright}
        face global SecondaryCursor ${bg},${fg}
        face global PrimaryCursorEol ${bg},${c_module}
        face global SecondaryCursorEol ${bg},${c_module}
        face global LineNumbers ${c_line_num},${bg}
        face global LineNumberCursor ${fg_bright},${bg}+r
        face global LineNumbersWrapped ${c_line_num},${bg}+i
        face global WrapMarker ${c_module},${bg}
        face global BufferPadding ${c_selection},${bg}

        # ── Status line ────────────────────────────────────────
        face global StatusLine ${fg},${c_status_bg}
        face global StatusLineMode ${c_function},${c_status_bg}
        face global StatusLineInfo ${c_module},${c_status_bg}
        face global StatusLineValue ${c_string},${c_status_bg}
        face global StatusCursor ${c_status_bg},${c_module}

        # ── Menu / info / errors ───────────────────────────────
        face global MenuForeground ${fg_bright},${c_selection}
        face global MenuBackground ${fg},${c_selection}
        face global MenuInfo ${c_module},${c_selection}
        face global Information ${bg},${c_warning}
        face global InlineInformation @Information
        face global Error ${bg},${c_error}
        face global DiagnosticError ${c_error},${bg}
        face global DiagnosticWarning ${c_warning},${bg}
        face global Prompt ${c_function},${bg}
        face global MatchingChar ${fg_bright},${bg}+b
        face global Whitespace ${c_line_num},${bg}+f
        face global WhitespaceIndent @Whitespace

        # ── Syntax: code ───────────────────────────────────────
        face global value ${c_value}
        face global type ${c_type}
        face global variable ${c_variable}
        face global module ${c_module}
        face global function ${c_function}
        face global string ${c_string}
        face global keyword ${c_keyword}+b
        face global operator ${c_operator}
        face global attribute ${c_attribute}
        face global comment ${c_comment}+i
        face global documentation @comment
        face global meta ${c_meta}
        face global builtin ${c_builtin}

        # ── Syntax: markup ─────────────────────────────────────
        face global title ${fg_bright}+b
        face global header ${c_function}
        face global mono ${fg}
        face global block ${c_module}
        face global link ${c_builtin}
        face global bullet ${c_value}
        face global list ${fg}
    "
}
