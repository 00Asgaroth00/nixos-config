{
  lib,
  pkgs,
  ...
}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkDefault "tokyo-night";
      vim_keys = true;
    };
  };

  xdg.configFile."btop/themes/tokyo-night.theme".source =
    pkgs.fetchFromGitHub
    {
      owner = "aristocratos";
      repo = "btop";
      rev = "master";
      sha256 = "sha256-9tSSfgJ8d3Gz/nH6AWlF8+4y3KvD8JnMLOW2WfJ0k6c=";
    }
    + "/themes/tokyo-night.theme";
}
