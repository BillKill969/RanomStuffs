# soviet-oled.tmux — Standalone tmux theme snippet
# Source in ~/.tmux.conf with: run-shell "tmux source-file /path/to/soviet-oled.tmux"

# Soviet OLED theme colors
thm_bg="#000000"          # Pitch black OLED canvas
thm_fg="#d8cfc4"          # Warm book paper text
thm_cyan="#45a39e"        # Industrial turquoise enamel
thm_black="#282222"       # Dark graphite border
thm_gray="#141313"        # Subtle charcoal for status capsules & messages
thm_magenta="#c58f9d"     # Book-cover burgundy
thm_pink="#d6a1af"        # Light burgundy
thm_red="#e36a5b"         # Soviet poster printing red (active focus / prefix)
thm_green="#65aa88"       # Green printing ink
thm_yellow="#d1b078"      # Workshop brass (current window tick, clock)
thm_blue="#5b93bc"        # Enamel blue (inactive window indices)
thm_orange="#d29a69"      # Ochre
thm_black4="#382e36"      # Muted plum selection (copy mode)

# Status bar settings
set -g status "on"
set -g status-bg "${thm_bg}"
set -g status-justify "left"
set -g status-left-length "100"
set -g status-right-length "100"

# Messages
set -g message-style "fg=${thm_yellow},bg=${thm_gray},align=centre"
set -g message-command-style "fg=${thm_yellow},bg=${thm_gray},align=centre"

# Panes
set -g pane-border-style "fg=${thm_black}"
set -g pane-active-border-style "fg=${thm_red}"

# Windows
set -g window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
set -g window-status-separator ""
set -g window-status-style "fg=${thm_fg},bg=${thm_bg},none"

# Statusline - current window
set -g window-status-current-format "#[fg=${thm_red},bg=${thm_bg}] #I: #[fg=${thm_yellow},bg=${thm_bg}](✓) #[fg=${thm_cyan},bg=${thm_bg}]#(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) #[fg=${thm_magenta},bg=${thm_bg}]"

# Statusline - other windows
set -g window-status-format "#[fg=${thm_blue},bg=${thm_bg}] #I: #[fg=${thm_fg},bg=${thm_bg}]#W"

# Statusline - right side
set -g status-right "#[fg=${thm_blue},bg=${thm_bg},nobold,nounderscore,noitalics]#[fg=${thm_bg},bg=${thm_blue},nobold,nounderscore,noitalics] #[fg=${thm_fg},bg=${thm_gray}] #W #{?client_prefix,#[fg=${thm_red}],#[fg=${thm_cyan}]}#[bg=${thm_gray}]#{?client_prefix,#[bg=${thm_red}],#[bg=${thm_cyan}]}#[fg=${thm_bg}] #[fg=${thm_fg},bg=${thm_gray}] #S "

# Statusline - left side (empty)
set -g status-left ""

# Modes
set -g clock-mode-colour "${thm_yellow}"
set -g mode-style "fg=${thm_yellow} bg=${thm_black4} bold"
