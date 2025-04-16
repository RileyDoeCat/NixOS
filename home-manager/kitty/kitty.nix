{ pkgs
, config
, lib
, ...  
}: {

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";

    #font.name = "JetBrainsMono";
  };  
}
