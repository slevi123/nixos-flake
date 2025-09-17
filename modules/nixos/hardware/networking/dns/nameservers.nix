{ ... }:
{
  # networking.nameservers = [
  #   "1.1.1.1" # Cloudflare
  #   "9.9.9.9" # Quad9
  #   "8.8.8.8" # google
  # ];
  networking.nameservers = [ "127.0.0.1" "::1" ]; # Use your local DNS proxy's address
}