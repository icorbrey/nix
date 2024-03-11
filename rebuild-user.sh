user=$1
if [[ ! -f ./users/$user.nix ]]; then
    echo "error: User \"$user\" does not exist."
    exit
fi

vim "./users/$user.nix"
alejandra . &>/dev/null
git diff -U0 **/*.nix
echo "Rebuilding "$user"..."
home-manager switch --flake .#$user &> .nixos-switch.log \
    || (cat .nixos-switch.log | grep --color error && false)
current=$(home-manager generations 2>/dev/null | head -n 1 | awk '{print $5}')
git commit -am "feat($user): Generation $current"
