{ lib, pkgs, ... }: {

  accounts.email.accounts = {
    Asgaroth = {
      # Need to change auth type to oath2
      primary = true;
      userName = "00asgaroth00@gmail.com";
      realName = "Asgaroth";
      address = "00asgaroth00@gmail.com";
      flavor = "gmail.com";
      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = lib.mkForce 465;
        tls.useStartTls = true;
      };
      thunderbird.enable = true;
      thunderbird.profiles = [ "home" ];
    };
    VoidBurn = {
      # Need app password for this one
      primary = false;
      userName = "voidburn@hotmail.com";
      realName = "VoidBurn";
      address = "voidburn@hotmail.com";
      flavor = "outlook.office365.com";
      imap = {
        host = "outlook.office365.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.office365.com";
        port = lib.mkForce 587;
        tls.useStartTls = true;
      };
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