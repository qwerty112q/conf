{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.distrobox = {pkgs, ...}: {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
    environment.systemPackages = [pkgs.distrobox];
  };
}
