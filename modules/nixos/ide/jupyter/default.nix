{ ... }:
{
  imports = [
    ./kernel/julia-mestint.nix
  ];

  services.jupyter = {
    enable = true;
    password = "argon2:$argon2id$v=19$m=10240,t=10,p=8$whP8HovC4UsdQ2PoInSfFQ$ofwH9lfF/1tlo17fn+/03UP2hwOjWJErFuSf7G4qe54";
  };
}
