{ ... }:
{
  systemd.user.services = {
    albert = {
      description = "Linux Application Launcher";
      documentation = [ "https://albertlauncher.github.io/" ];

      serviceConfig = {
        Type = "simple";
        Restart = "on-success";
        RestartSec = "3s";
        ExecStart = ''
          ${pkgs.bash}/bin/bash -c "export PATH=\"$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin/\" && exec ${pkgs.albert}/bin/albert"
        '';
      };

      wantedBy = [ "graphical-session.target" ];
    };
  };
}
