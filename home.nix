{ config, pkgs, ... }:

{

  imports = [
    ./programs/fastfetch.nix
    ./programs/ghostty.nix
    ./programs/dconf.nix
  ];

  home.file.".background-image".source = ./pablo.jpg;
  home.stateVersion = "26.05";
  home.sessionVariables = {
    TERMINAL = "ghostty";
  };

  # -------
  #  PKGS
  # -------

  home.packages = with pkgs; [
    ghostty
    fastfetch
    spotify
    vscodium
    gh

    # Gnome Extensions
    gnomeExtensions.compiz-alike-magic-lamp-effect
    gnomeExtensions.dash2dock-lite
    gnomeExtensions.blur-my-shell
    whitesur-icon-theme
  ];

  # -------
  # Configs
  # -------

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
