{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.flatpak = {pkgs, ...}: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];
    services.flatpak = {
      enable = true;
      uninstallUnmanaged = true;
      update.auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
      };
      packages = [
        "com.github.tchx84.Flatseal"
        "org.keepassxc.KeePassXC"
        "it.mijorus.gearlever"
      ];
    };
  };
}
