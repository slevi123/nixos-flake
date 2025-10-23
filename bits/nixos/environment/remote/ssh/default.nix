{
  # to be able to use `ssh-add <KEY_PATH>` to cache key passwd until user session, `ssh-add -l` to list 'em
  programs.ssh = {
    startAgent = true;
    agentTimeout = "1h";
  };
}