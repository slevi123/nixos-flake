{ config, ... }:
{
  # to be able to use `ssh-add <KEY_PATH>` to cache key passwd until user session, `ssh-add -l` to list 'em
  programs.ssh = {
    startAgent = true;
    agentTimeout = "1h";

    # x11 is required for it
    enableAskPassword = config.programs.hyprland.xwayland.enable;
  };
}
