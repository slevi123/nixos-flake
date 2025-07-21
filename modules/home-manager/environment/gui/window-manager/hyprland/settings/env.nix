{...}:
{
  wayland.windowManager.hyprland.settings.env = [
    "HYPRCURSOR_SIZE,21"
    "HYPRCURSOR_THEME, theme_Posys-Cursor-Scalable"
    "HYPRSHOT_DIR, Pictures/Screenshots"

    "WLR_NO_HARDWARE_CURSORS,1"  # Fixes cursor rendering
    "GBM_BACKEND,nvidia-drm"     # Improves buffer management
    "__GL_GSYNC_ALLOWED,0"       # Disables unused sync features
  ];
}