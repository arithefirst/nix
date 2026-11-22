{ ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  ## Nvidia Config

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  networking.hostName = "nixos-desktop";
}
