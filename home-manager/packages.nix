{pkgs, ...} : {
    home.packages = with pkgs; [ 
        firefox
        spotify
        arduino-ide

    ] ++ (with pkgs.jetbrains; [
        pycharm-professional
        idea-ultimate
        clion

    ]) ++ [
         (let base = pkgs.appimageTools.defaultFhsEnvArgs; in 
            pkgs.buildFHSUserEnv (base // {
                name = "fhs";
                targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config]; 
                profile = "export FHS=1"; 
                runScript = "zsh"; 
                # extraOutputsToInstall = ["dev"];
            }))
    ];
}