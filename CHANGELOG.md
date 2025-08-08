# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Added pastel, removed warp
- Added git town

### Changed

- Fff removed
- Typer python package globally
- Python package rich added globally
- Gnome removed

### Fixed

- Fixme added for rofi
- Starship shows git town pending status now
- Fix conservative mode, added portals, some vscode profiles, removed wyoming services and guake

## [1.1.0] - 2025-08-05

### Added

- Added unsafe for films.
- Adding libreoffice and blackbox terminal emulator (1/n)
- Added exa alias for shells
- Added a note: in the process of refactoring
- Added wtype to clipse
- Added some new hyprland plugins
- Added pwa support for firefox

### Changed

- Power-not-okay, but stable
- Lets try nixos-hardware (1/n)
- Lets try nixos-hardware (1/n) CORRECTED
- Lets try nixos-hardware (2/n)
- Lets try nixos-hardware (4/n) FINE
- Battery drain solved
- Working copy and some stuff
- Battery drain (2/n) [not installed auto-cpufreq for some reason]
- Lenovo conservation mode / battery limit (1/n)
- Pre starship save
- Starship config [1/n]
- Neovim, popos shell installed
- Not working.. transition to FLAKE.nix started. Broken: exa -> eza, fonts config renaimed. Should not use: --impure, config.nix should
- Generated flake.lock
- Applied standard template by Misterio77
- Starship fix
- Old-system conf deleted
- Flake.lock added
- Exported packages in package_list
- Packages list introduced (fixed)
- Save
- NOT GOOD: eza introduce, update satrted
- Latest working
- Working
- Language servers added and laptop keyboard lightning moved here
- New shell: zsh
- Z enabled, kernel updated
- 1968 port exported and media controls gnome extension added
- Commented out macos vm try
- Effect cinema middle added
- Working-mess
- Version 1.6.6
- Systemd-boot ==> GRUB
- NOT GOOD: eza introduce, update satrted
- Version update
- Errors before migrating to 24.11
- Pretty much workinbg cool system
- Working ulauncher calculator
- Problem I think solved (suspend hell)
- Works now with wifi card error on resume after suspend, but noting really breaking
- Home-manager enabled
- Before home-manager configure
- Saved a lot of settings into home-manager, still a lot to go
- Emoji-copy moved into home-manager
- Keyboard settings added to home.nix
- Wayland option deleted
- Ollama config file added (disabled for now)
- Moved some config into home-manager and moved imports from flake.nix into home.nix
- Moving configs to home manager and splitting up config into separate files
- Refactored a bit
- Wayland enabled for gdm
- Vscode extension added and some packages moved from system to homemanager
- Fhs command added to drop into fhs env and starship indicator too
- Moved gnome extensions into home-manager option
- Gnome extensions back to packages
- Wayland hyprland spec and wayland session variable for electron apps
- Idk why is home-manager ignoring file changes
- Working stage, after fatal store destruction by switch crash
- Idleing, keyboiard backlight, language switching working right now
- Hyprland environment setup things
- A lot
- Configuring things around
- Some styiling
- Agenix input added, ssh config moved to home-manager (partly)
- Nix fmt
- Minor comments
- Moved modules in the proper module folder
- Moved keyboard rgb control to separate project, home-manager is now under nixosSystem, and some minimal config changes in th process
- Creating module structure 1
- Creating module structure 2
- Creating module structure 3
- Bootloader and kernel params moved into new module structure
- Display-managers moved to new modules
- Creating module structure 4
- Users and groups moved to new module
- Firewall module for now
- Creating module structure 5
- Niri added, waybar refactored, screen config added
- Modularization of hyprland config (a lot)
- More restructuring
- Creating module structure 6
- Zsh arrows fixed in kitty and bash autocompletion and zoxide as home-manager module
- Creating module structure 7
- Wofi, nixvim, some import fixes, ...
- Hyprlock updated
- Agenix fixed, some nvim improvements, hyprlock small change
- Clipse keepfocus, nvim plugins
- Nixvim is now a flake output too
- Nixvim plugins
- Started creating jupyter notebook for julia
- Wofi settings, zen browser, pip, autin, ...
- Waybar, wofi, window rules hyprland, nixvim plugins, ...
- Virtualization things
- Basic environment setup for wsl
- Hyprland works (trying to update)
- Moved to unstable
- Small estethics and bugfixes
- Input-leap added
- Making it modulare
- Options renamed
- Making it modulare 2
- Making it modulare 3 [mainly home-managr]
- Making it modulare 4 [mainly home-manager]
- Making it modulare 5 [python, removed jdt lsp]
- Making it modulare 6
- Making it modulare 7
- Element matrix client and zen shortcut
- Merge branch 'main' into wsl
- Wsl config merging
- I dont know
- Zen update
- Hyprspace added
- Updated DEPRECATED KEYS
- Styling waybar
- Waybar changes (added soundcloud)
- Hyprland binds and gtk icon try
- Hyprscrolling half configured and pnpm added
- Vscode profiles added for quarkus and svelte
- External monitor handling and uwsm related improvements
- Vscode profiles for svelte and quarkus
- Web stacks added (in someway)
- Permisisons enabled in hyprland
- Nvidia open drivers and powermanagement (hypr wiki suggestion)
- Warp terminal installed
- Hyprctl plugin permisison added
- Special workspaces
- Easymotion hyprland plugin fail
- Ashell added, some plugins tried, jetbrains from unstable
- Ahell config changes
- Anythingllm-not working (prisma env needs investigation)
- Wofi extra scripts, and lots of styling, hyprpicker, iwd tries
- Wofi scripting improvements (half done)
- Superfile, python vscode profile added. pip icon in waybar and some half scripts
- Vscode python profile fix, btop fix
- Quick-actions added
- Whisper cuda commented out, new workspace bindings, monitor position update
- Fastfetch and hyprland keybinds
- Yazi added, hyprspace input update, permissions added, tex removed, unicode character picker started
- Yazi integrations enbaled (yy)
- Pavucontrol added
- Ulauncher removed
- Fastfetch updated
- Waybar ricing
- Updated qt and gtk themes
- Moved to orchis gtk theme
- Quikshell added, zathura added
- Rofi added, tesseract added, yazi fixed broken config
- Tldr replaced with tealdeer
- Rofi changes added
- Wyoming thingies, anki, git extensions, asciinema, default drun wofi->rofi
- Lot of untracked from before
- Revert "feat: lot of untracked from before"
- Lot of untracked from before
- Zathura moved under pdf
- Glow md viewer added

### Fixed

- Fixes with unstable branches (some packages switched to stable + 1 hash override)

### Removed

- Removed some Gnome default apps.

[unreleased]: https://github.com/leswell/nixos-flake/compare/v1.1.0..HEAD

<!-- generated by git-cliff -->
