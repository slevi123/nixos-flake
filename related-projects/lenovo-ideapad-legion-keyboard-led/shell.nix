{pkgs ? import <nixpkgs> {}}: let
  my-python-packages = ps:
    with ps; [
      pyusb
    ];
in
  pkgs.mkShell {
    name = "lenovo-keyboard-env";
    buildInputs = with pkgs; [
      libusb1
      (python311.withPackages my-python-packages)
    ];
  }
