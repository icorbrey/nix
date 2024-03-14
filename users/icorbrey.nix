{
  config,
  pkgs,
  ...
}: {
  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.sessionVariables = {
    EDITOR = "hx";
  };

  home.packages = with pkgs; [
    alejandra
    gcc
    helix
    neofetch
    rustup
  ];

  programs.git = {
    enable = true;
    userName = "Isaac Corbrey";
    userEmail = "icorbrey@gmail.com";
    extraConfig = {
      diff.algorithm = "histogram";
    };
    diff-so-fancy = {
      enable = true;
    };
  };

  programs.vim = {
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
