{ config, pkgs, ... }:

{

  imports = [
    ./programs/fastfetch.nix
    ./programs/ghostty.nix
    ./programs/dconf.nix
    ./wallpaper.xml.nix
  ];

  home.stateVersion = "26.05";
  home.sessionVariables = {
    TERMINAL = "ghostty";
  };

  home.file."Pictures/Wallpapers".source = 
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/wallpapers";

  # -------
  #  PKGS
  # -------

  home.packages = with pkgs; [
    ghostty
    fastfetch
    spotify
    vscodium
    gh
    btop

    # Gnome Extensions
    gnomeExtensions.compiz-alike-magic-lamp-effect
    gnomeExtensions.dash2dock-lite
    gnomeExtensions.blur-my-shell
    gnomeExtensions.logo-menu
    whitesur-icon-theme
  ];

  # -------
  # Configs
  # -------

  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };

  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "April Hall";
          email = "ari@arithefirst.com";
        };
        core = {
          editor = "nvim";
        };
      };
    };

    # Make sure home manager is enabled
    home-manager.enable = true;
  };


  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "com.mitchellh.ghostty.desktop" ];
  };
}
