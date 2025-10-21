# { pkgs,
# # lib,
# ... }:
# let
#   platformioUdevRulesDerivation = pkgs.fetchurl {
#     url = "https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules";
#     # sha256 = lib.fakeHash;
#     sha256 = "sha256-CfOs4g5GoNXeRUmkKY7Kw9KdgOqX5iRLMvmP+u3mqx8=";
#   };
# in
# {
#   services.udev.packages = [
#     # pkgs.writeTextDir "/etc/udev/rules.d/99-emebedded-platformio-udev.rules" (builtins.readFile platformioUdevRulesDerivation)
#     platformioUdevRulesDerivation
#   ];
# }
{ pkgs, ... }:

let
  platformioUdevRules = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules";
    sha256 = "sha256-CfOs4g5GoNXeRUmkKY7Kw9KdgOqX5iRLMvmP+u3mqx8=";
  };
in
{
  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "platformio-udev-rules";
      destination = "/etc/udev/rules.d/99-platformio-udev.rules";
      text = builtins.readFile platformioUdevRules;
    })
  ];
}
