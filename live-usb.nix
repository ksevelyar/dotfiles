# nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=/etc/nixos/live-usb.nix
# sudo dd bs=4M if=/storage/tmp/nix.iso of=/dev/sdc status=progress oflag=sync

{ config, pkgs, lib, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-base.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
    ./modules/aliases.nix
    ./modules/services.nix
    ./modules/x.nix
    ./modules/fonts.nix

    ./modules/common-packages.nix
    ./modules/extra-packages.nix

    ./users/live-usb.nix
  ];

  # isoImage.splashImage = /etc/nixos/assets/grub.png;
  nixpkgs.overlays = [ (import ./overlays) ];

  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "none+xmonad";
    };

    displayManager.lightdm = {
      autoLogin = { enable = false; user = "nixos"; };
    };
  };

  nixpkgs.config.allowUnfree = true;
  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true; # Required for Steam
    opengl.driSupport32Bit = true; # Required for Steam
  };
  sound.enable = true;

  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  # Enable SSH in the boot process.
  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];
  services.openssh.permitRootLogin = lib.mkForce "yes";

  networking.networkmanager.enable = true;

  users.defaultUserShell = pkgs.fish;

  users.users.root = {
    # jkl
    initialHashedPassword = lib.mkForce "$6$krVCM45j$6lYj1WKEX8q7hMZGG6ctAG6kQDDND/ngpGOwENT1TIOD25F0yep/VvIuL.v9XyRntLJ61Pr8r7djynGy5lh3x0";
  };

  nix.binaryCaches = [ "https://cache.nixos.org" "https://aseipp-nix-cache.global.ssl.fastly.net" ];

  # isoImage.contents =
  #   [
  #     {
  #       source = /c.7z;
  #       target = "/c.7z";
  #     }
  #   ];

  services.mingetty.helpLine = ''
    The "nixos" and "root" accounts have "jkl" passwords.

    Type `x' to
    start the graphical user interface.

    .     .       .  .   . .   .   . .    +  .
      .     .  :     .    .. :. .___---------___.
           .  .   .    .  :.:. _".^ .^ ^.  '.. :"-_. .
        .  :       .  .  .:../:            . .^  :.:\.
            .   . :: +. :.:/: .   .    .        . . .:\
     .  :    .     . _ :::/:               .  ^ .  . .:\
      .. . .   . - : :.:./.                        .  .:\
      .      .     . :..|:                    .  .  ^. .:|
        .       . : : ..||        .                . . !:|
      .     . . . ::. ::\(                           . :)/
     .   .     : . : .:.|. ######              .#######::|
      :.. .  :-  : .:  ::|.#######           ..########:|
     .  .  .  ..  .  .. :\ ########          :######## :/
      .        .+ :: : -.:\ ########       . ########.:/
        .  .+   . . . . :.:\. #######       #######..:/
          :: . . . . ::.:..:.\           .   .   ..:/
       .   .   .  .. :  -::::.\.       | |     . .:/
          .  :  .  .  .-:.":.::.\             ..:/
     .      -.   . . . .: .:::.:.\.           .:/
    .   .   .  :      : ....::_:..:\   ___.  :/
       .   .  .   .:. .. .  .: :.:.:\       :/
         +   .   .   : . ::. :.:. .:.|\  .:/|
         .         +   .  .  ...:: ..|  --.:|
    .      . . .   .  .  . ... :..:.."(  ..)"
     .   .       .      :  .   .: ::/  .  .::\
  '';
}