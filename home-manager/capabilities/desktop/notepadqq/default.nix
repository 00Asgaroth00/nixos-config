{pkgs, ...}: {
  home.packages = with pkgs; [
    notepadqq
  ];

  # https://discourse.nixos.org/t/set-default-application-for-mime-type-with-home-manager/17190
  # xdg-mime query filetype <filename>
  # xdg-mime query default application/pdf
  # fd app.desktop /

  xdg.mimeApps = {
    associations.added = {
      "text/plain" = ["notepadqq.desktop"];
      "text/csv" = ["notepadqq.desktop"];
      "text/xml" = ["notepadqq.desktop"];
    };
    defaultApplications = {
      "text/plain" = ["notepadqq.desktop"];
      "text/csv" = ["notepadqq.desktop"];
      "text/xml" = ["notepadqq.desktop"];
    };
  };
}
