{
  inputs = {
	
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # set nixpkgs version

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11"; #set home manager version
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix"; #set catppuccin url

    hyprland.url = "github:hyprwm/Hyprland";

    fjordlauncher.url = "github:unmojang/FjordLauncher";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs = { self
    , nixpkgs
    , home-manager
    , hyprland
    , fjordlauncher
    , ...
    } @ inputs: let inherit (self) outputs;
	in {
    
    nixosConfigurations = {
	nixos = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs outputs; };
        	modules = [
          		./nixos/configuration.nix
        	];
      	};
    };

      homeConfigurations = {
        "kat@nixos" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = { inherit inputs outputs; };
            modules = [
              ./home-manager/home.nix
            ];
            
          };
          };
      };
}
