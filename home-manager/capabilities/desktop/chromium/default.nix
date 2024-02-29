{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    extensions = [
      {
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; # ublock origin
      }
      {
        id = "fnaicdffflnofjppbagibeoednhnbjhg"; # floccus
      }
      {
        id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; # privacy badger
      }
      {
        id = "mlomiejdfkolichcflejclcbmpeaniij"; # ghostery
      }
      {
        id = "bkdgflcldnnnapblkhphbgpggdiikppg"; # duckduckgo privacy essentials
      }
      {
        id = "edibdbjcniadpccecjdfdjjppcpchdlm"; # i still dont care about cookies, use with ublock origin and privacy badger
      }
      {
        id = "oboonakemofpalcgghocfoadofidjkkk"; # keepassxc-browser
      }
      {
        id = "iplffkdpngmdjhlpjmppncnlhomiipha"; # unpaywall
      }
      {
        id = "ponfpcnoihfmfllpaingbgckeeldkhle"; # enhancer for youtube
      }
      {
        id = "cmedhionkhpnakcndndgjdbohmhepckk"; # addblock for youtube
      }
    ];
  };

  # xdg.configFile."hypr/per-app/chromium.conf".text = ''
  #   bind = $mainMod, C, exec, ${pkgs.chromium}/bin/chromium
  #   exec-once = [workspace 8 silent] ${pkgs.chromium}/bin/chromium
  # '';
}
