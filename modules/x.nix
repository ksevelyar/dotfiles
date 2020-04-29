{ config, pkgs, lib, ... }:
# let
#   compiledLayout = pkgs.runCommand "keyboard-layout" {} ''
#     ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${../assets/rukbi_en} $out
#   '';
# in
{

  environment.systemPackages = with pkgs;
    let
      polybar = pkgs.polybar.override {
        pulseSupport = true;
      };
    in
      [
        alacritty
        firefoxWrapper
        tor-browser-bundle-bin
        zathura
        evince
        betterlockscreen
        spaceFM

        # themes
        lxappearance-gtk3
        vanilla-dmz
        ant-dracula-theme
        paper-icon-theme

        glxinfo
        feh
        transmission_gtk
        polybar
        xlsfonts
        xxkb
        xorg.xev
        xorg.xfontsel
        xorg.xfd
        xorg.xkbcomp
        xcape

        # dev
        notepadqq

        # sec
        lxqt.lxqt-policykit

        # sys
        keepassx-community
        system-config-printer
        maim
        simplescreenrecorder
        xclip
        rofi
        ulauncher
        pavucontrol
        libnotify
        dunst

        # media
        mpv
        imv
        nomacs

        # fs
        spaceFM

        gparted
        # vncpasswd
        # x0vncserver -rfbauth ~/.vnc/passwd
        tigervnc

        # laptop
        arandr
      ];

  programs.browserpass.enable = true;
  programs.qt5ct.enable = true;
  programs.slock.enable = true;

  services.picom = {
    enable = true;
    fade = false;
    shadow = false;
    backend = "glx";
    vSync = true;
  };

  environment.shellAliases = {
    x = "sudo systemctl start display-manager.service";
    xr = "sudo systemctl restart display-manager.service";
  };

  console.useXkbConfig = true;

  # ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${compiledLayout} $DISPLAY
  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "none+xmonad";
      sessionCommands = ''
        sh ~/.fehbg &
        xsetroot -cursor_name left_ptr
        
        lxqt-policykit-agent &
        xxkb &
        xcape -e 'Super_R=Super_R|X'
      '';
    };
    serverFlagsSection = ''
      Option "BlankTime" "180"
      Option "StandbyTime" "0"
      Option "SuspendTime" "0"
      Option "OffTime" "0"
    '';

    displayManager.lightdm = {
      enable = true;
      background = "/etc/nixos/assets/displayManager.png";

      greeters.gtk = {
        enable = true;
        cursorTheme = {
          name = "Vanilla-DMZ";
          package = pkgs.vanilla-dmz;
        };
      };
    };

    layout = "us,ru";
    xkbOptions = "grp:caps_toggle,grp:alt_shift_toggle,grp_led:caps";
    desktopManager = {
      xterm.enable = false;
    };

    windowManager = {
      xmonad.enable = true;
      xmonad.enableContribAndExtras = true;
      xmonad.extraPackages = hpkgs: [
        hpkgs.xmonad-contrib
        hpkgs.xmonad-extras
        hpkgs.xmonad
      ];
    };
  };
}
