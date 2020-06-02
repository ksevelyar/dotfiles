{
  environment.shellAliases = {
    # https://www.quora.com/Unix-Why-are-explanations-in-man-pages-so-bad
    # try tldr instead of man
    h = "tldr" 
    # h rsync
    # h parted
    # h npm

    x = "sudo systemctl restart display-manager.service";

    ports = "sudo lsof -Pni"; # ports | fzf
    i = "id-info";
    l = "ls -lahXF --group-directories-first";
    j = "z"; # autojump alias for z.lua
    u = "aunpack"; # one tool to unpack them all

    e = "sudo nvim /etc/nixos/configuration.nix";
    refresh-channels = "id-refresh-channels";
    b = "sudo nixos-rebuild switch --keep-going";

    s = "sudo";
    p = "gopass";
    br = "b && systemctl restart display-manager.service";
    bu = "b --upgrade";
    collect-garbage = "sudo nix-collect-garbage --delete-older-than 30d";
    tm = "tmux new-session -A -s 🦙";
    off = "sleep 0.5; xset dpms force off; pkill -f spotify";
    pgrep = "pgrep --full";
    pkill = "pkill --full";

    v = "nvim";
    vo = "nvim -o (fzf)";
    vv = "nvim -U none"; # vanilla v

    g = "git";
    t = "task";
    fd = "fd --hidden --exclude .git";

    vnc-server = "x11vnc -repeat -forever -noxrecord -noxdamage -rfbport 5900";
    grab-display = "export DISPLAY=':0.0'";

    sss = "sudo systemctl stop";
    ssr = "sudo systemctl restart";

    # log sshd -f
    log = "sudo journalctl --output cat -u";

    id-inspect-store = "nix path-info -rSh /run/current-system | sort -k2h";

    # nix
    id-push = "sudo nix-store -qR --include-outputs /run/current-system | cachix push idempotent-desktop";
    # id-test-config nixos-config=/etc/nixos/hosts/kitt2000.nix 
    # id-test-config = "nix-build '<nixpkgs/nixos>' -A vm -I --no-out-link";
  };
}
