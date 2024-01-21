{ pkgs, ... }: {

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "tokyo-night";
      vim_keys = true;
    };
  };

  xdg.configFile."btop/themes/tokyo-night.theme".source = pkgs.fetchFromGitHub
    {
      owner = "aristocratos";
      repo = "btop";
      rev = "master";
      # sha256 = "000000000000000000000000000000000000000000000000000";
      # sha256 = "sha256-HHoCVdCH4jCIK0JzoYagURcU722sBARtFkNeGPXuCNM=";
    } + "/tokyo-night.theme";

}