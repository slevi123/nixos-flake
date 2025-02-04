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
  };

  other-packages = final: _prev: {
    other = import inputs.nixpkgs-for-chromium {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  new-packages = final: _prev: {
    new-pkgs = import inputs.new-nixpkgs {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  ulauncher-packages = final: prev: {
    ulauncher = prev.ulauncher.overrideAttrs (old: {
      propagatedBuildInputs = with final.python3Packages;
        old.propagatedBuildInputs
        ++ [
          pint
          simpleeval
          parsedatetime
          pytz
          babel
          requests
        ]
        ++ [final.pkgs.bitwarden-cli];
    });
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
