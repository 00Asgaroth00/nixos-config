{ lib, pkgs, ... }: {

  # See https://www.reddit.com/r/NixOS/comments/14rhsnu/regreet_greeter_for_greetd_doesnt_show_a_session/

  services.xserver.displayManager.session = [
    {
      manage = "desktop";
      name = "hyprland";
      start = ''
        ${lib.getExe pkgs.hyprland} &
        waitPID=$!
      '';
    }
  ];

  services.greetd.enable = true;

  programs.regreet.enable = true;

}