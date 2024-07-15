{ pkgs, lib, isWSL, ... }: {
  config = lib.mkIf isWSL {
    environment.systemPackages = with pkgs; [ ly hyprland ];

    programs.ly.enable = true;

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
