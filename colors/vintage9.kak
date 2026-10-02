# vintage9.kak — Plan 9 theme for Kakoune (OLED-friendly)
# Muted lab aesthetic, pure black bg, easy on the eyes for long coding sessions

evaluate-commands %sh{
    # Plan 9 palette — muted, functional, no-nonsense colors on pure black
    # Designed for OLED and readability

    bg="rgb:000000"             # pure black — OLED pixels off
    bg_soft="rgb:1a1a1a"        # soft black — status line, subtle UI
    fg="rgb:b0b8c0"            # Plan 9 pale grey-blue — main text, good readability
    fg_bright="rgb:e0e0e0"     # soft white — keywords, selections

    # Muted syntax colors — distinct but not harsh
    c_keyword="rgb:e0e0e0"     # soft white + bold — keywords
    c_type="rgb:80b8d8"        # Plan 9 blue — types, classes
    c_string="rgb:88c088"      # muted green — strings
    c_value="rgb:c8b060"       # muted amber — numbers, constants
    c_function="rgb:c8c888"    # pale yellow — function names
    c_comment="rgb:506070"    # dark grey-blue — recedes but readable
    c_variable="rgb:a0b0b8"    # pale grey — variables, params
    c_module="rgb:80b8b0"      # muted teal — modules, namespaces
    c_operator="rgb:708088"    # neutral grey — operators
    c_attribute="rgb:b8a060"   # muted gold — decorators, annotations
    c_meta="rgb:9080a8"        # muted purple — preprocessor, metadata
    c_builtin="rgb:78a8c8"     # pale blue — builtins, stdlib

    # UI colors — functional, understated
    c_cursor="rgb:2a2a2a"      # near-black — cursor bg
    c_selection="rgb:1a2a3a"   # deep blue-grey — selections
    c_status_bg="rgb:1a1a1a"   # soft black — status line
    c_error="rgb:c05050"       # muted red — errors
    c_warning="rgb:c8a040"     # muted amber — warnings
    c_info="rgb:5588aa"        # blue — info windows
    c_success="rgb:50a050"     # green — success states
    c_line_num="rgb:304050"    # dark grey — line numbers
    c_border="rgb:304050"      # subtle border

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
