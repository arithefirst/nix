{ config, pkgs, ... }:

{

  imports = [
    # Program Configs
    ./programs/fastfetch.nix
    ./programs/ghostty.nix

    # Other Configs
    ./configs/dconf.nix
    ./configs/wallpaper.xml.nix
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


  xdg = {
    terminal-exec = {
      enable = true;
      settings.default = [ "com.mitchellh.ghostty.desktop" ];
    };

    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/Desktop";
      download = "${config.home.homeDirectory}/Downloads";
      templates = "${config.home.homeDirectory}/Templates";
      publicShare = "${config.home.homeDirectory}/Public";
      documents = "${config.home.homeDirectory}/Documents";
      music = "${config.home.homeDirectory}/Music";
      videos = "${config.home.homeDirectory}/Videos";
      projects = "${config.home.homeDirectory}/Projects";
      pictures = "${config.home.homeDirectory}/Pictures";
    };
  };
}
