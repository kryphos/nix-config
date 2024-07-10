{ ... }: {
  users.users = {
    "luca" = {
      isNormalUser = true;
      home = "/home/luca";
      shell = "/bin/zsh";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
