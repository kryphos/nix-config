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

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      hosts = [ "luca-iso" "luca-notebook" "luca-pc" "luca-wsl" ];

      pkgs = nixpkgs.legacyPackages.${system};

      mkConfig = name:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit system;
            inherit inputs;
            isWSL = name == "luca-wsl";
          };
          modules = [
            ./hosts/${name}/configuration.nix
            home-manager.nixosModules.default
            { networking.hostName = name; }
          ];
        };

      configs = builtins.listToAttrs (map (name: {
        name = name;
        value = mkConfig name;
      }) hosts);
    in {
      formatter.${system} = pkgs.nixfmt-classic;
      nixosConfigurations = configs;
    };
}
