{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableZshIntegration = true;
    # keymap = {};
    # settings = {};
    # theme = {};
  };
}
