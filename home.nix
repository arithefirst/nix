{ config, pkgs, ... }:

{

  imports = [
    ./programs/fastfetch.nix
    ./programs/ghostty.nix
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

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };

      # Keybindings 

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "ghostty";
        name = "Open Terminal";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>e";
        command = "nautilus";
        name = "Open Files";
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>c" ];
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        always-show-log-out = true;
        enabled-extensions = [
          pkgs.gnomeExtensions.compiz-alike-magic-lamp-effect.extensionUuid
          pkgs.gnomeExtensions.dash2dock-lite.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        ];
      };

      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file://" + builtins.toPath config.home.homeDirectory + "/.background-image";
        picture-uri-dark = "file://" + builtins.toPath config.home.homeDirectory + "/.background-image";
      };

      "org/gnome/shell/extensions/dash2dock-lite" = {
        apps-icon = false;
        animation-magnify = 0.20;
        mounted-icon = true;
        trash-icon = true;
        border-thickness = 0;
        background-color = "(0.0, 0.0, 0.0, 0.0)";
        topbar-background-color = "(0.0, 0.0, 0.0, 0.0)";
        customize-topbar = true;
        running-indicator-size = 1;
        running-indicator-style = 1;
        blur-background = true;
        edge-distance = 0.45;
        autohide-dash = true;
        lamp-app-animation = true;
        separator-thickness = 1;
        separator-color = "(1.0, 1.0, 1.0, 0.6)";
      };
    };
  };
}
