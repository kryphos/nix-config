{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixos-wsl = {
            url = "github:nix-community/NixOS-WSL";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = input@{ self, nixpkgs, home-manager, ... }:
        let
            systems = [ "luca-iso" "luca-notebook" "luca-pc" "luca-wsl" ];

            mkConfig = name: nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
                modules = [
                    (./. + "/hosts/${name}/configuration.nix")
                    home-manager.nixosModules.default
                ];
            };

            configs = builtins.listToAttrs (map (
                name: { name = name; value = mkConfig name; })
            systems);
        in {
            nixosConfigurations = configs;
        };
}
