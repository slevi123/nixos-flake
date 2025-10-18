{ pkgs, inputs, ... }:
let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages."${pkgs.system}";
in
{
  home =
    let
      python-packages =
        ps: with ps; [
          pyusb
          # jupyter
          requests
          scrapy
          nltk
          numpy
          marisa-trie
          pygtrie
          scapy
          typer # CLI for everything
          rich # terminal beauty
          # overleaf-sync
          #pint
          #simpleeval
          #parsedatetime
          #pytz
          #babel
          # fuzzywuzzy
          setuptools
          wheel
          requests
          build
          twine
          pyusb
          hatchling
          tinytuya
          # openai-whisper
        ];
      my-python = (pkgs-stable.python313.withPackages python-packages);
    in

    {
      sessionVariables = {
        PYTHONSTARTUP = ./python_startup.py;
      };

      shellAliases = {
        py = "${my-python}/bin/python -q";
      };

      packages = [
        my-python
      ];
    };
}
