{pkgs, ...}:
{
  programs.zathura = {
    enable = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # "application/pdf" = "zathura.desktop";
      "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";

      "x-scheme-handler/http" = "userapp-Zen-EBBR22.desktop";
      "x-scheme-handler/https" = "userapp-Zen-EBBR22.desktop";
      "x-scheme-handler/chrome" = "userapp-Zen-EBBR22.desktop";
      "text/html"="userapp-Zen-EBBR22.desktop";
      "application/x-extension-htm" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-html" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-shtml" = "userapp-Zen-EBBR22.desktop";
      "application/xhtml+xml" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-xhtml" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-xht" = "userapp-Zen-EBBR22.desktop";

    };
    associations.added = {
      "x-scheme-handler/http" = "userapp-Zen-EBBR22.desktop";
      "x-scheme-handler/https" = "userapp-Zen-EBBR22.desktop";
      "x-scheme-handler/chrome" = "userapp-Zen-EBBR22.desktop";
      "text/html" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-htm" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-html" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-shtml" = "userapp-Zen-EBBR22.desktop";
      "application/xhtml+xml" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-xhtml" = "userapp-Zen-EBBR22.desktop";
      "application/x-extension-xht" = "userapp-Zen-EBBR22.desktop";
    };
  };
}