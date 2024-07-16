{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    greetd.greetd
    greetd.tuigreet
    hyprland
    git
    neovim
    zsh
    kitty
  ];
}
