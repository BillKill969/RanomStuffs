##color
colorscheme lucius

## highlighting
# display line numbers
add-highlighter global/ number-lines -hlcursor -relative -separator "  " -cursor-separator " |"
# show matching symbols
add-highlighter global/ show-matching

#command   #scope #name   #value
set-option global tabstop 4
set-option global indentwidth 4

#no-clippy
set-option global ui_options terminal_assistant=none

# unselect on <esc>
map global normal <esc> ";,"

source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/plug.kak" noload

#replace bg color
#declare-option str opaque_background 'rgb:0f0e06'
#set-face global Default    "default,%opt{opaque_background}"
#set-face global StatusLine "default,%opt{opaque_background}"

# autopairs
plug "alexherbo2/auto-pairs.kak" config %{
  enable-auto-pairs
}

# fzf
plug "andreyorst/fzf.kak" config %{
    require-module fzf
    require-module fzf-grep
    require-module fzf-file
} defer fzf %{
    # syntax highlighting command for previews (assuming 'bat')
    set-option global fzf_highlight_command "bat --color=always {}"
} defer fzf-file %{
    # file search command
    set-option global fzf_file_command "fd --type f --no-ignore-vcs"
} defer fzf-grep %{
    # text search command inside files (ripgrep)
    set-option global fzf_grep_command "rg --column --line-number --no-heading --color=always --smart-case"
}

# space for fzf key
map -docstring "open fzf" global user f ": fzf-mode<ret>"

# x like helix
plug "evanrelf/byline.kak" config %{
  require-module "byline"
}

## lsp
eval %sh{kak-lsp}
hook global WinSetOption filetype=(c) %{
  lsp-enable-window
  lsp-inlay-diagnostics-enable global
}

## enable syntax highlighting for each lang
# c
hook global WinSetOption filetype=c %{
  hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
  hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
  hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
  hook -once -always window WinSetOption filetype=.* %{
    remove-hooks window semantic-tokens
  }
}

# tabs for autocomplete
hook global InsertCompletionShow .* %{
  try %{
    # this command temporarily removes cursors preceded by whitespace;
    # if there are no cursors left, it raises an error, does not
    # continue to execute the mapping commands, and the error is eaten
    # by the `try` command so no warning appears.
    execute-keys -draft 'h<a-K>\h<ret>'
    map window insert <tab> <c-n>
    map window insert <s-tab> <c-p>
    hook -once -always window InsertCompletionHide .* %{
      unmap window insert <tab> <c-n>
      unmap window insert <s-tab> <c-p>
    }
  }
}

plug "ftonneau/nanoline.kak" config %{
    set-option global nanoline_rw_face_light "rgb:000000,rgb:ffab91"
    nanoline dark
    nanoline-format
}
