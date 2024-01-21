{ pkgs, ... }: {

  imports = [
    ./bat
    ./btop
    ./direnv
    ./eza
    ./fzf
    ./nnn
    ./starship
    ./zsh
  ];

  home.packages = with pkgs; [
    entr        # run arbitrary commands when files change
    fd          # enhanced alternative to find
    ipfetch     # neofetch like tool that can lookup ips
    miller      # awk/sed/cut/join/sort for data formats like csv/tsv/json
    neofetch    # highly customizable system info script
    ripgrep     # enhanced alternative to grep
    toilet      # display colourfull characters in text mode
  ];

}