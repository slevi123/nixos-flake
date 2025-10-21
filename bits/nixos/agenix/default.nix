{ inputs, self, ... }:
{
  imports = [ inputs.agenix.nixosModules.default ];
  age = {
    secrets = {
      homerpi = {
        file = "${self}/secrets/homerpi.age";
        owner = "leswellhm";
      };
      pypirc = {
        file = "${self}/secrets/pypirc.age";
        owner = "leswellhm";
      };
    };
    identityPaths = [ "/home/leswellhm/.ssh/agenix_id_ed25519" ];
  };
}
