> Building NixOS configuration
warning: Git tree '/nix_config/my_own_nix_config' is dirty
unpacking 'github:nix-community/home-manager/868d0a692de703c2de98fab61968e4e310b7c28e' into the Git cache
warning: updating lock file "/nix_config/my_own_nix_config/flake.lock":
• Updated input 'home-manager':
    'github:nix-community/home-manager/3ee51fbdac8c8bdfe1e7e1fcaba6520a563f394f?narHash=sha256-QOD/CNm196nCJRheux/URi4/HE66fthdOMqCJoPP1Y0%3D' (2026-05-23)
  → 'github:nix-community/home-manager/868d0a692de703c2de98fab61968e4e310b7c28e?narHash=sha256-G1I1gd32F7mp9LAe1DaZ4ZL7NX5gyiKwdCMwro1Vrck%3D' (2026-06-29)
evaluation warning: The default value of `gtk.gtk4.theme` has changed from `config.gtk.theme` to `null`.
                    You are currently using the legacy default (`config.gtk.theme`) because `home.stateVersion` is less than "26.05".
                    To silence this warning and keep legacy behavior, set:
                      gtk.gtk4.theme = config.gtk.theme;
                    To adopt the new default behavior, set:
                      gtk.gtk4.theme = null;
evaluation warning: The default value of `wayland.windowManager.hyprland.configType` has changed from `"hyprlang"` to `"lua"`.
                    You are currently using the legacy default (`"hyprlang"`) because `home.stateVersion` is less than "26.05".
                    To silence this warning and keep legacy behavior, set:
                      wayland.windowManager.hyprland.configType = "hyprlang";
                    To adopt the new default behavior, set:
                      wayland.windowManager.hyprland.configType = "lua";
evaluation warning: The default value of `gtk.gtk4.theme` has changed from `config.gtk.theme` to `null`.
                    You are currently using the legacy default (`config.gtk.theme`) because `home.stateVersion` is less than "26.05".
                    To silence this warning and keep legacy behavior, set:
                      gtk.gtk4.theme = config.gtk.theme;
                    To adopt the new default behavior, set:
                      gtk.gtk4.theme = null;
evaluation warning: The default value of `wayland.windowManager.hyprland.configType` has changed from `"hyprlang"` to `"lua"`.
                    You are currently using the legacy default (`"hyprlang"`) because `home.stateVersion` is less than "26.05".
                    To silence this warning and keep legacy behavior, set:
                      wayland.windowManager.hyprland.configType = "hyprlang";
                    To adopt the new default behavior, set:
                      wayland.windowManager.hyprland.configType = "lua";
evaluation warning: 'system' has been renamed to/replaced by 'stdenv.hostPlatform.system'
evaluation warning: The default value of `programs.yazi.shellWrapperName` has changed from `"yy"` to `"y"`.
                    You are currently using the legacy default (`"yy"`) because `home.stateVersion` is less than "26.05".
                    To silence this warning and keep legacy behavior, set:
                      programs.yazi.shellWrapperName = "yy";
                    To adopt the new default behavior, set:
                      programs.yazi.shellWrapperName = "y";
evaluation warning: 'system' has been renamed to/replaced by 'stdenv.hostPlatform.system'
evaluation warning: The default value of `programs.yazi.shellWrapperName` has changed from `"yy"` to `"y"`.
                    You are currently using the legacy default (`"yy"`) because `home.stateVersion` is less than "26.05".
                    To silence this warning and keep legacy behavior, set:
                      programs.yazi.shellWrapperName = "yy";
                    To adopt the new default behavior, set:
                      programs.yazi.shellWrapperName = "y";
evaluation warning: leswell profile: `programs.ssh.matchBlocks` defined in `/nix/store/30s45nkhkdv3sxdfy4470kbi14qk6wq0-source/bits/home-manager/environment/remote/ssh' is deprecated. Use `programs.ssh.settings`.
evaluation warning: leswell profile: The default value of `programs.firefox.configPath` has changed from `".mozilla/firefox"` to `"${config.xdg.configHome}/mozilla/firefox"`.
                    You are currently using the legacy default (`".mozilla/firefox"`) because `home.stateVersion` is less than "26.05".
                    To silence this warning and keep legacy behavior, set:
                      programs.firefox.configPath = ".mozilla/firefox";
                    To adopt the new default behavior, set:
                      programs.firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";

                    To migrate to the XDG path, move `~/.mozilla/firefox` to
                    `$XDG_CONFIG_HOME/mozilla/firefox` and remove the old directory.
                    Native messaging hosts are not moved by this option change.
evaluation warning: leswellhm profile: `programs.ssh.matchBlocks` defined in `/nix/store/30s45nkhkdv3sxdfy4470kbi14qk6wq0-source/bits/home-manager/environment/remote/ssh' is deprecated. Use `programs.ssh.settings`.
evaluation warning: leswellhm profile: The default value of `programs.firefox.configPath` has changed from `".mozilla/firefox"` to `"${config.xdg.configHome}/mozilla/firefox"`.
                    You are currently using the legacy default (`".mozilla/firefox"`) because `home.stateVersion` is less than "26.05".
                    To silence this warning and keep legacy behavior, set:
                      programs.firefox.configPath = ".mozilla/firefox";
                    To adopt the new default behavior, set:
                      programs.firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";

                    To migrate to the XDG path, move `~/.mozilla/firefox` to
                    `$XDG_CONFIG_HOME/mozilla/firefox` and remove the old directory.
                    Native messaging hosts are not moved by this option change.
these 751 derivations will be built: