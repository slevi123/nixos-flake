{ pkgs, ...}: {
	programs = {
		zsh = {
      enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    };
		
		starship = {
			enable = true;
			settings = pkgs.lib.importTOML ./dotfiles/starship.toml;
		};
	};
	
	environment = {	
		shellAliases = {
    	exa = "eza --icons";
    	ls = "eza";
    	lstree = "eza --tree";
    	ll = "exa -l";
    	la = "exa -a";
    	lla = "exa -la";
    	py = "/run/current-system/sw/bin/python";
		};
		
		systemPackages = [ pkgs.eza ];
  };
}