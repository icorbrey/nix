{ config, lib, pkgs, nixos-wsl, ... }:
{
    imports = [nixos-wsl.nixosModules.wsl];

    nix.settings.experimental-features = "nix-command flakes";
    networking.hostName = "albatross";

    users.users.icorbrey = {
        description = "Isaac Corbrey";
        home = "/home/icorbrey";
        isNormalUser = true;
    };

    wsl = {
        startMenuLaunchers = true;
        defaultUser = "icorbrey";
        nativeSystemd = true;
        enable = true;
    };

    # Don't change this!
    system.stateVersion = "23.11";
    programs.git.enable = true;
}
