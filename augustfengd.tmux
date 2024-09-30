#!/bin/sh

base=#b2b2b2
bg1=#292b2e
act1=#222226
act2=#5d4d7a
func=#8700af
highlight=#444155

# status-style
tmux set-option -g status-style "bg=${bg1}"

# status-left
tmux set-option -g status-left ""

# status-right
tmux set-option -g status-right ""

# window names

tmux set-option -w window-status-current-format "#[bg=${act2},fg=${func}] #I #[fg=${base},italics]#W "
tmux set-option -w window-status-format "#[bg=${bg1},fg=${base},italics,dim] #I #W"

# pane-active-border-style
tmux set-option -w pane-active-border-style fg=${act2}
tmux set-option -w pane-border-style fg=${act1}

# mode-style
tmux set-options -w mode-style bg=${highlight}

# message-style
tmux set-option -s message-style bg=${act1}

# menu-{}-style
tmux set-option -s menu-border-style bg=${func}

# Q: What is 'pane-active-border-style'?
# A: the border around panes.

# Q: What is 'status-left'?
# A: the entry to the left of the *window-list*.

# Q: What is the #I alias in FORMATS?
# A: It's an alias to the window_index variable.

# Q: What is the #W alias in FORMATS?
# A: It's an alias to the window_name variable.
