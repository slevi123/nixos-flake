{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.unsafe = {
    isNormalUser = true;
    description = "account mainly for only films.. not trusted";
  };
}