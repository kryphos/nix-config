{ pkgs, ... }: {
  nixpkgs.config = {
    allowBroken = true;
    permittedInsecurePackages = [ "electron-27.3.11" ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    act
    aircrack-ng
    ani-cli
    armitage
    audacity
    awscli
    bacon
    bat
    bemenu
    betterdiscord-installer
    betterdiscordctl
    blender
    blockbench
    btop
    cargo-cross
    cargo-expand
    cargo-info
    cargo-make
    cargo-watch
    cargo-wizard
    cinnamon.nemo
    clang
    cloc
    cmake
    copyq
    coreutils
    cups
    discord
    docker
    docker-compose
    dust
    eza
    fastfetch
    fd
    feh
    firefox
    fzf
    gamescope
    gdb
    git
    gnumake
    gparted
    grim
    hashcat
    headsetcontrol
    hyprland
    hyprlock
    hyprpaper
    hyprpicker
    inkscape
    irust
    john
    jq
    jupyter-all
    kdePackages.okular
    kitty
    krita
    krusader
    lazydocker
    lazygit
    lemurs
    libclang
    libpqxx
    logseq
    lutris
    man
    man-pages
    man-pages-posix
    mangohud
    metasploit
    minecraft
    mold
    mpv
    neovide
    neovim
    ninja
    nmap
    nodejs_22
    ntfs3g
    nwg-look
    obs-studio
    onlyoffice-bin_latest
    openssl
    opentabletdriver
    path-of-building
    pavucontrol
    pitivi
    polkit-kde-agent
    python312
    python312Packages.nbclassic
    python312Packages.notebook
    python312Packages.pip
    qutebrowser
    ranger
    ripgrep
    rustup
    sane-airscan
    satty
    sddm
    sfxr-qt
    slurp
    spicetify-cli
    spotify
    starship
    steam
    system-config-printer
    gnutar
    terraform
    texliveFull
    thc-hydra
    thunderbird
    tk
    tldr
    tmux
    tmux-sessionizer
    unzip
    waybar
    wine
    wineWowPackages.waylandFull
    wireshark
    wl-clipboard
    wlogout
    xournalpp
    xsane
    zip
    zoxide
    zsh
  ];

  fonts.packages = with pkgs; [
    caladea
    fira-code
    hanazono
    nerdfonts
    noto-fonts
    powerline-fonts
    terminus-nerdfont
    terminus_font
    terminus_font_ttf
    texlivePackages.amsfonts
    texlivePackages.opensans
  ];
}
