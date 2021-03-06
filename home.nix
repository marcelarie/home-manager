{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs/kitty.nix
    ./programs/fish
    ./programs/bash
    ./programs/vim
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # services.picom.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marcel";
  home.homeDirectory = "/home/marcel";

  nixpkgs.config.allowUnfree = true;

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    withPython3 = true;
    extraConfig = ''luafile /home/marcel/.config/nvim/nix.init.lua'';

    extraPackages = with pkgs; [
      tree-sitter
      rnix-lsp
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.bash-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.vim-language-server
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.intelephense
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.yaml-language-server
      sumneko-lua-language-server
      texlab
      rust-analyzer
      deno
      stylua
      nodePackages.prettier
      nodePackages.prettier_d_slim
      perl534Packages.PerlTidy
      perl534Packages.PerlCritic
      perlPackages.PLS
      sqlite
      fzf

      # nur.repos.crazazy.efm-langserver
    ];
  };

  programs.git = {
    enable = true;
    userName = "Marcel Arie";
    userEmail = "googlillo@gmail.com";
    # aliases = { prettylog = "..."; };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      color = {
        ui = true;
      };
      init = {
        defaultBranch = "main";
      };
      # push = { default = "simple"; };
      # pull = { ff = "only"; };
    };
    # ignores = [ ".DS_Store" "*.pyc" ];
    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        # syntax-theme = "calochortus-lyallii";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    iconTheme = {
      name = "Paper";
      package = pkgs.paper-icon-theme;
    };
    cursorTheme = {
      package = pkgs.paper-icon-theme;
      name = "Paper";
      size = 48;
    };
    font = {
      name = "Noto Sans 9.5";
      package = pkgs.noto-fonts;
    };
  };

  xdg.mimeApps = {
    enable = true;
    # associations.added = {
    #   "application/pdf" = [ "org.gnome.Evince.desktop" ];
    # };
    defaultApplications = {
      # "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
    };
  };

  programs.rofi = {
    enable = true;
    font = "FiraCode 25";
    theme = ./programs/rofi/themes/slate.rasi;
  };

  home.packages = with pkgs; [
    tcpdump
    firefox
    termite
    # alacritty
    rustup
    polybar
    pkg-config
    zoxide
    starship
    exa
    neofetch
    volumeicon
    sxhkd
    haskellPackages.greenclip
    feh
    rofi
    skim
    pavucontrol
    ponymix
    unzip
    arandr
    autorandr
    bat
    ripgrep
    lua
    lua53Packages.luarocks
    python3
    fd
    sad
    gh
    python3
    nodejs-12_x
    flameshot
    rofi-power-menu
    webcamoid
    nixpkgs-fmt
    slack
    docker-compose
    libnotify
    rofimoji
    sysz
    tldr
    nix-prefetch-github
    glow
    element-desktop
    mitmproxy
    xfce.xfce4-notifyd
    sumneko-lua-language-server
    kazam
    mpv
    yt-dlp
    pfetch
    discord
    python39Packages.pynvim
    tridactyl-native
    jq
    mesa.drivers
    signal-desktop
    (yarn.override {nodejs = null;})
    update-systemd-resolved
    htop
    mongodb
    mongodb-tools
    nodePackages.speed-test
    nodePackages.pnpm
    fzf
    fzy
    chromium
    brave
    hugo
    cht-sh
    keepass
    dmenu
    swaylock
    swayidle
    wl-clipboard
    mako
    dmenu
    gimp
    das_watchdog
    acpi
    lf
    xorg.xev
    qbittorrent
    auto-cpufreq
    cbatticon
    powertop
    xfce.thunar
    manix
    cowsay
    autoconf
    libtool
    automake
    node2nix
    moreutils
    entr
    zk
    alejandra

    # NUR
    nur.repos.afreakk.mongosh

    # chromium
    # leftwm
    # chromium
    # dunst
    # update-systemd-resolved
    # openvpn
    # home-manager
    # fish
    # vim
    # cargo
    # sumneko-lua-language-server
  ];

  programs.java.enable = true;

  # home.stateVersion = "21.05";
  # home.stateVersion = "20.09";
}
