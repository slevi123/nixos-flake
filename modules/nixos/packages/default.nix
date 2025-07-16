{pkgs, ...}:
{
  environment.systemPackages = 
  with pkgs; [
    # distrobox

    # F
    # findutils

    insomnia
    vlc

    shotwell

    # creative
    gimp
    # davinci-resolve
    ardour
    drawio
    zafiro-icons

    # Search

    # Passwords
    # bitwarden
    # bitwarden-cli

    # Tools
    wget
    htop
    unzip
    # nvtop
    pciutils
    usbutils
    nvtopPackages.full
    
    go-chromecast
    lazydocker

    # Terminals
    blackbox-terminal
    guake # dropdown

    # Prompt
    # starship

    # Notes
    obsidian

    # Language Tools

    flex
    bison

    # Language Servers
    taplo # toml
    yaml-language-server
    nodePackages.typescript-language-server

    # Office Suite
    libreoffice
    hunspell
    hunspellDicts.en-us
    hunspellDicts.hu_HU
    hunspellDicts.ru_RU

    # Others
    nssmdns
    neofetch
    gparted
    # libusb1
    xsel # copy the selected text using X
    libusb1

    nethogs
    iotop

    openssl

    azure-cli

    texlive.combined.scheme-full

    nmap

    calibre

    traceroute

    caprine-bin # fb messenger app

    tor-browser
    macchanger
    torsocks

    wirelesstools
    amdgpu_top
    # gtop

    # android-studio
    wireshark

    android-tools

    ## SCHOOL
    # TO BE MOVED TO PROJECT NIX-SHELLS
    # graphviz

    # chromedriver
    #selenium-server-standalone



    # gaphor  # gnome UML tool
    libpng

    # genymotion

    # ls
    baobab
  ];
}