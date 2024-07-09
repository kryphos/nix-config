{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixos-wsl = {
            url = "github:nix-community/NixOS-WSL";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            nixosConfigurations = {
                iso = nixpkgs.lib.nixosSystem {
                    extraSpecialArgs = { inherit inputs; inherit pkgs; };
                    modules = [
                        ./hosts/iso/configuration.nix
                        home-manager.nixosModules.default
                    ];
                    configuration = {
                        networking.hostName = "luca-iso";
                    };
                };
                notebook = nixpkgs.lib.nixosSystem {
                    extraSpecialArgs = { inherit inputs; inherit pkgs; };
                    modules = [
                        ./hosts/notebook/configuration.nix
                        home-manager.nixosModules.default
                    ];
                    configuration = {
                        networking.hostName = "luca-notebook";
                    };
                };
                pc = nixpkgs.lib.nixosSystem {
                    extraSpecialArgs = { inherit inputs; inherit pkgs; };
                    modules = [
                        ./hosts/pc/configuration.nix
                        home-manager.nixosModules.default
                    ];
                    configuration = {
                        networking.hostName = "luca-pc";
                    };
                };
                wsl = nixpkgs.lib.nixosSystem {
                    extraSpecialArgs = { inherit inputs; inherit pkgs; };
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
