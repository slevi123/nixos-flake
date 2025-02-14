{inputs, ...}:
{
  imports = [
    inputs.agenix.nixosModules.default
  ];
  age = {
    secrets = {
      homerpi.file = ../../../secrets/homerpi.age;
      pypirc.file = ../../../secrets/pypirc.age;
    };
    identityPaths = [
      "/home/lesswelhm/.ssh/agenix_id_ed25519"
    ];
  };
}
