{ config, lib, ... }:
let 
  charm-dynamic-suffix = ".config/charm/dynamic";
  charm-dynamic = "$HOME/${charm-dynamic-suffix}";
  hyprland-suffix = "hypr/hyprland.conf";
in
{
  home.activation = {
    # These should be idempotent
    touchDynamicHyprland = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p ${charm-dynamic}/hypr
      touch ${charm-dynamic}/${hyprland-suffix}
    '';
  };

  wayland.windowManager.hyprland.settings.source = [ "${config.home.homeDirectory}/${charm-dynamic-suffix}/${hyprland-suffix}" ];
}