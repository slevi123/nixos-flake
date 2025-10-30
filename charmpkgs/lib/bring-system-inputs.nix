system: inputs:
let
  # Helper function to get an attribute from an attrset, returning an empty set if it doesn't exist.


  # Extract packages and devShells for the given system from each input flake.
  specialized = builtins.mapAttrs (
    name: import ./bring-system.nix system) inputs;
in
specialized
