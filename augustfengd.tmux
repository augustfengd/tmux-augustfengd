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
tmux set-option -g status-right "#[bg=${act2},fg=${base},italics]#{?#{!=:#{pane_current_command},ssh}, #h,#[bg=${func}] #(ps -t #{pane_tty} -oargs | grep ssh | head --lines 1 | cut --delimiter @ --field 2 )} "
# explanation for the what the f. is going on.
# #{?                                       // ? is an introduction to tmux's conditional expression.
#   #{!=:#{pane_current_command},ssh},      // if #{pane_current_command} is ssh, returns 1, else 0.
#   #h,                                     // #h is the hostname of the local host
#   #(ps \                                  // use ps find the ssh process
#     --tty #{pane_tty}                     // list all processes attached to the pane's tty
#     -oargs \                              // show full cmdline in output
#       | grep ssh                          // filter for ssh commands
#         | head --lines 1 \                // only consider first ssh command
#           | cut --delimiter @ --field 2)} // split at @ and extract second field

# window names
tmux set-option -g window-status-current-format "#[bg=${act2},fg=${func}] #I #[fg=${base},bold,italics]#W "
tmux set-option -g window-status-format "#[bg=${bg1},fg=${base},italics,dim] #I #W"

# pane-active-border-style
tmux set-option -g pane-active-border-style fg=${act2}
tmux set-option -g pane-border-style fg=${bg1}
tmux set-option -g pane-border-lines heavy
tmux set-option -g pane-border-indicators arrows

# mode-style
tmux set-option -g mode-style bg=${highlight},bold

# message-style
tmux set-option -g message-style bg=${act1}

# menu-*-style
tmux set-option -g menu-selected-style fg=${act2}
tmux set-option -g menu-border-style fg=${act1}
tmux set-option -g menu-border-lines rounded
