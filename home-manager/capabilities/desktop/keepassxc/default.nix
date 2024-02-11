{pkgs, ...}: {
  # see links for inspiration
  #  https://github.com/TLATER/dotfiles/blob/b39af91fbd13d338559a05d69f56c5a97f8c905d/home-config/config/graphical-applications/keepassxc.nix

  home.packages = with pkgs; [
    keepassxc
    # git-credential-keepassxc
  ];

  xdg.configFile."hypr/per-app/keepassxc.conf".text = ''
    exec-once = [workspace 2 silent] sleep 2 && ${pkgs.keepassxc}/bin/keepassxc
  '';
}
