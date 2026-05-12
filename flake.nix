
{
  description = "Cross-platform Home Manager configuration";

  inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

		home-manager.url = "github:nix-community/home-manager/release-25.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nixvim.url = "github:nix-community/nixvim/nixos-25.11";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      username = "tau";
      lib = nixpkgs.lib;
      
      mkHomeConfig = system: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        modules = [
				./home-manager 
				];
        extraSpecialArgs = { inherit username inputs; };
      };
    in {
      homeConfigurations = {
        "${username}@linux-x86" = mkHomeConfig "x86_64-linux";
        "${username}@linux-arm" = mkHomeConfig "aarch64-linux";
        "${username}@mac-intel"  = mkHomeConfig "x86_64-darwin";
        "${username}@mac-arm"    = mkHomeConfig "aarch64-darwin";
      };
    };
}
