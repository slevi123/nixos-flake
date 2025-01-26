{pkgs, ...} : {
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            k--kato.intellij-idea-keybindings
            bbenoist.nix
            mkhl.direnv
        ];
    };
}