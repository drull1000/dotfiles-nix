{ lib, pkgs, config, ... }:

let
  mod = "Mod4";
  colors = config.colorscheme.colors;
in
{

  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark";

  };

  programs.i3status-rust = {
    enable = true;
    bars.top = {
      settings.theme = "gruvbox-dark";

      icons = "awesome";
      blocks = [
        {
          block = "memory";
          display_type = "memory";
          format_mem = "{mem_used_percents}";
          format_swap = "{swap_used_percents}";
        }
        {
          block = "cpu";
          format = "{utilization}";
        }
        {
          block = "sound";
          on_click = "pavucontrol";
        }
        {
          block = "time";
          interval = 60;
          format = "%a %d/%m %R";
        }
      ];
    };
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = {
      modifier = mod;
      fonts = {
        names = [ "Hasklig" ];
        size = 11.0;
      };

      defaultWorkspace = "1";

      window.border = 4;

      gaps = {
        inner = 5;
        outer = 5;

        smartBorders = "on";
        smartGaps = true;
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec rofi -modi drun -show drun";
        "${mod}+Return" = "exec kitty";
        "${mod}+Shift+s" = "exec sh -c 'maim -s | xclip -selection clipboard -t image/png'";
        "${mod}+Shift+l" = "exec sh -c '${pkgs.i3lock}/bin/i3lock -c 00390039 & sleep 5 && xset dpms force of'";
        "${mod}+k" = "focus up";
        "${mod}+j" = "focus down";
        "${mod}+h" = "focus left";
        "${mod}+l" = "focus right";
      };

      bars = [
        {
          position = "top";
          statusCommand = "i3status-rs ~/.config/i3status-rust/config-top.toml";

          colors = {
            background = "#${colors.base01}";

            focusedWorkspace = {
              background = "#${colors.base02}";
              border = "${colors.base02}";
              text = "${colors.base05}";
            };

            activeWorkspace = {
              background = "#${colors.base0D}";
              border = "${colors.base02}";
              text = "${colors.base06}";
            };

            inactiveWorkspace = {
              background = "#${colors.base02}";
              border = "${colors.base0D}";
              text = "${colors.base06}";
            };

            urgentWorkspace = {
              background = "#${colors.base02}";
              border = "${colors.base02}";
              text = "${colors.base05}";
            };
          };

          fonts = {
            names = [ "Hasklig" ];
            size = 10.0;
          };
        }
      ];
    };
  };

  # wallpaper
  home.file."./.background-image".source = ../wallpapers/mrRobot.jpg;
}
