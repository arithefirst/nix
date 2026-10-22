{ pkgs, config, ... }: {
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

      "org/gnome/shell/keybindings" = {
        show-screenshot-ui = [ "<Super><Shift>s" ];
      };

      # Extensions & Icons

      "org/gnome/shell" = {
        disable-user-extensions = false;
        always-show-log-out = true;
        enabled-extensions = [
          pkgs.gnomeExtensions.compiz-alike-magic-lamp-effect.extensionUuid
          pkgs.gnomeExtensions.dash2dock-lite.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.logo-menu.extensionUuid
        ];
      };

      "org/gnome/desktop/interface" = {
        icon-theme = "WhiteSur";
      };

      "org/gnome/shell/extensions/Logo-menu" = {
        menu-button-icon-click-type = 2;
        menu-button-icon-image = 23;
        menu-button-icon-size = 20;
        menu-button-terminal = "ghostty";
        hide-forcequit = true;
        hide-icon-shadow = true;
        menu-button-system-monitor = "ghostty -e btop";
        hide-softwarecentre = false;
        menu-button-software-center = "firefox 'https://search.nixos.org/packages'";
      };

      "org/gnome/shell/extensions/dash2dock-lite" = {
        apps-icon = false;
        animation-magnify = 0.25;
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
        animation-fps = 1;
        overview-transparent-background = true;
      };
    };
  };
}