{ ... }: {
  imports = [ ./hardware-configuration.nix ../../modules/system/default.nix ];

  boot.loader.grub.device = "/dev/nvme0n1";
}
