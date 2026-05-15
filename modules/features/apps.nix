{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      btop-rocm
      ripgrep
      fzf
      duf
      tree
      bat
      bitwarden-desktop
      mission-center
      localsend
      fastfetch
      jujutsu
    ];
  };
}
