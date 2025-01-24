{pkgs, ...} : {
    home.packages = with pkgs; [ 
        firefox

        ## gnome extensions
        gnomeExtensions.emoji-copy
    ];
}