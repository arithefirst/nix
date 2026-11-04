{ pkgs, ... }: {
  programs.vscodium = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      userSettings = {
        "workbench.iconTheme" = "catppuccin-mocha";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "editor.formatOnSave" = true;
        "nix.enableLanguageServer" = true;
        "nix.formatterPath" = "nixfmt";
        "editor.fontFamily" = "'Fira Code', monospace";
        "editor.linkedEditing" = true;
      };

      extensions = with pkgs.vscode-extensions; [
        # Language Extensions
        svelte.svelte-vscode # Svelte
        jnoortheen.nix-ide # Nix
        bradlc.vscode-tailwindcss # Tailwind
        astro-build.astro-vscode # Astro
        unifiedjs.vscode-mdx # MDX Support (Mainly for astro)
        yzhang.markdown-all-in-one # Markdown

        # Functionality Extensions
        mhutchie.git-graph
        usernamehw.errorlens

        # Theme & Icons
        catppuccin.catppuccin-vsc-icons # Catppuccin icons
        catppuccin.catppuccin-vsc # Catppuccin theme
      ];
    };
  };
}
