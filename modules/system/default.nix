{ ... }: {
    imports = [
        ./bootloader.nix
        ./locale.nix
        ./networking.nix
        ./nix.nix
        ./sound.nix
        ./users.nix
    ];
}
