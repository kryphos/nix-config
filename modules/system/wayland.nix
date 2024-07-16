{ pkgs, lib, isWSL, ... }: {
  config = lib.mkIf isWSL {
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        defaultSession = "hyprland";
        defaultUser = "luca";
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
