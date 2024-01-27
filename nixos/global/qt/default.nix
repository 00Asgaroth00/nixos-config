{
  pkgs,
  config,
  ...
}: {
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  qt = {
    enable = true;
  };
}
