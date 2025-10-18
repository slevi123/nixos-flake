{ pkgs, self, ... }:
{
  imports = [
    "${self}/bits/home-manager/environment/gui/desktop-environment/gnome"
    "${self}/hosts/parts/essential.nix"
  ];
} // {
  users.users.leswell-init = {
    isNormalUser = true;
    description= "leswell-init";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [
      pkgs.vscode
    ];
  };
}