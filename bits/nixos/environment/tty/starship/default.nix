{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = " 🔥 ";
        error_symbol = "[✗](bold red)";
      };
      cmd_duration = {
        min_time = 1000;
      };

      directory = {
        style = "fg:#EFC88B";
        format = "[ $path]($style)";
        repo_root_format = "[ $repo_root]($repo_root_style)[$path]($style)";
        repo_root_style = "fg:#5EFC8D";
        truncation_length = 3 ;
        truncate_to_repo = true;
        truncation_symbol = "…";
        read_only = " 󰌾";

      };

      time = {
        disabled = false;
        time_format = "%H:%M";
        format = "| [$time]($style)";
      };

      hostname = {
        ssh_symbol = " ";
      };

      docker_context = {
        symbol = " ";
      };

      status = {
        disabled =  false;
        format = "[ $status \[$symbol$signal_name$signal_number $common_meaning$maybe_int\]]($style) ";
        # format = "[ $status $pipestatus \[$symbol$signal_name$signal_number $common_meaning$maybe_int\]]($style) "";
        pipestatus_format = "\[$pipestatus\] => [$symbol$common_meaning$signal_name$maybe_int]($style) ";
        map_symbol = true;
        pipestatus = true;
      };

    username = {
      style_root = "blink dimmed bold red";
    };

    } 
    // (import ./global/format.nix)
    // (import ./nix.nix)
    // (import ./vcs)
    // (import ./cloud-platform.nix)
    // (import ./languages.nix)
    // (import ./os-symbols.nix)
    // (import ./copied-blindly.nix)
    ;
  };
}