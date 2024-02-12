{
  lib,
  pkgs,
  config,
  inputs,
  home-manager,
  osConfig,
  username,
  ...
}: let
  color = config.lib.stylix.colors;
in {
  imports = [
    ../alacritty
    ../bemoji
    ../chromium
    ../copyq
    ../dunst
    ../firefox
    # ../microsoft-edge
    ../flameshot # screenshot tool (issues on hyprland)
    ../hyprpaper
    ../keepassxc
    # ../kitty
    # ../nwg-panel
    ../playerctl
    # ../satty        # screenshot tool
    ../strawberry
    ../swayidle
    ../syncthing
    ../thunderbird
    ../udiskie
    ../ulauncher
    ../vscodium
    ../waybar
    ../wlogout
    ../wofi

    (./. + "/${osConfig.networking.hostName}.nix")
  ];

  home.packages = with pkgs; [
    wev # wayland event viewer
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    sourceFirst = false;
    systemd = {
      enable = true;
    };
    xwayland = {
      enable = true;
    };
    settings = {
      workspace = lib.lists.flatten (map
        (
          m:
            map (w: "${w}, monitor:${m.name}") (m.workspaces)
        )
        (config.monitors));

      env = ["XCURSOR_SIZE,24"];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        layout = "dwindle";
        resize_on_border = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        orientation = "left";
      };

      decoration = {
        rounding = 0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = true;
        };
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
      };

      group = {
        # "col.border_active" = "rgba(63F2F1aa)";
        # "col.border_inactive" = "rgba(585272aa)";
        # "col.border_active" = "0xff${color.base0B}";
        # "col.border_inactive" = "0xff${color.base04}";

        groupbar = {
          # font_family = "Iosevka";
          font_size = 13;
          # "col.active" = "rgba(63F2F1aa)";
          # "col.inactive" = "rgba(585272aa)";
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "gb";
        # kb_variant = "";
        # kb_options = "";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      monitor =
        map
        (
          m: let
            resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
            position = "${toString m.x}x${toString m.y}";
          in "${m.name},${
            if m.enabled
            then "${resolution},${position},${toString m.scale},transform,${toString m.transform}"
            else "disable"
          }"
        )
        (config.monitors);

      animations = {
        enabled = true;
        bezier = [
          "overshot,0.05,0.9,0.1,1.1"
          "overshot,0.13,0.99,0.29,1."
        ];
        animation = [
          "windows,1,7,overshot,slide"
          "border,1,10,default"
          "fade,1,10,default"
          "workspaces,1,7,overshot,slidevert"
        ];
      };

      "$mainMod" = "SUPER";
      bind = [
        # "ALT, Return, exec, kitty"
        "$mainMod, w, killactive,"
        "$mainMod SHIFT, q, exit,"
        # "$mainMod, f, fullscreen, 0"
        # "$mainMod, m, fullscreen, 1"
        "$mainMod SHIFT, t, togglefloating,"
        # "ALT, d, exec, wofi --show drun -I"
        # "ALT, e, exec, wofi-emoji"
        "$mainMod, e, exec, thunar"
        "$mainMod, P, pseudo, # dwindle"
        # "$mainMod, s, togglespecialworkspace, notes"
        # "$mainMod SHIFT, S, movetoworkspace, special:notes"
        # "$mainMod CTRL, t, togglespecialworkspace, term"
        "$mainMod, g, togglegroup"
        "$mainMod, TAB, changegroupactive, f"
        "$mainMod SHIFT, TAB, changegroupactive, b"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod CTRL, h, swapwindow, l"
        "$mainMod CTRL, l, swapwindow, r"
        "$mainMod CTRL, k, swapwindow, u"
        "$mainMod CTRL, j, swapwindow, d"
        "$mainMod ALT, h, moveintogroup, l"
        "$mainMod ALT, l, moveintogroup, r"
        "$mainMod ALT, k, moveintogroup, u"
        "$mainMod ALT, j, moveintogroup, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod ALT, 1, movetoworkspace, 1"
        "$mainMod ALT, 2, movetoworkspace, 2"
        "$mainMod ALT, 3, movetoworkspace, 3"
        "$mainMod ALT, 4, movetoworkspace, 4"
        "$mainMod ALT, 5, movetoworkspace, 5"
        "$mainMod ALT, 6, movetoworkspace, 6"
        "$mainMod ALT, 7, movetoworkspace, 7"
        "$mainMod ALT, 8, movetoworkspace, 8"
        "$mainMod ALT, 9, movetoworkspace, 9"
        "$mainMod ALT, 0, movetoworkspace, 10"
        # ", XF86AudioPrev, exec, playerctl previous"
        # ", XF86AudioNext, exec, playerctl next"
        # ", XF86AudioPlay, exec, playerctl play-pause"

        # "$mainMod ALT CTRL, equal, exec, dunstctl set-paused toggle"
        # "$mainMod ALT CTRL, bracketright, exec, systemctl reboot"

        # "$mainMod ALT CTRL SHIFT, 1, exec, grimblast copy area"
        # "$mainMod ALT CTRL SHIFT, 2, exec, grimblast save area"
        # "$mainMod ALT CTRL SHIFT, 3, exec, grimblast copy active"
        # "$mainMod ALT CTRL SHIFT, 4, exec, grimblast copy output"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      source = [
        "~/.config/hypr/per-app/*.conf"
      ];
    };
  };
}
