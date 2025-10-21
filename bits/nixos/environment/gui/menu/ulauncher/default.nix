{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.ulauncher ];

  systemd.user.services = {
    ulauncher = {
      enable = true;
      description = "Linux Application Launcher";
      documentation = [ "https://ulauncher.io/" ];
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = "3s";
        ExecStart = ''
          ${pkgs.bash}/bin/bash -c "export GDK_BACKEND=wayland && export PATH=\"$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin/\" && exec ${pkgs.ulauncher}/bin/ulauncher --hide-window"
        '';
      };

      wantedBy = [ "graphical-session.target" ];
      after = [ "display-manager.service" ];
    };
  };
}
