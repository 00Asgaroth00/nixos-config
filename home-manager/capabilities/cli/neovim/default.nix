{ pkgs, ... }: {

  # https://github.com/folke/tokyonight.nvim/

  # environment = {
  #   variables = {
  #     EDITOR = "nvim";
  #   };
  # };

  programs.neovim = {
    enable = true;
    # defaultEditor = true;
    # viAlias = true;
    # vimAlias = true;
    
    plugins = with pkgs.vimPlugins; [
      {
        plugin = tokyonight-nvim; # TokyoNight Colours
        type = "lua";
        config = ''
          require("tokyonight").setup{}
          vim.cmd[[colorscheme tokyonight-night]]
        '';
      }
      {
        plugin = nvim-treesitter.withAllGrammars; # Syntax Highlighting
        type = "lua";
        config = ''
          require('nvim-treesitter.configs').setup {
            highlight = { enable = true}
          }
        '';
      }
    ];
  };

}