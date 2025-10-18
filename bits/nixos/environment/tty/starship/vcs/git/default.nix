{
  git_commit = {
    format = "[DETACHED head](bold red): [$hash]($style)";
  };
  git_branch = {
    symbol = " ";
  };

  custom.git-town = {
          command = "git town status --pending";
          when = "";
          require_repo = true;
  };
}