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
      mission-center
      distrobox
      localsend
      fastfetch
      brave
    ];
    programs.chromium.enable = true;
  };
}
