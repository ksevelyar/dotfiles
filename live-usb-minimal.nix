# nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=/etc/nixos/live-usb.nix
# sudo dd bs=4M if=result/iso/nixos.iso of=/dev/sdc status=progress oflag=sync

{ config, pkgs, lib, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
    ./modules/aliases.nix
    # ./modules/services.nix
    # ./modules/x.nix
    # ./modules/fonts.nix

    ./modules/common-packages.nix
    # ./modules/extra-packages.nix

    ./users/live-usb.nix
  ];

  # isoImage.splashImage = /etc/nixos/assets/grub.png;
  # isoImage.volumeID = "nixos.iso";
  # nixpkgs.overlays = [ (import ./overlays) ];

  nixpkgs.config.allowUnfree = true;
  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
    pulseaudio.enable = false;
  };
  sound.enable = false;

  boot.loader.timeout = lib.mkForce 0;
  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  # Enable SSH in the boot process.
  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];
  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
    passwordAuthentication = true;
  };

  networking.networkmanager.enable = true;
  networking.wireless.enable = lib.mkForce false;

  users.defaultUserShell = pkgs.fish;

  users.users.root = {
    # jkl
    initialHashedPassword = lib.mkForce "$6$krVCM45j$6lYj1WKEX8q7hMZGG6ctAG6kQDDND/ngpGOwENT1TIOD25F0yep/VvIuL.v9XyRntLJ61Pr8r7djynGy5lh3x0";
  };

  nix.binaryCaches = [ "https://cache.nixos.org" "https://aseipp-nix-cache.global.ssl.fastly.net" ];

  services.mingetty.autologinUser = lib.mkForce "mrpoppybutthole";
  services.mingetty.greetingLine = ''\l'';
  services.mingetty.helpLine = lib.mkForce ''
    The "root" account has "jkl" password.

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


  environment.etc."profile.local".text = ''
    sudo ln -s /tmp /storage
  '';
}
