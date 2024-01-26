{ pkgs, ... }: {

  home.packages = with pkgs; [
    upower
    poweralertd
  ];

  services.poweralertd = {
    enable = true;
  };

}