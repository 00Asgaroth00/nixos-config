{pkgs, ...}: {
  services.dbus = {
    implementation = "broker"; #one of dbus (default) or broker
    packages = [pkgs.gcr];
  };
}
