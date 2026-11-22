{ pkgs, ... }: {
  home.packages = with pkgs; [
    ghostty
    fastfetch
    spotify
    vscodium
    gh
    btop
    mullvad-vpn
    rnote
    bun
    musescore
    rawtherapee
    anki
    prismlauncher
    steam

    # Gnome Extensions
    gnomeExtensions.compiz-alike-magic-lamp-effect
    gnomeExtensions.multi-monitor-bar
    gnomeExtensions.dash2dock-lite
    gnomeExtensions.blur-my-shell
    gnomeExtensions.color-picker
    gnomeExtensions.logo-menu
    gnomeExtensions.copyous
    whitesur-icon-theme
  ];
}
