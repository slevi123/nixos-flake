{pkgs, ...}: {
  services.gitlab-runner = {
    enable = true;
    package = pkgs.gitlab-runner;
  };
}

