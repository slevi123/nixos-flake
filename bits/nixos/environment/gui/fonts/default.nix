{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      aurulent-sans
      nerd-fonts.code-new-roman

      # My main nerd font
      nerd-fonts.hack

      # Sans seriff font
      montserrat
      open-sans
      roboto

      # Comic Sans Monospace
      comic-mono

      noto-fonts
    ];
    enableDefaultPackages = true;

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "DejaVu Serif" ];
      sansSerif = [ 
        "Montserrat Regular"
        "Open Sans"
        ];
      monospace = [ 
        "Hack Nerd Font Mono"
        "JetBrains Mono" 
        "DejaVu Sans Mono" 
      ];
      emoji = [ 
        "Hack Nerd Font Mono"
        "Noto Color Emoji" 
      ];

    };
  };

  environment.systemPackages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.code-new-roman
  ];
}
