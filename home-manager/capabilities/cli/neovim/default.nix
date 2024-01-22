{ pkgs, ... }: {

  # https://github.com/folke/tokyonight.nvim/

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
          require("tokyonight").setup({
              style = "night",
            })
          vim.cmd[[colorscheme tokyonight]]
        '';
      }
    ];
  };

}