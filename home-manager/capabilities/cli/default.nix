{ pkgs, ... }: {

  imports = [
    ./bat
    ./btop
    ./direnv
    ./eza
    ./fzf
    ./git
    ./neovim
    ./nnn
    ./starship
    ./zsh
  ];

  home.packages = with pkgs; [
    entr        # run arbitrary commands when files change
    fd          # enhanced alternative to find
    ipfetch     # neofetch like tool that can lookup ips (giving errors: IP is invalid or API is down)
    miller      # awk/sed/cut/join/sort for data formats like csv/tsv/json
    neofetch    # highly customizable system info script
    ripgrep     # enhanced alternative to grep
    toilet      # display colourfull characters in text mode

    # worky stuff
    iproute2    # ip utils, should be installed by default, but make sure
    dig         # dns toolset
    ngrep       # network packet analyzer
    sngrep      # voip message flows in terminal
    sipp        # sip testing tool
    sipsak      # sip swiss army knife
    sipexer     # modern sip cli tool
    termshark   # terminal ui for wireshark-cli
    kubectl     # kubernetes cli
    talosctl    # talos cli mgmt tool
    k9s         # tui kubernets tool
    fluxcd      # CD tool for kubernetes
  ];

}