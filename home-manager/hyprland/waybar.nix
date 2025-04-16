{ config
, lib
, pkgs
, ...
}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    settings = {
      mainBar = {

        layer = "top";
        position = "top";

        height = 30;
      
        modules-left = [ "cpu" "memory" "temperature" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "wireplumber" "clock" ];

        "hyprland/workspaces" = {
          "disable-scroll" = "true";
          format = "{name} {icon}";
          format-icons = {
            "active" =  "";
            "default" = "";
            "empty" = "";
          };
        };

        cpu = {
          format = "{icon}{usage}%";
          format-icons = " "; 
        };

        memory = {
          format = "{icon}{percentage}%";
          format-icons = " ";
        };

        temperature = {
          format = "{icon}{temperatureC}C";
          format-icons = "󰔏";
          hwmon-path  = "/sys/class/hwmon/hwmon1/temp1_input";
          interval = 1;
        };
        
        clock = {
          interval = 1;
          format = "󰃭{:%F 󰥔%H:%M:%S}";
         };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = [ "" "" "" ];
          on-click = lib.getExe pkgs.pavucontrol;
        };

      };
      };
      style = ''
        * {
          font-family: Ubuntu Nerd Font Med;
          font-size: 16px;
        }

        #waybar {
          background: transparent;
        }

        #cpu,
        #memory,
        #temperature,
        #clock,
        #wireplumber {
          background-color: #313244;
          padding: 0rem 1rem;
        }

        #workspaces {
          border-radius: 0px 0px 1rem 1rem;
          margin: 0px;
          background-color: #313244;
          padding: 0rem 0rem;
        }

        #workspaces button {
          color: #cba6f7;
          border-radius: 1rem;
        }

        #workspaces button.active {
          color: #f2cdcd;
        }

        #workspaces button.hover {
          border-radius: 1rem;
        }

        #cpu {
          color: #fab387;
          border-radius: 0px 0px 0px 1rem;
          margin-left: 7px;
        }

        #memory {
          color: #ff9e2a;
          border-radius: 0px 0px 0px 0px;
          margin-left: 3px;
        }

        #temperature {
          color: #a6e3a1;
          border-radius: 0px 0px 1rem 0px;
          margin-left: 3px;
        }

        #clock {
          color: #89b4fa;
          border-radius: 0px 0px 1rem 0px;
          margin-right: 7px; 
        }

        #wireplumber {
          color: #eba0ac;
          border-radius: 0px 0px 0px 1rem;
          margin-right: 3px;
        }
        
     '';
    };
}
