_: {
  programs.kitty = {
    enable = true;
    font = {
      name = "Hack Nerd Font Mono";
      # package = pkgs.nerd-fonts.hack;
    };

    settings = {
      tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}  {title} {num_windows}";
      active_tab_title_template = "{fmt.fg.red}{bell_symbol} {fmt.fg.magenta}{layout_name}{fmt.fg.tab}  {title} {num_windows}";

      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_activity_symbol = "";

      tab_bar_align = "center";
      tab_bar_margin_width = 2.0;

      tab_title_max_length = 50;

      enable_audio_bell = "no";
      cursor_shape = "beam";
      cursor_trail = 500;

      focus_follows_mouse = "yes";

      background_opacity = 0.2;
      background_blur = 0;
      open_url_with =  "default";
    };
  };
}
