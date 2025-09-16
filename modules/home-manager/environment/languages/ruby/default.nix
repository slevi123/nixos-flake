{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # ruby_3_2
    # rubyPackages_3_2.railties
  ];
}
