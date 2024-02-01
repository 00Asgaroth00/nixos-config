{pkgs, ...}: {
  environment.systemPackages = with pkgs; [dbus wmctrl];
  services.dbus = {
    implementation = "broker"; #one of dbus (default) or broker
    packages = [pkgs.gcr];
  };
}
