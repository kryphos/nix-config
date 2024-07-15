{ ... }: {
  users.users = {
    "luca" = {
      isNormalUser = true;
      home = "/home/luca";
      shell = "/bin/zsh";
      password = "temp";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
