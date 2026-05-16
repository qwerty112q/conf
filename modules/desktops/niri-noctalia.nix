{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri-noctalia = {pkgs, ...}: {
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

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      wl-clipboard
      noctalia-shell

      kitty
    ];
  };
}
