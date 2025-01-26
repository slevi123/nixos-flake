{pkgs} :
let    
     my-python-packages = ps: with ps; [    
          pyusb
          jupyter
          requests
          scrapy
          nltk
          numpy
          marisa-trie
          pygtrie
          scapy
          # overleaf-sync
          #pint 
          #simpleeval 
          #parsedatetime 
          #pytz
          #babel
          # fuzzywuzzy
     ];    
in
with pkgs; [
    distrobox

    # F
    ulauncher
    # findutils

    nerdfonts
    chromium

    jdk8

    unzip

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
    # bitwarden
    bitwarden-cli

  # cuda
    # cudatoolkit
    
  # Tools  
    gcc
    wget
    htop
    btop
    # nvtop
    nvtopPackages.full
    git
    eza
    fzf
    bat
    pciutils
    usbutils
    fff
    go-chromecast
    lazydocker 

  # Terminals
    blackbox-terminal
    guake # dropdown

  # Prompt    
    # starship

  # Notes
    obsidian
    
  # Editors
    vim
    helix
    vscode.fhs
    jetbrains.idea-ultimate
   
  # Languages
    (python311.withPackages my-python-packages)
    nodejs_20
    jdk17
    jdk

  # Language Tools
    gradle

    flex
    bison

    gdb

  # Language Servers
    # jdtls   # java
    # python311Packages.python-lsp-server
    taplo   # toml
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

    zoxide # z, better cd

    texlive.combined.scheme-full

    nmap

    wineWowPackages.stable
    qbittorrent

    calibre

    teams-for-linux
    whatsapp-for-linux

    traceroute

    caprine-bin  # fb messenger app

    tor-browser
    macchanger
    torsocks

    # astra gnom extension required
    wirelesstools
    amdgpu_top
    gtop

    # android-studio

    wireshark

    android-tools

    # pulseaudio # for pactl and who knows why


    ## SCHOOL
  # TO BE MOVED TO PROJECT NIX-SHELLS
    # graphviz

    # chromedriver
    #selenium-server-standalone 

    jmeter

    fragments  # gnome circle torrent client

    # gaphor  # gnome UML tool
    libpng

    genymotion

    # ls

    spotify

    # ruby_3_2
    # rubyPackages_3_2.railties
]
