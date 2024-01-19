{pkgs} :
let    
     my-python-packages = ps: with ps; [    
          pyusb
     ];    
in
with pkgs; [
    distrobox

    nerdfonts
    chromium


    discord

    insomnia
    vlc

    shotwell

  # creative
    gimp
    davinci-resolve
    ardour
    drawio

  # Search
    # rofi

  # Passwords
    bitwarden
    bitwarden-cli

  # cuda
    cudatoolkit
    
  # Tools  
    gcc
    wget
    htop
    btop
    nvtop
    git
    eza
    fzf
    bat
    pciutils
    fff
    go-chromecast

  # Terminals
    blackbox-terminal
    guake # dropdown

  # Prompt    
    # starship

  # Notes
    obsidian
    
  # Editors
    vim
    vscode.fhs
    jetbrains.idea-ultimate
   
  # Languages
    (python311.withPackages my-python-packages)
    nodejs_20
    jdk17

  # Language Tools
    gradle

    flex
    bison

    gdb

  # Office Suite
    libreoffice
    hunspell
    hunspellDicts.en-us
    hunspellDicts.hu_HU
    hunspellDicts.ru_RU

  # Customization
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-history
    # gnomeExtensions.noannoyance-2
    gnomeExtensions.emoji-copy

    # gnomeExtensions.pop-shell  # buggy, shortcuts not working
    gnomeExtensions.forge

  # Others
    neofetch
    gparted
    # libusb1
    xsel # copy the selected text using X
    libusb1

    # coreutils-prefixed
    # gnomeExtensions.power-profile-switcher
    # gnomeExtensions.power-profile-indicator  # not compatible

    # gnomeExtensions.ideapad
    # gnomeExtensions.ideapad-controls # may try in future

    #gnomeExtensions.thinkpad-battery-threshold  # not this platform
    # gnome.gpaste # not working
    
    # auto-cpufreq # not installing
    # gnomeExtensions.cpufreq

    ## SCHOOL
  # TO BE MOVED TO PROJECT NIX-SHELLS
    # graphviz
]