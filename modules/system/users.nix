{ ... }: {
  users.users = {
    "luca" = {
      isNormalUser = true;
      home = "/home/luca";
      password = "test";
      extraGroups = [ "wheel" "networkmanager" "docker" ];
    };
  };
}
