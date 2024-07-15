{ pkgs, lib, isWSL, ... }: {
  config = lib.mkIf isWSL {
    programs.ly.enable = true;

    programs.hyprland = {
      enable = true;
      # xwayland.enable = true;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
