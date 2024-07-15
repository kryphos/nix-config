{ ... }: {
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./software.nix
    ./sound.nix
    ./users.nix
  ];
}
