{ lib, fetchFromGitHub, stdenv }:
let    
     my-python-packages = ps: with ps; [    
          pyusb
     ];    
in   
stdenv.mkDerivation {
  name = "keyboard-lenovo";
  src = fetchFromGitHub {
    owner = "InstinctEx";
    repo = " lenovo-ideapad-legion-keyboard-led";
    sha256 = "1kc29nnh42v7y4hgm46682kw2pz5yqjjwwc9s5zghc9mhnif9rws";  # You can generate this using `nix-prefetch-url`
  };
  buildInputs = with pkgs; [    
        libusb1    
        (python311.withPackages my-python-packages)    
     ];  

  meta = with lib; {
    description = "Lenovo Keyboard Lights";
    license = licenses.mit;
  };
}