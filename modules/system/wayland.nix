{ pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    defaultSession = "Hyprland";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.printing.enable = true;
}
