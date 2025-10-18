{
  pkgs,
  ...
}:
{
  programs = {
    nix-index = {
      enable = true;
    };
  };
  environment.systemPackages = [
    pkgs.comma
  ];
}
