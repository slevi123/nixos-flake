services.openvpn.servers = {
    client.config = ''
      client
      remote leswell.crabdance.com
      dev tun
      proto tcp-client
      port 80
      secret /home/leswell/.config/openvpn/rpi_static.key
    '';
}