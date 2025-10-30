system: flake:
let
  getAttrOrEmpty =
    attrName: attrSet:
    if builtins.hasAttr attrName attrSet then builtins.getAttr attrName attrSet else { };
  packages = getAttrOrEmpty system (getAttrOrEmpty "packages" flake);
  legacyPackages = getAttrOrEmpty system (getAttrOrEmpty "legacyPackages" flake);
  devShells = getAttrOrEmpty system (getAttrOrEmpty "devShells" flake);
in
flake // { inherit packages legacyPackages devShells; }
