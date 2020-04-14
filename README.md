# clean

![screen](https://i.imgur.com/HU6YF0L.png)

# neovim + tmux (via xmonad scratchpad)

![screen](https://i.imgur.com/z95oCew.png)

# spacefm

![screen](https://i.imgur.com/h2nnCWM.png)

# google-chrome, gotop, gpmdp

![screen](https://i.imgur.com/wiIFOdI.png)

# firefox

![screen](https://i.imgur.com/BYpqCbi.png)

# steam

![screen](https://i.imgur.com/GxNoW6l.png)

# doom 2

![screen](https://i.imgur.com/xXcIXu0.png)

# install

```
sudo cp -ra /etx/nixos/{,.bak}
sudo mkdir -p /storage/tmp

sudo nix-channel --add https://nixos.org/channels/nixos-19.09 stable
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update

sudo nixos-rebuild switch --keep-going
```
