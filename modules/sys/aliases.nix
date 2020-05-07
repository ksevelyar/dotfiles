{
  environment.shellAliases = {
    lsof-all = "sudo lsof -i -P -n | grep LISTEN";
    i = "sh /etc/scripts/system-info.sh";
    l = "ls -lahXF --group-directories-first";
    j = "z"; # autojump alias for z
    u = "aunpack";
    e = "sudo nvim /etc/nixos/configuration.nix";
    b = "sudo nixos-rebuild switch --keep-going";
    br = "b && xmonad --restart";
    bu = "b --upgrade";
    collect-garbage = "sudo nix-collect-garbage --delete-older-than 30d";
    tm = "tmux new-session -A -s main";
    off = "sleep 0.5; xset dpms force off; pkill -f gpmdp";
    pgrep = "pgrep --full";
    p = "gopass";
    pkill = "pkill --full";
    v = "nvim";
    vanilla-vim = "nvim -U none";
    g = "git";
    t = "task";
    py-files-server = "python3 -m http.server 9000";
    refresh-channels = "sh /etc/scripts/refresh-channels.sh";
  };
}