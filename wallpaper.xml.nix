{
  config,
  pkgs,
  lib,
  ...
}:

let
  wallpaperDir = ./wallpapers;

  dirContents = builtins.readDir wallpaperDir;
  generateWallpaperXml =
    name: type:
    let
      ext = lib.last (lib.splitString "." name);
      isImage = lib.elem ext [
        "jpg"
        "jpeg"
        "png"
        "webp"
        "svg"
      ];
    in
    if type == "regular" && isImage then
      ''
        <wallpaper deleted="false">
          <name>${lib.strings.removeSuffix ".${ext}" name}</name>
          <filename>${config.home.homeDirectory}/Pictures/Wallpapers/${name}</filename>
          <options>zoom</options>
          <shade_type>solid</shade_type>
          <pcolor>#ffffff</pcolor>
          <scolor>#000000</scolor>
        </wallpaper>
      ''
    else
      "";

  xmlEntries = lib.mapAttrsToList generateWallpaperXml dirContents;
  combinedXmlEntries = lib.strings.concatStringsSep "\n" xmlEntries;

in
{
  home.file.".local/share/gnome-background-properties/my-custom-wallpapers.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
    ${combinedXmlEntries}
    </wallpapers>
  '';
}