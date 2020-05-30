set fish_greeting

set -x PATH $PATH ~/.npm-global/bin
set -x ERL_AFLAGS "-kernel shell_history enabled" # save iex history

set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fd --type d .'

function zeal-docs-fix
  pushd "$HOME/.local/share/Zeal/Zeal/docsets" >/dev/null || return
  find . -iname 'react-main*.js' -exec rm '{}' \;
  popd >/dev/null || exit
end

git_aliases

set -u DEFAULT_USER (whoami)
