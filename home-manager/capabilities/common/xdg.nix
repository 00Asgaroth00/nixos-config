{ config, ... }: {

  xdg = {
    enable = true;
    
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_GIT_DIR = "${config.home.homeDirectory}/Git";
        XDG_WORK_DIR = "${config.home.homeDirectory}/Work";
        XDG_WORK_DOCUMENTS_DIR = "${config.home.homeDirectory}/Work/Documents";
        XDG_WORK_DOWNLOAD_DIR = "${config.home.homeDirectory}/Work/Downloads";
        XDG_WORK_PICTURES_DIR = "${config.home.homeDirectory}/Work/Pictures";
        XDG_WORK_VIDEOS_DIR = "${config.home.homeDirectory}/Work/Videos";
        XDG_WORK_GIT_DIR = "${config.home.homeDirectory}/Work/Git";
      };
    };

  };

}