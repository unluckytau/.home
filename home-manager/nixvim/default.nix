{ config, pkgs, lib, inputs, ... }:

{
	programs.nixvim = {
		enable = true;
		defaultEditor = true;

		extraPlugins = [
			(pkgs.vimUtils.buildVimPlugin {
				name = "ember-theme";
				src = inputs.ember-theme;
			})
		];
		colorscheme = "ember";

		clipboard.register = "unnamedplus";
		clipboard.providers.xclip.enable = true;

		imports = [ 
			./keybinds.nix
			./settings.nix
			./plugins
		];
	};
}
