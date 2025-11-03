{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    groups = {
      gitprojects = { };
      i2c = { };
      network = { };
      nixxers = { };
    };
  };
}
