{
  self,
  inputs,
  ...
}: {
    flake.nixosModules.plasma = {pkgs, ...}: {
      services.displayManager = {
        plasma-login-manager.enable = true;
        autoLogin.user = "sock";
      };   
      services.desktopManager.plasma6.enable = true;
      environment.plasma6.excludePackages = with pkgs.kdePackages; [];
    };
  };
}
