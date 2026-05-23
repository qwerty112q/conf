{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      hardware
      system
    ];
  };
  flake.nixosModules.system = {pkgs, ...}: {
    imports = with self.nixosModules; [
      flatpak
      gaming
      fonts
      ssh
      nvf
      apps
      syncthing
      distrobox
      # waydroid
      plasma
    ];
    boot = {
      loader = {
        timeout = 0;
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_zen;
      kernelModules = [
        "ntsync"
      ];
      kernelParams = [
        "quiet"
        "splash"
      ];
    };
    networking = {
      hostName = "nixos";
      networkmanager.enable = true;
      firewall.enable = false;
      nftables.enable = true;
    };
    time.timeZone = "Asia/Bangkok";
    i18n.defaultLocale = "en_US.UTF-8";
    zramSwap.enable = true;
    hardware = {
      graphics.enable = true;
      graphics.enable32Bit = true;
      i2c.enable = true;
      bluetooth.enable = true;
    };
    services = {
      power-profiles-daemon.enable = true;
      upower.enable = true;
    };
    programs.appimage = {
      binfmt = true;
      enable = true;
    };
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
    programs.git = {
      enable = true;
      config = {
        user = {
          name = "buh112q";
          email = "lnwpoom.zaa123@gmail.com";
        };
      };
    };
    programs.starship.enable = true;
    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
    users.users.sock = {
      shell = pkgs.fish;
      isNormalUser = true;
      packages = with pkgs; [];
      extraGroups = [
        "wheel"
        "networkmanager"
        "gamemode"
        "podman"
      ];
    };
    environment.systemPackages = with pkgs; [
      micro
      vim
    ];
    nixpkgs.config = {
      allowUnfree = true;
    };
    system.stateVersion = "25.11";
    nix = {
      channel.enable = false;
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      registry.nixpkgs.flake = inputs.nixpkgs;
      settings.experimental-features = ["nix-command" "flakes"];
    };
  };
}
