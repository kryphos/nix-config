{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [ greetd hyprland git neovim zsh kitty ];
}
