{ pkgs, ... }: {

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "00asgaroth00";
    userEmail = "00asgaroth00@gmail.com";
  };

}