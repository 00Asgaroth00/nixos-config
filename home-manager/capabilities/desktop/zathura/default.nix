{...}: {
  programs.zathura = {
    enable = true;
  };

  # https://discourse.nixos.org/t/set-default-application-for-mime-type-with-home-manager/17190
  # xdg-mime query filetype <filename>
  # xdg-mime query default application/pdf
  # fd app.desktop /

  xdg.mimeApps = {
    associations.added = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
    defaultApplications = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
  };
}
