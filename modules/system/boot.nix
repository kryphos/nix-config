{ pkgs, ... }: {
  boot.loader.grub = {
    enable = true;
    useOSProber = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
