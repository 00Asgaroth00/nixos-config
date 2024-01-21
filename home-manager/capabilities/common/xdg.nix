{ pkgs, ... }: {

  xdg = {
    enable = true;
    
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_WORK_DOCUMENTS_DIR = "${config.home.homeDirectory}/Work/Documents";
      };
    };

  };

}