{pkgs, ...}: {
  home.packages = with pkgs; [
    ueberzugpp
  ];

  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableZshIntegration = true;
    # keymap = {};
    # settings = {};
    # theme = {};
  };
}
