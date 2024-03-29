{pkgs, ...}: {
  services.kanshi = {
    enable = true;
    # package = pkgs.kanshi;
    systemdTarget = "graphical-session.target";
    profiles = {
      home = {
        outputs = [
          {
            criteria = "Microstep MAG274QRF-QD CA8A391A00356";
            position = "1440,180";
            mode = "2560x1440@120";
            scale = 1.0;
            transform = "normal"; # null or one of “normal”, “90”, “180”, “270”, “flipped”, “flipped-90”, “flipped-180”, “flipped-270”
            status = "enable";
          }
          {
            criteria = "LG Electronics LG HDR 4K 0x0004DC12";
            position = "0,0";
            mode = "3840x2160@30"; # investigate why nbot 60Hz, check cable
            scale = 1.5;
            transform = "270"; # null or one of “normal”, “90”, “180”, “270”, “flipped”, “flipped-90”, “flipped-180”, “flipped-270”
            status = "enable";
          }
          {
            criteria = "LG Electronics LG HDR 4K 0x0004DC17";
            position = "4000,180";
            mode = "3840x2160@60";
            scale = 1.5;
            transform = "normal"; # null or one of “normal”, “90”, “180”, “270”, “flipped”, “flipped-90”, “flipped-180”, “flipped-270”
            status = "enable";
          }
        ];
      };
    };
  };
}
