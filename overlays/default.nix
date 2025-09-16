# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });

    # for now, because there is an old hash in warp
    # warp-terminal = prev.warp-terminal.overrideAttrs (oldAttrs: {
    #   src = prev.fetchurl {
    #     url = oldAttrs.src.url;
    #     hash = "sha256-yrwS6rqSGkiWNjr17MVyH+ZQL2CTUqt6coi8qWfq0Gg="; # New hash
    #   };
    # });

    flameshot = prev.flameshot.overrideAttrs (previousAttrs: {
      cmakeFlags = [
        "-DUSE_WAYLAND_CLIPBOARD=1"
        "-DUSE_WAYLAND_GRIM=1"
      ];
      buildInputs = previousAttrs.buildInputs ++ [
        final.libsForQt5.kguiaddons
        final.grim
      ];
    });

    ulauncher = prev.ulauncher.overrideAttrs (old: {
      propagatedBuildInputs =
        with final.python3Packages;
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
        ++ [ final.pkgs.bitwarden-cli ];
    });

    # openai-whisper = prev.openai-whisper.overrideAttrs (old: {
    #   propagatedBuildInputs = with final.python312Packages;[
    #     more-itertools
    #     numba
    #     numpy
    #     tiktoken
    #     torch-bin
    #     # inputs.nixpkgs-stable-unfree.legacyPackages."x86_64-linux".python3Packages.torch.override {
    #     #   cudaSupport = true;
    #     #   # cudnn = inputs.nixpkgs-stable-unfree.legacyPackages."x86_64-linux".cudnn;  # Specific cuDNN version
    #     #   cudaCapabilities = ["8.6"];  # Your GPU arch
    #     # }
    #     tqdm
    #   ];
    # });
  };
}
