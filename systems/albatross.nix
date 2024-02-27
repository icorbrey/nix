{ config, lib, pkgs, nixos-wsl, ... }:
{
    imports = [nixos-wsl.nixosModules.wsl];

    users.users.icorbrey = {
        description = "Isaac Corbrey";
        home = "/home/icorbrey";
        isNormalUser = true;
    };

    environment.systemPackages = with pkgs; [
        wget
        vim
    ];

    programs.git.enable = true;

    wsl = {
        startMenuLaunchers = true;
        defaultUser = "icorbrey";
        nativeSystemd = true;
        enable = true;
    };

    # Don't change this!
    system.stateVersion = "23.11";
}
