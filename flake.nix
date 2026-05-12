{
	description = "NixOS Flake + Home-manager";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

		home-manager.url = "github:nix-community/home-manager/release-25.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nixvim.url = "github:nix-community/nixvim/nixos-25.11";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs:
		let
			user = "tau";
			host = "Tau";
			system = "x86_64-linux";
			pkgs = inputs.nixpkgs.legacyPackages.${system}; 
		in {
			nixosConfigurations.${host} = inputs.nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs system user host; };
				modules = [
					./nixos
					inputs.home-manager.nixosModules.home-manager

					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							extraSpecialArgs = { inherit inputs system user host; }; [cite: 4]
						};
						home-manager.users.${user} = {
							home.stateVersion = "25.11";

							imports = [
								inputs.nixvim.homeModules.nixvim
								./home-manager
							];
						};
					}
				];
			};

			homeConfigurations.${user} = inputs.home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit inputs system user host; };
				modules = [
					inputs.nixvim.homeModules.nixvim
					./home-manager
					{
						home = {
							username = "${user}";
							homeDirectory = "/home/${user}";
							stateVersion = "25.11";
						};
					}
				];
			};
		};
}
