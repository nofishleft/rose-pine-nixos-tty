# A NixOS module to expose options to apply the theme to tty
inputs: { config, lib, ... }:

{
    options.rose-pine-nixos-tty = with lib; {
        enable = mkEnableOption "rose pine theme for tty";
        variant = mkOption {
            type = with types; enum ["rose-pine" "rose-pine-moon" "rose-pine-dawn"];
            default = "rose-pine";
            description = "Selected which variant of the theme should be used";
            example = "config.rose-pine-nixos-tty.variant = \"rose-pine\"";
        };
        
        _variants = mkOption {
            type = with types; attrsOf (listOf str);
            internal = true;
            description = "Each variant should set their list of 16 colors through here";
            example = "config.rose-pine-nixos-tty._variants.\"rose-pine\" = [...]";
        };
    };

    imports = [
        ./dist/rose-pine.nix
        ./dist/rose-pine-moon.nix
        ./dist/rose-pine-dawn.nix
    ];

    config = lib.mkIf config.rose-pine-nixos-tty.enable {
        assertions = [
            {
                assertion = builtins.hasAttr "${config.rose-pine-nixos-tty.variant}" config.rose-pine-nixos-tty._variants;
                message = "Couldn't find variant! Has it been generated from the template?";
            }
            {
                assertion = 16 == builtins.length(config.rose-pine-nixos-tty._variants."${config.rose-pine-nixos-tty.variant}");
                message = "Invalid number of colors! There should be exactly 16.";
            }
        ];
        console.colors = config.rose-pine-nixos-tty._variants."${config.rose-pine-nixos-tty.variant}";
    };
}