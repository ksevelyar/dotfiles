{ config, ... }:
let
  stableTarball =
    fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-20.03.tar.gz;
  # unstableTarball =
  # fetchTarball {
  # url = "https://github.com/nixos/nixpkgs/archive/554e90cae7e9103a66c6b16e3a5888f292731f72.tar.gz";
  # # Hash obtained using `nix-prefetch-url --unpack <url>`
  # sha256 = "1bmx2lqp8fbkh7ddzjhjdz62cl4bx59cyzaix1wrmba21y0f977a";
  # };
in
{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      stable = import stableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  nix = {
    useSandbox = true;

    binaryCaches = [
      "https://idempotent-desktop.cachix.org"
    ];
    binaryCachePublicKeys = [
      "idempotent-desktop.cachix.org-1:OkWDud90b2/k/k1yIUg1lxZdNRWEvCfv6zSSRQ75lVM="
    ];

    # 🍑 smooth rebuilds
    daemonNiceLevel = 2; # 19 max
    daemonIONiceLevel = 2; # 7 max

    # free up to 10GiB whenever there is less than 10GB left: 
    extraOptions = ''
      connect-timeout = 5 
      min-free = ${toString (10 * 1024 * 1024 * 1024)}
      max-free = ${toString (10 * 1024 * 1024 * 1024)}
    '';
  };
}
