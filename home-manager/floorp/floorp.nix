{ pkgs
, inputs
, system
, lib
, homeManager
, ...
}: {
  programs.floorp = {
    enable = true;
    #package = pkgs.florp;
    #configPath = ".floorp";

    profiles = {
      "Kat." = {
        id = 0;
        name = "Kat.";
        isDefault = true;

        settings = {
          "browser.startup.homepage" = "https://online.bonjourr.fr/";
          "browser.search.defaultenginename" = "Yandex";
          "browser.search.order.1" = "Yandex";
          "extensions.autoDisableScopes" = 0;
        };

        search = {
          force = true;
          default = "Yandex";
          order = [ "Yandex" ];

          engines = {

            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };

            "Yandex" = {
              urls = [{ template = "https://yandex.com/?text={searchTerms}&lang=en"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@Yandex" ];
            };
          };
        };

        extensions = {
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            bitwarden
            firefox-color
            stylus
            tampermonkey
            catppuccin-web-file-icons
          ];

          /*settings = {
            
          };*/
        };
      };
    };
  };
}
