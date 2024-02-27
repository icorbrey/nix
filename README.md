# nix

Backing repository for my Nix configurations.

## Usage

```
git clone https://github.com/icorbrey/nix
cd ./nix

# Load a system configuration
sudo nixos-rebuild switch --flake .#<system>

# Load a user configuration
home-manager switch --flake .#<user>
```

## License

This repository is distributed under the MIT license. See [LICENSE](./LICENSE)
for more details.
