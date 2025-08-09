{pkgs, ...}:
{
  home.packages = with pkgs; [
    qbittorrent
    # fragments # gnome circle torrent client
  ];
}