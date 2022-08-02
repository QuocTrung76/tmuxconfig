#!/usr/bin/env bash

# dateOfWeek=$( date +"%a" )
# case $dateOfWeek in
#     "Mon")
#         theme="duotone-sea";;
#     "Tue")
#         theme="duotone-space";;
#     "Wed")
#         theme="duotone-forest";;
#     "Thu")
#         theme="duotone-sky";;
#     "Fri")
#         theme="duotone-earth";;
#     "Sat")
#         theme="edge";;
#     *)
#         theme="paper";;
# esac
# 
# time=$( date +"%0H%0M" )
# if [ $time -le 0600 ] || [ $time -ge 1900 ]
# then
#     theme="dracula"
# fi

theme="dracula"
colorPath="${HOME}/.tmux/themes/color/$theme.sh"
. "$colorPath"
background=$windowBg

##
# left side of the statusbar
prefix="#[fg=$background,bg=#{?client_prefix,$prefixFlag,$leftFore},bold]"
leftStatus="$prefix #S #[bg=$background]"

##
# Right side of the statusbar
lowlight="#[fg=$rightFore,bg=$background,nobold]"
hightlight="#[fg=$background,bg=$rightFore,bold]"
reset="#[fg=$foreground,bg=$background,nobold]"
date="$lowlight%-d-%b %R"
hostname="$hightlight AUTO-LAB #[bg=$background]"
memCpuLoad="#(~/.tmux/scripts/mem_cpu_load.sh $colorPath)"
changeTheme="#(~/.tmux/scripts/change_theme.sh)"
rightStatus="${memCpuLoad} $reset| ${date} ${hostname}"

##
# Windows status
active="#[fg=$winActFore,bg=#{?pane_synchronized,$syncFlag,$background},nobold]"
passive="#[fg=$winPasFore,bg=$background,nobold]"
winActive="$active#I:#W#F" # active window
winPassive="$passive#I:#W#F" # passive window

##
# Statusbar settings
tmux set-option -g window-active-style "bg=$background"
tmux set-option -g window-style "bg=$background"
tmux set-option -g pane-active-border-style "bg=$background,fg=$activePane"
tmux set-option -g pane-border-style "bg=$background,fg=$passivePane"
tmux set-option -g message-style "bg=$background,fg=$message"
tmux set-option -g status-style "bg=$background,fg=$message"

##
# print left side of the statusbar
tmux set-option -g status-left "$leftStatus" # sessionname

##
# print right side of the statusbar
tmux set-option -g status-right "$rightStatus" # date|time

##
# print windows status
tmux set-option -g window-status-separator " " # space between windows
tmux set-option -g window-status-current-format "$winActive" # active window
tmux set-option -g window-status-format "$winPassive" # passive windows

##
# Pane number display
tmux set-option -g display-panes-active-colour "$winActFore"
tmux set-option -g display-panes-colour "$winPasFore"

##
# Copy mode style
tmux set-option -g mode-style "bg=$modeBack,fg=$modeFore"

##
# Clock
tmux set-window-option -g clock-mode-colour "$clock"

#Bell
tmux set-window-option -g window-status-activity-style "bold"
tmux set-window-option -g window-status-bell-style "bold"
