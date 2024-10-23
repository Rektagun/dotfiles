# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# eval "$(oh-my-posh init bash)"
# eval "$(tmuxifier init -)"
# source ~/.cache/oh-my-posh/.poshthemes.json

#Tmuxifier
# export PATH="$HOME/.tmuxifier/bin:$PATH"
# eval "$(tmuxifier init -)"






# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
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
  # PS1="touch me :"
else
  # PS1="touch me :"
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


if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi













# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# some more ls aliases
# alias touch='nvim'
alias ll='ls -al'
# alias ll='ls -alF'
alias la='ls -Al'
alias l='ls -CF'
alias ..='cd ..'
alias root='cd /../root/'
alias home='cd /../home/'
alias conf='cd /../root/.config/nvim/ && nvim'
alias config='cd /../root/.config/nvim/ && nvim init.vim'
alias nvmf='nvim -c "Telescope find_files"'
alias nvms='cd /../home/SomSpect/ && nvim -c "Telescope find_files"'
alias yt='wslview https://www.youtube.com/'
alias gpt='wslview https://chat.openai.com/'
alias github='wslview https://github.com/Rektagun'
alias ggl='wslview https://www.google.com/search?q='
alias bashrc='nvim ~/.bashrc'
alias notes='cd /../home/notes/ && nvim'
alias roll='cd /../home/scripts/ && ./rollit.sh && cd /../home/'
alias task='cd /../home/scripts/ && ./doro.sh && cd /../home/'
alias scripts='cd /../home/scripts && nvm'
alias c='clear'
# alias tch='PS1="touch me:'
alias gkey='cd /../root/ && cat bruh.txt'
# alias piglet='figlet'
alias piglet='figlet -f small'

# alias task='./../home/scripts/doro.sh'
# alias npm='cd /../home/Shell\ Scripts/ && ./load.sh && cd /../home/'

# ggl() {
#     wslview https://www.google.com/search?q=${1}
# }

# function roll(){
#   local x=$1
#   while "$x"; do
#     cd /../home/Shell\ Scripts/ && ./rollit.sh
#     ((x--))
#   done
# }


ram(){
  if [ $EUID -ne 0 ]; then
    echo "A module of your Primary Memory has been popped from the stack/heap (check your pants/lappy) :p"
    return 0
  fi
  echo "Primary Memory has been charged to $1%"
}



mkdircd() {
  mkdir -p ${1} && cd ${1}
}

nvmc() {
  nvim -S ~/../home/sessions/${1:-config}.vim
}

nvmss() {
  cd ~/../home/ && nvim
}

bend() {
  cd ~/../home/${1:-SomSpect}/backend/ && nodemon server.js 
}
fend() {
  cd ~/../home/${1:-SomSpect}/frontend/ && npm start
}

alias nvm='nvim'
alias n='nvim'
alias g='git'
# alias vi='vim'
alias tm='tmux'
alias ns='tmux new -s'
# alias tmf='tmuxifier'

export EDITOR=nvim

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# neofetch starts as the terminal opens
alias nf='clear && neofetch'
cd /../home/
# neofetch
# nvim
# tmux source ~/.tmux.conf
tmux ls

# GoLang
export GOROOT=/root/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/root/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/share/dotnet

# # Starship
# eval "$(starship init bash)"
