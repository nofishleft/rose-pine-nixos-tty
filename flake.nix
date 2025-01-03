{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = inputs @ { self, nixpkgs }: {
        nixosModules.default = import ./default.nix inputs;
    };
}
