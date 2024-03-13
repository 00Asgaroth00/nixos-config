{...}: {
  programs.eza = {
    enable = true;
    # enableAliases = true;
    enableZshIntegration = true;
    icons = true;
    extraOptions = ["--group-directories-first" "--header"];
    git = true;
  };
}
