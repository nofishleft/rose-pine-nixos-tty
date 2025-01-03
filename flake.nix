{
    description = "Soho vibes for NixOS TTY";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = inputs @ { self, nixpkgs }: {
        nixosModules.default = import ./default.nix inputs;
    };
}
