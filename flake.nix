{
    description = "NixOS configuration";

    inputs = {
        system = "x86_64-linux";

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

    outputs = { self, system, nixpkgs, home-manager, ... }@inputs:
        let
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            nixosConfigurations = {
                luca-iso = nixpkgs.lib.nixosSystem {
                    extraSpecialArgs = { inherit inputs; };
                    modules = [
                        ./hosts/iso/configuration.nix
                        home-manager.nixosModules.default
                    ];
                    configuration = {
                        networking.hostName = "luca-iso";
                    };
                };
                luca-notebook = nixpkgs.lib.nixosSystem {
                    extraSpecialArgs = { inherit inputs; };
                    modules = [
                        ./hosts/notebook/configuration.nix
                        home-manager.nixosModules.default
                    ];
                    configuration = {
                        networking.hostName = "luca-notebook";
                    };
                };
                luca-pc = nixpkgs.lib.nixosSystem {
                    extraSpecialArgs = { inherit inputs; };
                    modules = [
                        ./hosts/pc/configuration.nix
                        home-manager.nixosModules.default
                    ];
                    configuration = {
                        networking.hostName = "luca-pc";
                    };
                };
                luca-wsl = nixpkgs.lib.nixosSystem {
                    extraSpecialArgs = { inherit inputs; };
                    modules = [
                        ./hosts/wsl/configuration.nix
                        home-manager.nixosModules.default
                    ];
                    configuration = {
                        networking.hostName = "luca-wsl";
                    };
                };
            };
        };
}
