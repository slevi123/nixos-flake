{
  inputs,
  self,
  pkgs,
  ...
}:
let
  inputs' = import "${self}/charmpkgs/lib/bring-system-inputs.nix" pkgs.system inputs;
in
{
  home.file.".config/quick_actions" = {
    source = inputs'.quick-actions-config.packages.default;
    recursive = true;
  };
  imports = [ inputs.quick-actions.homeManagerModules.default ];
}
