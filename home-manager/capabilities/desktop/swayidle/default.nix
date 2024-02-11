{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;
    events = [
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --effect-blur 3x5 --fade-in 1 --effect-vignette 0.1:0.8";
      }
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --effect-blur 3x5 --fade-in 1 --effect-vignette 0.1:0.8";
      }
    ];
    timeouts = [
      {
        timeout = 180; # Lock screens after 3 minutes
        command = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --effect-blur 3x5 --fade-in 1 --effect-vignette 0.1:0.8";
      }
      {
        timeout = 300; # Turn off screens after 5 minutes
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
        resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      }
    ];
  };
}
