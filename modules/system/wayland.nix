{ lib, isWSL, ... }: {
  config = lib.mkIf isWSL {
    programs.ly.enable = true;
    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
