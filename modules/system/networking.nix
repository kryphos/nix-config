{ ... }: {
  services.openssh.enable = true;

  networking = {
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [ 53 ];
    };
    wireless.networks = { testWLAN = { psk = "31415926"; }; };
  };
}
