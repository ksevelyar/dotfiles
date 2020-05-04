set fish_greeting

set -x PATH $PATH ~/scripts
set -x ERL_AFLAGS "-kernel shell_history enabled"

if not functions -q fisher
  echo 'Installing fisher...'
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl -s https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher > /dev/null 2>&1
  echo -e "Done.\n"
end

if [ ! -e ~/.config/nvim/autoload/plug.vim ]
  echo 'Installing plug-vim...'
  curl -sfLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  nvim +PlugInstall +qall > /dev/null
  echo -e "Done.\n"
end

function zeal-docs-fix
  pushd "$HOME/.local/share/Zeal/Zeal/docsets" >/dev/null || return
  find . -iname 'react-main*.js' -exec rm '{}' \;
  popd >/dev/null || exit
end

function build-live-usb-min
  cd /tmp
  nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=/etc/nixos/live-usb-minimal.nix -o live-usb-min
  ls -lah live-usb-min/iso/nixos.iso

  sudo lsblk -f
  echo 'sudo dd bs=4M if=live-usb-min/iso/nixos.iso of=/dev/sdX status=progress && sync'
end

function build-live-usb
  cd /tmp
  nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=/etc/nixos/live-usb.nix -o live-usb
  ls -lah live-usb/iso/nixos.iso

  sudo lsblk -f
  echo 'sudo dd bs=4M if=live-usb/iso/nixos.iso of=/dev/sdX status=progress && sync'
end

git_aliases

set -u DEFAULT_USER (whoami)
