{ pkgs, ... }: {

  # environment = {
  #   variables = {
  #     EDITOR = "nvim";
  #   };
  # };

  programs.neovim = {
    # enable = true;
    # defaultEditor = true;
    # viAlias = true;
    # vimAlias = true;
    
    plugins = with pkgs.vimPlugins; [
      {
        plugin = tokyonight-nvim;
        type = lua;
        config = ''
          require("tokyonight").setup{}
          vim.cmd[[colorscheme tokyonight-night]]
        '';
      }
    ];
  };

}