{
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://charm-os.cachix.org"
    ];
    trusted-substituters = [
      "https://nix-community.cachix.org"
      "https://charm-os.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "charm-os.cachix.org-1:i3YCtwuNr+OjEoZnzUp6iCSvxFu2ksXuoKZnCzOt5ks="
    ];
    trusted-users = [
      "@nixxers"
    ];
  };
}
