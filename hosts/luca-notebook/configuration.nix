{ ... }: {
    imports = [
        ./hardware-configuration.nix
        ../../modules/system/default.nix
    ];

    networking.hostName = "luca-notebook";
    boot.loader.grub.device = "/dev/nvme0n1";
}
