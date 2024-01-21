{ ... }: {

  imports = [
    ./bat
  ];

  home.packages = with pkgs; [
    ripgrep     # enhanced grep replacement
  ];

}