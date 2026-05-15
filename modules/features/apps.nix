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
      (discord-canary.override {
        withOpenASAR = true;
        withVencord = true;
      })
      mission-center
      localsend
      fastfetch
      jujutsu
    ];
  };
}
