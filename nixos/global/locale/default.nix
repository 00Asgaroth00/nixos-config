{ lib, ... }: {
  
  time.timeZone = lib.mkDefault "Europe/Dublin";

  i18n = {
    defaultLocale = lib.mkDefault "en_IE.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = lib.mkDefault "en_IE.UTF-8";
      LC_IDENTIFICATION = lib.mkDefault "en_IE.UTF-8";
      LC_MEASUREMENT = lib.mkDefault "en_IE.UTF-8";
      LC_MONETARY = lib.mkDefault "en_IE.UTF-8";
      LC_NAME = lib.mkDefault "en_IE.UTF-8";
      LC_NUMERIC = lib.mkDefault "en_IE.UTF-8";
      LC_PAPER = lib.mkDefault "en_IE.UTF-8";
      LC_TELEPHONE = lib.mkDefault "en_IE.UTF-8";
      LC_TIME = lib.mkDefault "en_IE.UTF-8";
    };  
  };
  
}
