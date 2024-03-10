{...}: {
  # Autodiscovery of printers supporting IPP Everywhere protocol
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing.enable = true;
}
