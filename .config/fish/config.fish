# Tmuxinator
#[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] and source $HOME/.tmuxinator/scripts/tmuxinator

# Exports
set -x MYSQL_SOCKET /tmp/mysql.sock
set -x EDITOR /usr/local/bin/nvim

# in .config/fish/config.fish:
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars ⚡
set __fish_git_prompt_char_dirtystate '⚡️ '
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'


# http://www.colourlovers.com/palette/629637/(◕〝◕)
function fish_prompt
  set last_status $status

  set_color fe4365
  printf '%s' (whoami)
  set_color fc9d9a
  printf '@'
  set_color f9cdad
  printf '%s' (hostname | cut -d . -f 1 | sed "s/verest//")
  printf '🐕 '
  set_color c8c8a9
  Printf '%s' (hostname | cut -d . -f 1 | sed "s/doge//")
  printf '🗻 '
  set_color normal

  #set_color $fish_color_cwd
  set_color 83af9b
  printf '%s'  (prompt_pwd)
  set_color normal

  printf '%s '  (__fish_git_prompt)

  set_color normal
end

alias be "bundle exec"
alias bem "bundle exec minitest"
