{
  add_newline = true;

  format='' $character $git_metrics $git_state $git_status $${custom.git-town} $nix_shell $${custom.fsh}
  $username $directory $git_branch $cmd_duration\
  $docker_context\
  $azure\
  $aws\
  $python\
  $c\
  $php\
  $nodejs\
  $cmake\
  $java\
  $haskell
  [{}](bold white) '';

  right_format = ''$${status}
  $git_commit $time'';
}