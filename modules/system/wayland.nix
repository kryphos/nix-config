{ pkgs, ... }: {
  services.displayManager = {
    enable = true;
    defaultSession = "hyprland";
  };

  systemd.services.lemurs = {
    enable = true;
    description = "Lemurs";
    after = [
      "systemd-user-sessions.service"
      "plymouth-quit-wait.service"
      "getty@tty2.service"
    ];
    unitConfig = {
      Type = "idle";
      StandardInput = "tty";
      TTYPath = "/dev/tty2";
      TTYReset = "yes";
      TTYVHangup = "yes";
    };
    serviceConfig = { ExecStart = "/run/current-system/sw/bin/lemurs"; };
    aliases = [ "display-manager.service" ];
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
