{...} : 
{
  home.sessionVariables = {
    PYTHONSTARTUP = ./python_startup.py;
  };

  home = {
    shellAliases = {
      py = "/run/current-system/sw/bin/python -q";
    };
  };
}