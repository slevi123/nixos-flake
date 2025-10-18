{ ... }:
{
  # REALLY HELPFUL:
  # https://www.reddit.com/r/linux/comments/15p4bfs/amd_pstate_and_amd_pstate_epp_scaling_driver/?rdt=53728
  services = {
    power-profiles-daemon.enable = true;
  };
}
