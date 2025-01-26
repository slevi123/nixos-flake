{pkgs, ...} : {
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            k--kato.intellij-idea-keybindings
            mkhl.direnv

            # language support
            bbenoist.nix
            tamasfe.even-better-toml
        ];
    };
}