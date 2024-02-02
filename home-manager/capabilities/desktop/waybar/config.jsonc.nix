# {
#   config,
#   inputs,
#   outputs,
#   user,
#   ...
{...}: {
  xdg.configFile."waybar/config.jsonc".text = ''
    {
      "layer": "top",
      // "output": [],
      "position": "top",
      "height": 36,
      // "width": 900,
      // "margin": "",
      "margin-top": 10,
      "margin-bottom": 0,
      "margin-left": 10,
      "margin-right": 10,
      "spacing": 10,
      "gtk-layer-shell": true,
      "border-radius": 10,

      "clock": {
        "format": "{:%H:%M}  ",
        "format-alt": "{:%A, %B %d, %Y (%R)}  ",
        // "tooltip-format": "<tt><small>{calendar}</small></tt>",
        "tooltip-format": "\n<span size='9pt' font='FiraCode Nerd Font'>{calendar}</span>",
        "calendar": {
                    "mode"          : "year",
                    "mode-mon-col"  : 3,
                    "weeks-pos"     : "right",
                    "on-scroll"     : 1,
                    "on-click-right": "mode",
                    "format": {
                              "months":     "<span color='#ffead3'><b>{}</b></span>",
                              "days":       "<span color='#ecc6d9'><b>{}</b></span>",
                              "weeks":      "<span color='#99ffdd'><b>W{}</b></span>",
                              "weekdays":   "<span color='#ffcc66'><b>{}</b></span>",
                              "today":      "<span color='#ff6699'><b><u>{}</u></b></span>"
                              }
                    },
        "actions":  {
                    "on-click-right": "mode",
                    "on-click-forward": "tz_up",
                    "on-click-backward": "tz_down",
                    "on-scroll-up": "shift_up",
                    "on-scroll-down": "shift_down"
                    }
      },

      //"clock": {
      //  "interval": 1,
      //  "format": "   {:%H:%M}",
      //  "format-alt": "󰃭  {:%Y-%m-%d}",
      //  // "format": " {:%I:%M} ",
      //  // "format-alt": " {:%A, %d %B} ",
      //  // "on-click": "gnome-calendar",
      //  "tooltip": true,
      //  "tooltip-format": "{calendar}",
      //  "calendar": {
      //    "mode": "year",
      //    "mode-mon-col": 3,
      //  }
      //},

      "modules-left": [
        "clock",
        "hyprland/workspaces",
        "custom/notification"
      ],
      "modules-center": [
        "hyprland/submap",
        "hyprland/window"
      ],
      "modules-right": [

        "cpu",
        "memory",
        "network",
        "bluetooth",
        "backlight",
        // "pulseaudio#microphone",
        "pulseaudio#audio",
        "battery",

        "tray"
      ],

      "hyprland/workspaces": {
        "format": " {icon} ",
        "format-icons": {
          "default": "󰄰",
          "active": ""
        },
        "on-click": "activate"
      },

      "hyprland/submap": {
        "format": "{}",
        "tooltip": false
      },

      "hyprland/window": {
        "format": " {} ",
        "separate-outputs": false
      },

      "tray": {
        "icon-size": 15,
        "spacing": 10
      },

      "cpu": {
        "format": " {usage}%",
        "on-click": "",
        "tooltip": false
      },

      "memory": {
        "format": "󰍛 {used:0.1f}GB ({percentage}%) / {total:0.1f}GB",
        "on-click": "",
        "tooltip": false
      },

      "backlight": {
        "format": " {icon} {percent} ",
        "format-icons": [
          "󰃟"
        ],
        "on-scroll-up": "brightnessctl set +1%",
        "on-scroll-down": "brightnessctl set 1%-",
        "on-click": "brightnessctl set 50%",  // set for thanos screen at the moment
        "tooltip": false
      },

      "pulseaudio#audio": {
        "format": " {icon} {volume:2} ",
        "format-bluetooth": " {icon} {volume}%  ",
        "format-muted": " {icon} Muted ",
        "format-icons": {
          "headphones": "",
          "default": [
            "",
            ""
          ]
        },
        "scroll-step": 5,
        "on-click": "pavucontrol",
        "on-click-right": "pamixer -t"
      },

      "network": {
        "interface": "wlan0",
        "format-ethernet":  "󰣶  {ifname}",
        "format-wifi":  "󰖩 {ifname}",
        "interval": 1,
        "format-icons": [
          "󰤯",
          "󰤟",
          "󰤢",
          "󰤥",
          "󰤨"
        ],

        "format-disconnected": "󰤮",
        "on-click": "iwgtk",
        "tooltip": true,
        "tooltip-format": "󰢮 {ifname}\n󰩟 {ipaddr}/{cidr}\n{icon} {essid}\n󱑽 {signalStrength}% {signaldBm} dBm {frequency} MHz\n󰞒 {bandwidthDownBytes}\n󰞕 {bandwidthUpBytes}"
      },

      "bluetooth": {
        "format-disabled": " 󰂲 ",
        "format-off": " 󰂲 ",
        "format-on": " 󰂯 ",
        "format-connected": " 󰂯 ",
        "format-connected-battery": " 󰂯 ",
        "tooltip-format-connected": " {device_alias} 󰂄{device_battery_percentage} ",
        "on-click": "blueberry",
        "tooltip": true
      },

      "battery": {
        "states": {
          "warning": 20,
          "critical": 10
        },

        "format": " {icon} {capacity} ",
        "format-charging": " 󰂄 {capacity} ",
        "format-plugged": " 󱘖 {capacity} ",
        "format-icons": [
          "󰁺",
          "󰁻",
          "󰁼",
          "󰁽",
          "󰁾",
          "󰁿",
          "󰂀",
          "󰂁",
          "󰂂",
          "󰁹"
        ],
        "on-click": "",
        "tooltip": false
      }
    }

  '';
}
