{pkgs} :
with pkgs; [
    nerdfonts

  # Search
    # rofi

  # Passwords
    bitwarden
    bitwarden-cli
    
  # Tools  
    wget
    htop
    nvtop
    git
    exa
    bat
    pciutils

  # Terminal
    blackbox-terminal

  # Prompt    
    # starship

  # Notes
    obsidian
    
  # Editors
    vim
    vscode.fhs
    jetbrains.idea-ultimate

  # Languages
    python311
    nodejs_20
    jdk

  # Office Suite
    libreoffice
    hunspell
    hunspellDicts.en-us
    hunspellDicts.hu_HU
    hunspellDicts.ru_RU

  # Customization
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-history
    gnomeExtensions.noannoyance-2

    # gnomeExtensions.pop-shell  # buggy, shortcuts not working
    gnomeExtensions.forge
    
  # Others
    neofetch
    gparted
    # libusb1
    xsel # copy the selected text using X

    # coreutils-prefixed
    # gnomeExtensions.power-profile-switcher
    # gnomeExtensions.power-profile-indicator  # not compatible

    # gnomeExtensions.ideapad
    # gnomeExtensions.ideapad-controls # may try in future

    #gnomeExtensions.thinkpad-battery-threshold  # not this platform
    # gnome.gpaste # not working
    
    # auto-cpufreq # not installing
    # gnomeExtensions.cpufreq

  # TO BE MOVED TO PROJECT NIX-SHELLS
    # graphviz
]