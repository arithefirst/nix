{pkgs, ...}: {
  programs.fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

        logo = {
          type = "small";
          padding = {
            top = 2;
            left = 1;
            right = 2;
          };
        };

        display = {
          separator = "";
        };

        modules = [
          # Top of Box
          {
            key = "╭──────────╮";
            type = "custom";
            keyColor = "white";
          }
          {
            key = "│{#31}  user  {#white} │";
            type = "title";
            format = " {user-name}@{host-name}";
            keyColor = "white";
          }
          {
            key = "{#white}│{#38;2;250;179;135} 󰻀 distro {#white}│ ";
            type = "os";
            keyColor = "38;2;250;179;135";
          }
          {
            key = "│{#33} 󰘚 kernel {#white}│ ";
            type = "kernel";
            keyColor = "white";
          }
          {
            key = "│{#32}  term   {#white}│ ";
            type = "terminal";
            keyColor = "white";
          }
          {
            key = "│{#36}  uptime {#white}│ ";
            type = "uptime";
            keyColor = "white";
          }
          {
            key = "│{#34}  de/wm  {#white}│ ";
            type = "wm";
            keyColor = "white";
          }
          {
            key = "{#white}│{#38;2;203;166;247}  pkgs   {#white}│ ";
            type = "command";
            text = "echo \"$(nix-store --query --requisites /run/current-system | wc -l) (nix)\"";
            keyColor = "38;2;203;166;247";
          }
          # Colors separator
          {
            key = "├──────────┤";
            type = "custom";
            keyColor = "white";
          }
          {
            key = "{#white}│  colors │ ";
            symbol = "circle";
            type = "colors";
          }
          # Bottom of Box
          {
            key = "╰──────────╯";
            type = "custom";
            keyColor = "white";
          }
        ];

      };
    };
}