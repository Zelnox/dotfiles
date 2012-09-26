# Aliases
alias ls='ls -G' # for colours
alias gw='cd ~/Documents/work/'
alias gsb='cd ~/Dropbox/sandbox/'

# Homebrew
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source ~/.git-completion.bash
source ~/.git-prompt.sh
function rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
    [ "$gemset" != "" ] && echo "@$gemset"
}
function BRANCH {
  __git_ps1 " (%s) "
}
function COLOR_ON {
  echo -ne "\[\e[38;5;$1m\]"
}
function COLOR_OFF {
  echo -ne "\[\e[m\]"
}
export GIT_PS1_SHOWDIRTYSTATE=false
export GIT_PS1_SHOWUNTRACKEDFILES=false
export PS1="$(COLOR_ON 99)\u$(COLOR_OFF)$(COLOR_ON 125)@$(COLOR_OFF)$(COLOR_ON 95)\h$(COLOR_OFF) \W$(rvm_version) \$(BRANCH) \$ "
export PS2="> "
