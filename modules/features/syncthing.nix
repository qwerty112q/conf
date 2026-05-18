{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.syncthing = {pkgs, ...}: {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "sock";
      dataDir = "/home/sock/syncthing";
      configDir = "/home/sock/.config/syncthing";
    };
  };
}
