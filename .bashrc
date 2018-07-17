# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PATH+=:/usr/bin/
PATH+=:/usr/local/bin
PATH+=:/sbin/
PATH+=:~/.config/composer/vendor/bin
PATH+=:/usr/bin/yakyak-linux-x64/

alias mysqlroot="mysql -uroot -proot"
alias mysqldumproot="mysqldump -uroot -proot"

alias ll="ls -lah"
alias llperm="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias cd..="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."
alias cd6="cd ../../../../../.."

#Vim shortcuts
alias v="vim ."
alias vclearswp="rm /home/djm/tmp/*.swp"

#file shortcuts
alias bconf="vim ~/.bashrc" 
alias bsource="source ~/.bashrc" 
alias vconf="sudo vim ~/.vimrc"
alias tmconf="vim ~/.tmux.conf"
alias tmsource="tmux source ~/.tmux.conf"
alias i3conf="sudo vim /home/djm/.i3/config"
alias myhelp="vim ~/Documents/myhelp.txt"
alias hosts="sudo vim /etc/hosts"
alias group="sudo vim /etc/group"
alias www="cd /var/www/"

#git
alias gpull="git pull origin" 
alias gpush="git push origin" 
alias gfetch="git fetch --all"
alias gcheck="git checkout"
alias gb="git checkout -b"
alias gba="git branch -r"
alias gm="git merge"
alias gstat="git status"
alias gstats="git status --porcelain | sed s/^...//"
alias gaa="git add ."
alias gcom="git commit -am"
alias gdel="git branch -D"
alias gigloc="git update-index --assume-unchanged"
alias grsoft="git reset --soft HEAD~"
alias grhard="git reset --hard HEAD" 
alias gstash="git stash" 
alias gapply="git stash apply" 
alias gdiff="git diff" 
alias gclean="git clean -fd" 
#Cache PW for git for 10 hours
alias gpw="git config --global credential.helper 'cache --timeout=36000'"
alias ggrep="git grep"
alias glast="git log --pretty=format: --name-only -n"
# AUTOCOMPLETE
test -f ~/.git-completion.bash && . $_

#TMUX
alias tmsource="tmux source-file ~/.tmux.conf"
alias tmn="tmux new-session -s"
alias tmls="tmux ls"
alias tma="tmux attach -t"
alias tmkill="tmux kill-session -t"
alias tmk="tmux kill-session -t"
alias tmd="tmux detach"

#DOCKER
alias dstat="docker ps -a"
alias dstop="docker stop $(docker ps -aq)"
alias drm="docker rm $(docker ps -aq)"
alias dstart="docker-compose -f ./docker/docker-compose.yml up -d"

#SOUND
alias sound="amixer -D pulse | grep %"

#NOTIFICATIONS
alias notifyconf="sudo vim ~/.dunstrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
