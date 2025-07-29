{pkgs, ...}:
{
  programs.zathura = {
    enable = true;
  };

  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    # "application/pdf" = "zathura.desktop";
    "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
  };
}