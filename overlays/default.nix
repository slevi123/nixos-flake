# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs {pkgs = final;};

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });

    flameshot = prev.flameshot.overrideAttrs (previousAttrs: {
      cmakeFlags = [
        "-DUSE_WAYLAND_CLIPBOARD=1"
        "-DUSE_WAYLAND_GRIM=1"
      ];
      buildInputs = previousAttrs.buildInputs ++ [final.libsForQt5.kguiaddons final.grim];
    });

    ulauncher = prev.ulauncher.overrideAttrs (old: {
      propagatedBuildInputs = with final.python3Packages;
        old.propagatedBuildInputs
        ++ [
          # ====EXTENSIONS NEED:============
          pint
          simpleeval
          parsedatetime
          pytz
          babel
          # requests  # is there by default
        ]
        ++ [final.pkgs.bitwarden-cli];
    });
  };
}
