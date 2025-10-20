{ pkgs, ... }:
{
  services.dnscrypt-proxy = {
    enable = true;
    # Settings reference:
    # https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
    settings = {
      ipv6_servers = true;
      ipv4_servers = true;
      listen_addresses = [
        "127.0.0.1:53"
        "[::1]:53"
      ];
      require_dnssec = true;

      cache = true;
      cache_size = 8192;
      cache_min_ttl = 600;
      cache_max_ttl = 86400;
      # Add this to test if dnscrypt-proxy is actually used to resolve DNS requests
      # query_log.file = "/var/log/dnscrypt-proxy/query.log";
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
      sources.relays = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md"
          "https://download.dnscrypt.info/resolvers-list/v3/relays.md"
        ];
        cache_file = "relays.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        refresh_delay = 73;
        prefix = "";
      };
      anonymized_dns = {
        routes = [
          {
            server_name = "quad9-dnscrypt-ip4-filter-ecs-pri";
            via = [
              "anon-cs-ro"
              "anon-cs-de"
            ];
          }
          {
            server_name = "cloudflare-security";
            via = [
              "anon-cs-ro"
              "anon-cs-de"
            ];
          }
          {
            server_name = "google";
            via = [
              "anon-cs-ro"
              "anon-cs-de"
              "cloudflare-security"
            ];
          }
        ];
      };

      # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      server_names = [
        "quad9-dnscrypt-ip4-filter-ecs-pri"
        "google"
      ];
    };
  };

  environment.systemPackages = [ pkgs.dnscrypt-proxy ];
}
