{ pkgs
, inputs
, system
, lib
, homeManager
, ...
}:
{

  #import hsit idfk mane
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nixcord.homeManagerModules.nixcord
	inputs.nur.overlays.default
    #inputs.fjordlauncher.overlays.default
    ./hyprland/hyprland.nix
    ./i3/i3.nix
    ./helix/helix.nix
    ./kitty/kitty.nix
    ./floorp/floorp.nix
    ./nixcord/nixcord.nix
  ];

  # install user-specific packages here
  nixpkgs = {
    config = {
      allowUnfree = true; #enables unfree packages
    };

    /*overlays = [
      inputs.fjordlauncher.overlays.default
    ];*/
  };

  #services.flatpak.enable = true;
  xdg.enable = true;
  programs.bash.enable = true;
  catppuccin.enable = true;

  # install home manager
  programs.home-manager.enable = true;

  gtk.enable = true;
  gtk.cursorTheme = {
    name = "catppuccin-mocha-pink-cursors";
    package = pkgs.catppuccin-cursors.mochaPink;
    size = 24;
  };

    # enable nh
  programs.nh = {
    enable = true;
    flake = "/home/kat/NixOS/";
  };

  # sets up the user(s) for home manager to manage
  home = {
    username = "kat";
    homeDirectory = "/home/kat";
    stateVersion = "24.11";

    sessionPath = [
      "/var/lib/flatpak/exports/share"
      "/home/kat/.local/share/flatpak/exports/share"
    ];

    pointerCursor = {
      name = "catppuccin-mocha-pink-cursors";
      package = pkgs.catppuccin-cursors.mochaPink;
      size = 24;
      gtk.enable = true;
    };

    packages = with pkgs; [
      ranger
      vesktop
      btop
      pavucontrol
      pipewire
      lm_sensors
      catppuccin-cursors.mochaPink
      flatpak
      unzip
      p7zip
      tor-browser-bundle-bin
      floorp
    ];
  };
}
