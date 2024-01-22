{ pkgs, ... }: {

  # environment = {
  #   variables = {
  #     EDITOR = "nvim";
  #   };
  # };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

}