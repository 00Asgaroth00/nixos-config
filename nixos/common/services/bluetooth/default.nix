{
  config,
  lib,
  ...
}:
lib.mkIf (config.hardware.bluetooth.enable) {
  services = {
    blueman.enable = true;
  };
}
