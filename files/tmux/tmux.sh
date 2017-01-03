#!/bin/bash

SESSION="$1"

# Set title of terminator
echo -ne "\033]0;$SESSION\007"

# Check if user config file exits
if [ -e /etc/tmux/tmux-$LC_BASTION.conf ] ; then
    CONFIG=/etc/tmux/tmux-$LC_BASTION.conf
else
    CONFIG=/etc/tmux/tmux.conf
fi

# Check if SESSION exits, if not, create it without connecting to it
check=$(tmux -L $LC_BASTION ls -F "#{session_name}" | egrep "^$SESSION\$")
if [ "Z${check}" = "Z" ] ; then
    tmux -L $LC_BASTION -f $CONFIG new -s $SESSION -d
fi

tmux -L $LC_BASTION -f $CONFIG attach -t $SESSION
