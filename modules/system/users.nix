{ ... }: {
  users.users = {
    "luca" = {
      isNormalUser = true;
      home = "/home/luca";
      shell = "/bin/zsh";
      password = "test";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
