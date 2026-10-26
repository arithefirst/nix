{ pkgs, config, ... }:
{
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
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
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

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        binding = "<Super>v";
        command = "gdbus call --session --dest org.gnome.Shell.Extensions.Copyous --object-path /org/gnome/Shell/Extensions/Copyous --method org.gnome.Shell.Extensions.Copyous.Toggle";
        name = "Open Clipboard";
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>c" ];
      };

      "org/gnome/shell/keybindings" = {
        show-screenshot-ui = [
          "<Super><Shift>s"
          "Print"
        ];

        toggle-message-tray = [ "<Super>m" ];
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
          pkgs.gnomeExtensions.copyous.extensionUuid
        ];
      };

      "org/gnome/desktop/interface" = {
        icon-theme = "WhiteSur";
        clock-format = "12h";
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

      "org/gnome/shell/extensions/copyous" = {
        auto-hide-search = true;
        clipboard-margin-bottom = 5;
        clipboard-margin-left = 5;
        clipboard-margin-right = 5;
        clipboard-margin-top = 5;
        clipboard-orientation = "horizontal";
        clipboard-position-horizontal = "fill";
        clipboard-position-vertical = "top";
        clipboard-size = 500;
        database-backend = "sqlite";
        disable-hljs-dialog = false;
        dynamic-item-height = false;
        file-preview-visibility = "file-preview-or-file-info";
        header-controls-visibility = "visible-on-hover";
        history-length = 100;
        item-height = 170;
        item-width = 250;
        link-preview-orientation = "vertical";
        open-clipboard-dialog-shortcut = [ "<Super>v" ];
        show-at-pointer = false;
        show-header = true;
        show-indicator = false;
        show-item-title = true;
        tab-width = 2;
        wiggle-indicator = false;
      };

      "org/gnome/shell/extensions/copyous/character-item" = {
        max-characters = 1;
        show-unicode = true;
      };

      "org/gnome/shell/extensions/copyous/code-item" = {
        show-line-numbers = true;
        syntax-highlighting = true;
        show-code-info = true;
      };

      "org/gnome/shell/extensions/copyous/file-item" = {
        file-preview-visibility = "file-preview-or-file-info";
        show-line-numbers = true;
        syntax-highlighting = true;
      };

      "org/gnome/shell/extensions/copyous/image-item" = {
        show-image-info = false;
      };

      "org/gnome/shell/extensions/copyous/link-item" = {
        link-preview-orientation = "vertical";
      };

      "org/gnome/shell/extensions/copyous/text-item" = {
        show-text-info = true;
      };

      "org/gnome/shell/extensions/copyous/theme" = {
        theme = "default";
      };
    };
  };
}