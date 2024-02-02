{...}: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "WLR_NO_HARDWARE_CURSORS,1"
      "MOZ_DISABLE_RDD_SANDBOX,1"
      "NVD_BACKEND,direct"
      "EGL_PLATFORM,wayland";
    ];
  };
}
