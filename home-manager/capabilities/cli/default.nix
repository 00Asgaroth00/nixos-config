{ pkgs, ... }: {

  imports = [
    ./bat
    ./zsh
  ];

  home.packages = with pkgs; [
    entr        # run arbitrary commands when files change
    fd          # enhanced alternative to find
    miller      # awk/sed/cut/join/sort for data formats like csv/tsv/json
    ripgrep     # enhanced alternative to grep
    toilet      # display colourfull characters in text mode
  ];

}