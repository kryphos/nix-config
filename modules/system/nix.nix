{ ... }: {
    nix.settings.experimental-features = [ "nix-command flakes" ];
    pkgs.config.allowUnfree = true;

    system.stateVersion = "24.11";
}
