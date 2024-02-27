{ config, pkgs, ... }:
{
    home.homeDirectory = "/home/icorbrey";
    home.username = "icorbrey";

    home.packages = with pkgs; {
        neofetch
    };

    # Don't change this!
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;
}
