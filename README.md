# Nix

April Hall's beautiful NixOS config

## Conventional Commits Definitions

- `feat`: The commit adds a feature that was not available or not enabled previously.
- `fix`:  The Commit changes, adjusts, or fixes any part of the config without adding a new feature.
- `style`: Just formats something or changes code style
- `pkgs`: The commit only modifies the packages installed on the system.
- `wall`: The commit only adds new wallpapers to the `./wallpapers/` directory.
- `gh`: The commit adds or changes code that only affects the GitHub repository for the config, and not the config itself.
  
> [!NOTE]
> A `feat` or a `fix` may change the packages installed on the system, but doesn't have to.

## Adding a New Machine

To add a new machine, follow the guide below:

1. Clone this repository on the new machine by running 

    ```sh
    git clone https://github.com/arithefirst/nix
    ```

2. Change the name of the folder to nixos-config by running 

    ```sh
    mv ~/nix ~/nixos-config
    ```

3. Create a new directory in the `hosts` folder with the desired hostname of the new machine.

    3a. Then, generate a hardware config (`nixos-generate-config`) and move it into the folder. 
    
    3b. Create a file in that folder called `default.nix` and enter the following information into it:

    ```nix
    { ... }: {
        imports = [
            ./hardware-configuration.nix
        ];

        networking.hostName = "your-hostname-here";
    }
    ```
4. Create a new entry under `nixosConfigurations` in `flake.nix`. It should look something like this:

    ```nix
    your-hostname-here = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
            ./configuration.nix
            ./hosts/your-hostname-here
            sharedHomeManager
        ];
    };
    ```

5. Rebuild on the new flake:
   ```sh
   sudo nixos-rebuild switch --flake ~/nixos-config/#your-hostname-here
   ```