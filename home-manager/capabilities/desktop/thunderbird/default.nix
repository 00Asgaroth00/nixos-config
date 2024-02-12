{
  lib,
  pkgs,
  ...
}: {
  accounts.email.accounts = {
    Bruce = {
      # Need to change auth type to oauth2
      primary = true;
      userName = "bruce.mcalister@gmail.com";
      realName = "Bruce McAlister";
      address = "bruce.mcalister@gmail.com";
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
      thunderbird.profiles = ["home"];
    };
    Asgaroth = {
      # Need to change auth type to oauth2
      primary = false;
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
      thunderbird.profiles = ["home"];
    };
    VoidBurn = {
      # Need app password for this one
      # see https://support.microsoft.com/en-us/account-billing/using-app-passwords-with-apps-that-don-t-support-two-step-verification-5896ed9b-4263-e681-128a-a6f2979a7944
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
      thunderbird.profiles = ["home"];
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
