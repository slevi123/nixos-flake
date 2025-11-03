{
  inputs,
  pkgs,
  charmpkgs,
  ...
}:
let
  inputs' = charmpkgs.lib.bring-system-inputs pkgs.system inputs;
  
in
{
  home.file.".config/quick_actions" = {
    source = inputs'.quick-actions-config.packages.default;
    recursive = true;
  };
  imports = [ inputs.quick-actions.homeManagerModules.default ];
}
