{ config, pkgs, ... }:
{
    home.homeDirectory = "/home/icorbrey";
    home.username = "icorbrey";

    home.packages = with pkgs; [
        neofetch
    ];

    programs.vim = {
        defaultEditor = true;
        enable = true;
        settings = {
            background = "dark";
        };
        plugins = with pkgs.vimPlugins; [
            # Text editing
            vim-surround

            # Git
            vim-fugitive

            # Theming
            vim-airline
            vim-airline-themes
        ];
        extraConfig = ''
            let g:airline_theme = 'bubblegum'
        '';
    };

    # Don't change this!
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;
}
