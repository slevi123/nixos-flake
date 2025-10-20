{
  nix_shell = {
    # format = "[$state($symbol \($name\))]($style)"";
    # format = "[\ue0c7](#ffedbd)[ $state($symbol \\($name\\))](bg:#ffedbd fg:blue)[\ue0c6](#ffedbd)";
    format = "[$state($symbol \($name\))]($style)";
    impure_msg = "";
    symbol = "";
    heuristic = true;
  };

  custom = {
    fsh = {
      description = "Indicates when I'm in FHS env.";
      symbol = "\(FHS\)";
      when = "test -n \"$FHS\"";
      style = "blink dimmed blue";
    };
  };

  # I dont think I will run guix (with nix)...
  guix_shell = {
    symbol = " ";
  };

}
