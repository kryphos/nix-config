{ pkgs, lib, isWSL, ... }: {
  config = lib.mkIf isWSL {
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/hyprland";
          user = "luca";
        };
        default_session = initial_session;
      };
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
