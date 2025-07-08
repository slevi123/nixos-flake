{inputs, pkgs, ...}:
{
  home.packages = [
    inputs.quick-actions.packages.${pkgs.system}.quick-actions
  ];
}