{pkgs, ...}: {
  services.kanshi = {
    enable = true;
    package = pkgs.kanshi;
    systemdTarget = "graphical.target";
    profiles = {
      home = {
        outputs = [
          {
            criteria = "Microstep MAG274QRF-QD CA8A391A00356";
            position = "1440,180";
            mode = "2560x1440@120";
            scale = 1;
            transform = "normal"; # null or one of “normal”, “90”, “180”, “270”, “flipped”, “flipped-90”, “flipped-180”, “flipped-270”
            status = "enabled";
          }
          {
            criteria = "LG Electronics LG HDR 4K 0x0004DC12";
            position = "0,0";
            mode = "3840x2160@60";
            scale = 1.5;
            transform = "270"; # null or one of “normal”, “90”, “180”, “270”, “flipped”, “flipped-90”, “flipped-180”, “flipped-270”
            status = "enabled";
          }
          {
            criteria = "LG Electronics LG HDR 4K 0x0004DC17";
            position = "4000,180";
            mode = "3840x2160@60";
            scale = 1.5;
            transform = "normal"; # null or one of “normal”, “90”, “180”, “270”, “flipped”, “flipped-90”, “flipped-180”, “flipped-270”
            status = "enabled";
          }
        ];
      };
    };
  };
}
