hyprpaperConfig: _name:
let
  hyprpaperConfText =
    let
      preloads = builtins.concatStringsSep "\n" (map (p: "preload = ${p}") hyprpaperConfig.preload);
      walls = builtins.concatStringsSep "\n" (
        builtins.attrValues (
          builtins.mapAttrs (output: path: "wallpaper = ${output},${path}") hyprpaperConfig.wallpaper
        )
      );
      boolToOnOff = b: if b then "on" else "off";
      optional = arg: expr: if builtins.hasAttr arg hyprpaperConfig then expr else "";
    in
    ''
      ${preloads}
      ${walls}
      ${optional "ipc" ("ipc = " + (boolToOnOff hyprpaperConfig.ipc))}
      ${optional "splash" ("splash = " + (boolToOnOff hyprpaperConfig.splash))}
    '';
in
builtins.toFile "hyprpaper.conf" hyprpaperConfText
