{pkgs, inputs, ...} : 
let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages."${pkgs.system}";
in
{
  home.sessionVariables = {
    PYTHONSTARTUP = ./python_startup.py;
  };

  home = {
    shellAliases = {
      py = "/run/current-system/sw/bin/python -q";
    };

    packages = 
    let
      python-packages = ps:
        with ps; [
          pyusb
          # jupyter
          requests
          scrapy
          nltk
          numpy
          marisa-trie
          pygtrie
          scapy
          # overleaf-sync
          #pint
          #simpleeval
          #parsedatetime
          #pytz
          #babel
          # fuzzywuzzy
        ];
    in
    [
          (pkgs-stable.python313.withPackages python-packages)
    ];
  };
}