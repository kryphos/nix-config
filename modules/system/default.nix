{ ... }: {
    imports = [
        ./bootloader.nix
        ./linker.nix
        ./locale.nix
        ./networking.nix
        ./nix.nix
        ./sound.nix
        ./users.nix
    ];
}
