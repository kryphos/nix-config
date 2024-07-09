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

    outputs = { self, nixpkgs, home-manager, ... }:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            nixosConfigurations = {
                luca-iso = nixpkgs.lib.nixosSystem {
                    modules = [
                        ./hosts/luca-iso/configuration.nix
                        home-manager.nixosModules.default
                    ];
                };
                luca-notebook = nixpkgs.lib.nixosSystem {
                    modules = [
                        ./hosts/luca-notebook/configuration.nix
                        home-manager.nixosModules.default
                    ];
                };
                luca-pc = nixpkgs.lib.nixosSystem {
                    modules = [
                        ./hosts/luca-pc/configuration.nix
                        home-manager.nixosModules.default
                    ];
                };
                luca-wsl = nixpkgs.lib.nixosSystem {
                    modules = [
                        ./hosts/luca-wsl/configuration.nix
                        home-manager.nixosModules.default
                    ];
                };
            };
        };
}
