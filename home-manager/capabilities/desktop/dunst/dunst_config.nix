{ ... }: {

  xdg.configFile."dunst/dunstrc".text = ''
    [global]
    # font="Hasklug Nerd Font Regular 9"
    progress_bar_corner_radius = 10
    height=300
    # icon_theme=Qogir-dark
    enable_recursive_icon_lookup = true
    offset="30x50"
    origin="top-center"
    transparency=10
    width=300
    corner_radius=10
    frame_width=5
    timeout=3

    [urgency_normal]
    timeout=3

    [urgency_critical]
    timeout=5

  '';

}
