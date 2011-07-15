# Aliases
alias ls='ls -G' # for colours
alias gw='cd ~/Documents/work/'

# Homebrew
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# Shell prompt
#. ~/.bash_prompt
function EXT_COLOR () { echo -ne "\e[38;5;$1m"; }
function CLOSE_COLOR () { echo -ne '\e[m'; }
export PS1="\[`EXT_COLOR 187`\]\u@\h\[`CLOSE_COLOR`\]\[`EXT_COLOR 174`\] \w \$ \[`CLOSE_COLOR`\] > "
export PS2="> "
export LSCOLORS=Exfxcxdxbxegedabagacad
#export LSCOLORS='di=38;5;108:fi=00:ln=38;5;116:ex=38;5;186'

# Ruby stuff (RVM, gem paths)
#. ~/.bash_ruby
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
