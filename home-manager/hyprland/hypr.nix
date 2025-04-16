{ pkgs
, lib
, config
, inputs
, modulesPath
, homeManager
, ...
}: {

  imports = [
    ./waybar.nix
  ] ;

  home.packages = with pkgs; [
    fuzzel
    hyprshot
    waybar
    hyprcursor
    wl-clipboard
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
     
    settings = {

      
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "float, class:xdg-desktop-portal-gtk, title:(Open Files)"
      ];

      # monitors config
      monitor = [
        ",preferred,auto,auto"
      ];

      # environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "HYPRSHOT_DIR,/home/kat/Pictures/Screenshots"
        "XDG_SCREENSHOTS_DIR,/home/kat/Pictures/Screenshots"
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "QT_QPA_PLATFORM,wayland"
      ];

      # mouse and keyboard settings

      input = {
        kb_layout = "us";

        follow_mouse = 1;
        accel_profile = "flat";
        sensitivity = 0;
        mouse_refocus = false;
      };

      # appearance and animations config stuff

      general = {
        gaps_in = 2;
        gaps_out = 7;

        border_size = 2;

        resize_on_border = true;
        allow_tearing = true;
        layout = "dwindle";

        "col.active_border" = "rgb(F2CDCD) rgb(CBA6F7) 45deg";
        "col.inactive_border" = "rgb(313244)";
      };

      decoration = {
        rounding = 4;
        #"rounding_power" = 2;

        shadow = {
          enabled = true;
          range = 30;
          render_power = 3;
        };

        blur = {
          enabled = true;
          size = 5;
          passes = 2;
        };

      };

      animations = {
        enabled = false;
      };

      # keybinds and controls and shit

      "$mainMod" = "SUPER"; # sets super (windows) key as main modifier
      "$menu" = "fuzzel";
      "$terminal" = "kitty";

      bind = [
        # basic bitch binds to use hyprland at all
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, R, exec, $menu"
        "$mainMod SHIFT, Q, killactive, "
        "$mainMod, M, exit, "
        "$mainMod, N, exec, systemctl suspend"

        # hyprshot screenshot binds
        ", PRINT, exec, hyprshot -m output -m active "/*"-o /home/kat/Pictures/Screenshots"*/
        "$mainMod, PRINT, exec, hyprshot -m region "/*"-o /home/kat/Pictures/Screenshots"*/

        # move focus with mainMod + arrow keys or mainMod + vim navigation keys
        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # move windows with mainMod + shift + arrow keys or mainMod + shift + vim navigation keys
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        
      ]
      ++ (
        # workspaces config
        # binds $mainMod + [shift +] {1, 9} to [move to] workspace {1, 9}
        builtins.concatLists (builtins.genList
          (i:
            let ws = i + 1;
            in [
              "$mainMod, code:1${toString i}, workspace, ${toString ws}"
              "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
    };
  };
}
