{ pkgs, ... }:
{
  imports = [
    # ./stub-resolver/resolved.nix
    ./stub-resolver/dnscrypt-proxy.nix
  ];

  environment.systemPackages = [
    pkgs.dig # dns tools (dig, nslookup)
  ];
}
