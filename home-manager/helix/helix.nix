{ pkgs
, inputs
, lib
, ...  
}: {

  programs.helix = {

    enable = true;
    defaultEditor = true;

    #settings.theme = "catppuccin_mocha";

    languages = {
      language = [{
        name = "nix";
        formatter.command = lib.getExe pkgs.nixpkgs-fmt;
      }];

      language-server = {
        nixd.config = {
          options = {
            nixos.expr = "(builtins.getFlake\"$HOME/NixOS/flake.nix\").nixosConfigurations.nixos.options";
            home-manager.expr = "(builtins.getFlake\"$HOME/NixOS/flake.nix\").homeConfigurations.kat.options";
          };
        };
      };
    };
    extraPackages = with pkgs; [
      nil
      nixd
    ];   
  };
}
