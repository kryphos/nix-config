{ pkgs, ... }: {
  users.users = {
    "luca" = {
      isNormalUser = true;
      home = "/home/luca";
      shell = "${pkgs.zsh}/bin/zsh";
      password = "test";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
