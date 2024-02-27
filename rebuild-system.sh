system=$1
if [[ ! -f ./systems/$system.nix ]]; then
    echo "error: System \"$system\" does not exist."
    exit
fi

vim "./systems/$system.nix"
alejandra . &>/dev/null
git diff -U0 *.nix
echo "Rebuilding "$system"..."
sudo nixos-rebuild switch --flake .#$system &> .nixos-switch.log \
    || (cat .nixos-switch.log | grep --color error && false)
current = $(nixos-rebuild list-generations | grep current)
git commit -am "feat($system): Generation $current"
