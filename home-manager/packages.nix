{pkgs, ...} : {
    home.packages = with pkgs; [ 
        firefox

    ] ++ (with pkgs.gnomeExtensions; [
        clipboard-history
        astra-monitor
        media-controls
        emoji-copy
        blur-my-shell
        burn-my-windows
        autohide-battery
        # caffeine
        # bubblemail
        xwayland-indicator

        # gnomeExtensions.noannoyance-2
        
        # system-monitor

        # pop-shell  # buggy, shortcuts not working
        # forge

        # gnomeExtensions.gsconnect  # not working
        # switcher # I got ulauncher

        # power-profile-switcher
        # power-profile-indicator  # not compatible

        # ideapad
        # ideapad-controls # may try in future
        
        # auto-cpufreq # not installing
        # cpufreq
    ]);
}