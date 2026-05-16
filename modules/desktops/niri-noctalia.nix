{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri-noctalia = {pkgs, ...}: {
    # Keep your existing services
    services.displayManager = {
      ly.enable = true;
      defaultSession = "niri";
      autoLogin = {
        enable = true;
        user = "sock";
      };
    };
    programs.niri.enable = true;
    programs.dconf.enable = true;
    services.udisks2.enable = true;
    services.gvfs.enable = true;

    # --- ADD THIS FOR QT CONFIGURATION ---
    qt = {
      enable = true;
      platformTheme.name = "kvantum";
      style.name = "kvantum";
    };

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      wl-clipboard
      noctalia-shell
      nautilus
      kitty

      kdePackages.dolphin
      kdePackages.konsole
      kdePackages.qtsvg
      kdePackages.kio
      kdePackages.kio-fuse
      kdePackages.kio-extras

      # --- ADD THESE FOR THEMING & WAYLAND ---
      kdePackages.qtwayland # Enables native Wayland rendering for KDE/Qt apps
      kdePackages.qtstyleplugin-kvantum # The theme engine engine for Plasma 6 apps
      kdePackages.kdegraphics-thumbnailers # File previews for Dolphin
    ];

    # --- ADD THIS FOR WAYLAND VARIABLES ---
    environment.sessionVariables = {
      # Forces Qt apps to use Wayland natively, fallback to X11 if needed
      QT_QPA_PLATFORM = "wayland;xcb";
      # Prevents scaling issues on High-DPI screens
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };
  };
}
