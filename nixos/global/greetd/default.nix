{ lib, pkgs, ... }: {

  # See https://www.reddit.com/r/NixOS/comments/14rhsnu/regreet_greeter_for_greetd_doesnt_show_a_session/

  # services.xserver.displayManager.session = [
  #   {
  #     manage = "desktop";
  #     name = "hyprland";
  #     start = ''
  #       ${lib.getExe pkgs.hyprland} &
  #       waitPID=$!
  #     '';
  #   }
  # ];

  environment.systemPackages = with pkgs; [
    cage
  ];

  services.greetd.enable = true;

  programs.regreet = {
    enable = true;
    package = pkgs.greetd.regreet;
    cageArgs = [
      "-s"
    ];
    settings = {
      background = {
        path = "/home/vzhsxn/Git/nixos-config/home-manager/capabilities/desktop/wallpapers/zi2Bbda-anime-dragon-wallpaper.jpg";
      };
      commands = {
        reboot = [ "systemctl" "reboot" ];
        poweroff = [ "systemctl" "poweroff" ];
      };
    };
  };

}