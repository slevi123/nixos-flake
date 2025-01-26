{pkgs, ...} : {
    home.packages = with pkgs; [ 
        firefox

        ## gnome extensions
    ] ++ (with pkgs.gnomeExtensions; [
        emoji-copy
        autohide-battery
        # caffeine
        burn-my-windows
        # bubblemail
        xwayland-indicator

        media-controls
        blur-my-shell
        clipboard-history
        # gnomeExtensions.noannoyance-2
        
        # system-monitor
        astra-monitor

        # pop-shell  # buggy, shortcuts not working
        # forge

        # gnomeExtensions.gsconnect  # not working
        # switcher # I got ulauncher

        # power-profile-switcher
        # power-profile-indicator  # not compatible

        # ideapad
        # ideapad-controls # may try in future

        #thinkpad-battery-threshold  # not this platform
        # gnome.gpaste # not working
        
        # auto-cpufreq # not installing
        # cpufreq
    ]);
}