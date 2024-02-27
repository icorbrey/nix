{
    description = "My NixOS configuration.";

    inputs = {
        # Stable packages
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

        # Unstable packages
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        # WSL support
        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

        # Home Manager
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {
        home-manager,
        nixos-wsl,
        nixpkgs,
        self
    } @ inputs: let 
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        homeConfigurations = {
            icorbrey = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [./users/icorbrey.nix];
            };
        };

        nixosConfigurations = {
            albatross = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = inputs;
                modules = [./systems/albatross.nix];
            };
        };
    };
}
