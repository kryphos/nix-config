{ pkgs, ... }: {
  services.displayManager = {
     enable = true;
     execCmd = "${pkgs.lemurs}/bin/lemurs --no-log";
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
  services.xserver.enable = true;
}
