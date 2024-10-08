
{
  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs"; # Usage of different nixpkgs for fixes and adaptions
  };

  outputs = { self, nixpkgs, nix-ros-overlay, ... }@attrs: {
    nixosConfigurations.nixos-robot-1 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        nix-ros-overlay.nixosModules.default
        ./configuration.nix
      ];
    };
  };

  nixConfig = {
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys = [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };
}
