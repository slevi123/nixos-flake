let
  top-line =
    "$character $git_metrics $git_state $git_status "
    + ''''$''\{custom.git-town''\} $nix_shell ''$''\{custom.fsh''\} '';

  middle-line =
    "$username $directory $git_branch $cmd_duration "
    + "$docker_context"
    + "$azure"
    + "$aws"
    + "$python"
    + "$c"
    + "$php"
    + "$nodejs"
    + "$cmake"
    + "$java"
    + "$haskell";

  bottom-line = "[{}](bold white) ";
in
{
  add_newline = true;

  format = ''
    ${top-line}
    ${middle-line}
    ${bottom-line}
  '';

  right_format = "$status | " + "$git_commit $time ";
}
