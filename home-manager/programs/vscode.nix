{pkgs, ...} : {
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            k--kato.intellij-idea-keybindings
            mkhl.direnv
            mhutchie.git-graph

            # language support
            bbenoist.nix
            tamasfe.even-better-toml
        ];
    };
}