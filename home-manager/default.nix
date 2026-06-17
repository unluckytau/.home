{ config, pkgs, lib, ... }:

{
	imports = [
		./nixvim
		./bash.nix
		./zathura.nix
	];

	programs.kitty = {
		enable = true;
		themeFile = "vague";
		settings = {
			font_family = "GeistMono Nerd Font";
			font_size = "11";
			bold_font = "auto";
			italic_font = "auto";
			bold_italic_font = "auto";
			tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
			window_padding_width = "10 40";
			hide_window_decorations = "yes";
			tab_bar_edge = "top";
			tab_bar_style = "powerline";
			tab_powerline_style = "slanted";
			cursor_shape = "block";
			cursor_blink_interval = "0.5";
			cursor_stop_blinking_after = "1";
			enable_audio_bell = "no";
			confirm_os_window_close = "0";
			cursor_trail = "200";
			cursor_trail_decay = "0.1 0.4";
			cursor_trail_start_threshold = "2";
		};
		shellIntegration.mode = "no-cursor";
		extraConfig = ''
			include ${../etc/ember.conf}
		'';
	};

	programs.starship = {
		enable = true;
		enableBashIntegration = true;
	};
	xdg.configFile."starship.toml".source = ../etc/starship.toml;
}
