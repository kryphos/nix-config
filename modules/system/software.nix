{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    git
    hyprland
    lemurs
    kitty
    neovim
    zsh
  ];
}
