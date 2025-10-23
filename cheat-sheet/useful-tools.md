# Nix
## Nix REPL for experimenting with expressions
```sh
nix repl
```

With nixpkgs (flake):
```sh
nix repl 'nixpkgs#'

# this returns the derivation path
nix-repl> legacyPackages.hello 

# this builds the derivation and returns store path
nix-repl> :b legacyPackages.hello 
```

## Flake Templates
```sh
load template in current folder
nix flake init -t github:nix-community/haumea

creates a new folder
nix flake new <dir> -t github:nix-community/haumea
```


# comma for running temporary programs quickly
```sh
, YOUR_COMMAND <YOUR> [COMMAND_ARGS]
```
