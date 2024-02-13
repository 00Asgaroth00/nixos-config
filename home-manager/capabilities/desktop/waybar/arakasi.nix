{...}: {
  programs.waybar = {
    settings = [
      {
        mainBar = {
          layer = "top";
          position = "top";
          height = 36;
          # output = ["eDP-1" "HDMI-A-1"];
	  output = [ "DP-1" ];
          margin-top = 10;
          margin-bottom = 0;
          margin-left = 10;
          margin-right = 10;
          spacing = 10;
          gtk-layer-shell = true;
          border-radius = 10;

          #   modules-left = ["sway/workspaces" "sway/mode" "wlr/taskbar"];
          #   modules-center = ["sway/window" "custom/hello-from-waybar"];
          #   modules-right = ["mpd" "custom/mymodule#with-css-id" "temperature"];

          modules-left = [
            "clock"
            "hyprland/workspaces"
            "custom/notification"
          ];
          modules-center = [
            "hyprland/submap"
            "hyprland/window"
          ];
          modules-right = [
            "cpu"
            "memory"
            "network#if1"
            "network#if2"
            # "network#wlan"
            # "bluetooth"
            # "backlight"
            # "pulseaudio#microphone"
            "pulseaudio#audio"
            # "battery"
            "tray"
          ];

          #   "sway/workspaces" = {
          #     disable-scroll = true;
          #     all-outputs = true;
          #   };

          #   "custom/hello-from-waybar" = {
          #     format = "hello {}";
          #     max-length = 40;
          #     interval = "once";
          #     exec = pkgs.writeShellScript "hello-from-waybar" ''echo "from within waybar"      '';
          #   };

          clock = {
            format = "{:%H:%M}  ";
            format-alt = "{:%A, %B %d, %Y (%R)}  ";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode = "year";
              mode-mon-col = 3;
              weeks-pos = "right";
              on-scroll = 1;
              on-click-right = "mode";
              format = {
                months = "<span color='#ffead3'><b>{}</b></span>";
                days = "<span color='#ecc6d9'><b>{}</b></span>";
                weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
            actions = {
              on-click-right = "mode";
              on-click-forward = "tz_up";
              on-click-backward = "tz_down";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };

          "hyprland/workspaces" = {
            format = " {icon} ";
            format-icons = {
              default = "󰄰";
              active = "";
            };
            on-click = "activate";
          };

          "hyprland/submap" = {
            format = "{}";
            tooltip = false;
          };

          "hyprland/window" = {
            format = " {} ";
            separate-outputs = false;
          };

          tray = {
            icon-size = 15;
            spacing = 10;
          };

          cpu = {
            interval = 1;
            format = "  {usage:3d}%";
            on-click = "";
            tooltip = false;
          };

          memory = {
            format = "󰍛 {used:0.1f}GB ({percentage}%) / {total:0.1f}GB";
            on-click = "";
            tooltip = false;
          };

          "pulseaudio#audio" = {
            format = " {icon} {volume:2} ";
            format-bluetooth = " {icon} {volume}%  ";
            format-muted = " {icon} Muted ";
            format-icons = {
              headphones = "";
              default = [
                ""
                ""
              ];
            };
            scroll-step = 5;
            on-click = "pavucontrol";
            on-click-right = "pamixer -t";
          };

          "network#if1" = {
            interval = 2;
            interface = "eno1";
            max-length = 50;
            format = "";
            format-ethernet = "<span foreground='#829181'>󰱔 </span>{ipaddr}/{cidr}";
            format-disconnected = "";
            tooltip-format = "";
            tooltip-format-ethernet = "Ifname:\t{ifname}\nNMask:\t{netmask}\nDown:\t{bandwidthDownBits}\nUp:\t{bandwidthUpBits}";
            tooltip-format-disconnected = "";
          };
          "network#if2" = {
            interval = 2;
            interface = "enp15s0u5u3u1";
            max-length = 50;
            format = "";
            format-ethernet = "<span foreground='#829181'>󰱔 </span>{ipaddr}/{cidr}";
            format-disconnected = "";
            tooltip-format = "";
            tooltip-format-ethernet = "Ifname:\t{ifname}\nNMask:\t{netmask}\nDown:\t{bandwidthDownBits}\nUp:\t{bandwidthUpBits}";
            tooltip-format-disconnected = "";
          };
        };
      }
    ];
  };
}
