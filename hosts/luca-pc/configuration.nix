{ ... }: {
  imports = [ /etc/nix/nixos/hardware-configuration.nix ../../modules/system/default.nix ];

  boot.loader.grub.device = "/dev/vda1";
}
