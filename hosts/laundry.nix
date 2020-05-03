{ config, lib, pkgs, ... }:
{
  imports =
    [
      <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
      ../modules/aliases.nix
      ../modules/scripts.nix
      ../modules/boot.nix
      ../modules/common-packages.nix
      ../modules/extra-packages.nix
      ../modules/dev-packages.nix
      ../modules/games.nix
      ../modules/services.nix
      ../modules/x.nix
      ../modules/bluetooth.nix
      ../modules/sound.nix
      ../modules/absolute-proprietary.nix
      ../modules/firewall-desktop.nix
      ../modules/fonts.nix
      ../modules/nebula.nix
      ../modules/ssd.nix
      # ./modules/fonts-high-dpi.nix
      # ./modules/laptop.nix
      ../users/ksevelyar.nix
    ];

  environment.etc."/nebula/node.crt".source = /storage/nebula/laundry.crt;
  environment.etc."/nebula/node.key".source = /storage/nebula/laundry.key;
  environment.etc."/nebula/node.yml".source = /storage/nebula/node.yml;
  environment.etc."/nebula/ca.crt".source = /storage/nebula/ca.crt;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    cpu.intel.updateMicrocode = true;
    nvidia.modesetting.enable = true;
  };

  networking.hostName = "laundry";
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];
  boot.plymouth.enable = false;

  swapDevices = [];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/044a758f-4252-4e42-b68c-a87d2345dc4c";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/3A05-EA05";
      fsType = "vfat";
      options = [ "noatime" "nodiratime" ]; # ssd
    };

  fileSystems."/storage" =
    {
      device = "/dev/disk/by-uuid/bd7a95b1-0a44-4477-8616-177b95561ad1";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" ];
    };

  fileSystems."/srv/storage/" = {
    device = "/storage/tmp";
    options = [ "bind" ];
  };

  fileSystems."/srv/vvv/" = {
    device = "/storage/vvv";
    options = [ "bind" ];
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /srv         192.168.0.1/24(ro,all_squash,insecure,fsid=0,crossmnt)
    /srv/storage 192.168.0.1/24(rw,nohide,all_squash,insecure)
    /srv/vvv     192.168.0.1/24(rw,nohide,all_squash,insecure)
  '';

  services.aria2 = {
    downloadDir = "/storage/tmp";
  };

  services.syncthing = {
    enable = false;
    user = "ksevelyar";
    dataDir = "/home/ksevelyar/.syncthing";
    openDefaultPorts = true;
  };
}
