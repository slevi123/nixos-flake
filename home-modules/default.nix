{ osConfig, ezModules, ... }:
{
  imports = [
    ezModules.tty
  ];

  home.stateVersion = osConfig.system.stateVersion;
  # home-manager.backupFileExtension = "hm-backup-${osConfig.networking.hostName}";
}
