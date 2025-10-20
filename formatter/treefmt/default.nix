{
  projectRootFile = "flake.nix";
  programs = {
    # Scan .nix files for dead code (unused variable bindings).
    deadnix.enable = true;
    
    # statix check highlights antipatterns in Nix code. statix fix can fix several such occurrences.
    statix.enable = true;

    keep-sorted.enable = true;

    
    nixfmt = {
      enable = true;
      strict = true;
    };
  };
  settings.excludes = [
    "*.age"
    "*.jpg"
    "*.nu"
    "*.png"
    ".jj/*"
    "flake.lock"
    "justfile"
  ];
  settings.formatter = {
    deadnix = {
      priority = 1;
    };

    statix = {
      priority = 2;
    };

    nixfmt = {
      priority = 3;
    };
  };
}
