export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#aliases
alias ls='ls -G' # for colours
alias gw='cd ~/Documents/work/'
alias gsb='cd ~/Documents/sandbox/'
alias be='bundle exec minitest'

# Homebrew
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi
 
# Shell prompt
export LSCOLORS=Exfxcxdxbxegedabagacad

function COLOR_ON {
  echo -ne "\[\e[38;5;$1m\]"
}
function COLOR_OFF {
  echo -ne "\[\e[m\]"
}
export PS1="$(COLOR_ON 99)\u$(COLOR_OFF)$(COLOR_ON 125)@$(COLOR_OFF)$(COLOR_ON 182)\h$(COLOR_OFF) \W $ "
export PS2="> "

export MYSQL_SOCKET=/tmp/mysql.sock

export EDITOR=/usr/local/bin/nvim

# gem_home
source /usr/local/share/gem_home/gem_home.sh

# promptline.vim
source $HOME/.shell_prompt.sh

# z, most recent dirs
. `brew --prefix`/etc/profile.d/z.sh

# if missing, needs to be wget from the repo
[[ -s $HOME/.tmuxinator/scripts/tmuxinator.bash ]] && source $HOME/.tmuxinator/scripts/tmuxinator.bash

# minitest-sprint
complete -o bashdefault -f -C 'ruby --disable-gems $(gem which minitest/complete)' minitest

if [[ "$RUBY_VERSION" == "2.0.0" ]]; then
  export RUBY_HEAP_MIN_SLOTS=500000
  export RUBY_GC_MALLOC_LIMIT=8000000
  export RUBY_FREE_MIN=32768
else
  export RUBY_GC_HEAP_FREE_SLOTS=4096
  export RUBY_GC_HEAP_INIT_SLOTS=10000
  export RUBY_GC_MALLOC_LIMIT=8000000
fi

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
