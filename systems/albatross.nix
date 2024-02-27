{
  nixos-wsl,
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [nixos-wsl.nixosModules.wsl];

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
