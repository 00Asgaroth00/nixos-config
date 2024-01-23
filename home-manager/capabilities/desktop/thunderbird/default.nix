{ pkgs, ... }: {

  accounts.email.accounts = {
    Asgaroth = {
      primary = false;
      username = "00asgaroth00@gmail.com";
      realName = "Asgaroth";
      address = "00asgaroth00@gmail.com";
      flavor = "gmail.com";
      thunderbird.enable = true;
      thunderbird.profiles = [ "home" ];
    };
    VoidBurn = {
      primary = false;
      username = "voidburn@hotmail.com";
      realName = "VoidBurn";
      address = "voidburn@hotmail.com";
      flavor = "outlook.office365.com";
      thunderbird.enable = true;
      thunderbird.profiles = [ "home" ];
    };
  };

  programs.thunderbird = {
    enable = true;
    profiles = {
      home.isDefault = true;
    };
  };

  xdg.configFile."hypr/per-app/thunderbird.conf".text = ''
    bind = $mainMod, T, exec, thunderbird
    # bind = $mainMod, W, exec, firefox -p work
    exec-once = [workspace 3 silent] thunderbird
  '';

}