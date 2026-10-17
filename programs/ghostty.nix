{pkgs, ...}: {
  programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        # Colors
        theme = "Catppuccin Mocha";
        background = "1e1e2e";
        background-opacity = 0.75;
        palette = [
          "5=cba6f7"
          "13=cba6f7"
        ];

        # Padding
        window-padding-color = "extend";
        window-padding-balance = true;
        window-padding-x = 10;
        window-padding-y = 5;

        # font
        font-family = "Fira Code";

        # window decorations
        window-decoration = "client";
        window-theme = "ghostty";
        adw-toolbar-style = "raised";
        gtk-wide-tabs = true;

        # shell integration
        shell-integration-features = "no-cursor";
        cursor-style = "bar";
        gtk-single-instance = true;

        keybind = [
          "ctrl+shift+)=new_split:right"
          "ctrl+shift+(=new_split:left"
        ];
      };
    };
}