{ config, pkgs, ... }:
let
  mkMultiRes =
    name: sizes:
    pkgs.writeText "${name}.xml" ''
      <background>
        <static>
          <duration>8640000.0</duration>
          <file>
            ${builtins.concatStringsSep "\n            " (
              map (s: ''<size width="${toString s.w}" height="${toString s.h}">${s.path}</size>'') sizes
            )}
          </file>
        </static>
      </background>
    '';

  # multi-resolution wallpapers
  johnnyJoestarMultiRes = mkMultiRes "johnny-joestar-sbr-multi" [
    {
      w = 1920;
      h = 1080;
      path = "${config.home.homeDirectory}/Pictures/Wallpapers/johnny-joestar-sbr/16x9.png";
    }
    {
      w = 1920;
      h = 1200;
      path = "${config.home.homeDirectory}/Pictures/Wallpapers/johnny-joestar-sbr/16x10.png";
    }
  ];

  fy22Turtlewallpaper = mkMultiRes "fy22-turtlewallpaper-multi" [
    {
      w = 1920;
      h = 1080;
      path = "${config.home.homeDirectory}/Pictures/Wallpapers/fy22-turtlewallpaper/16x9.png";
    }
    {
      w = 1920;
      h = 1200;
      path = "${config.home.homeDirectory}/Pictures/Wallpapers/fy22-turtlewallpaper/16x10.png";
    }
  ];
in
{
  xdg.dataFile."gnome-background-properties/wallpapers.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
    	<wallpaper deleted="false">
    		<name>Pablo Red Panda</name>
    		<filename>${config.home.homeDirectory}/Pictures/Wallpapers/pablo.jpg</filename>
    		<options>zoom</options>
    		<shade_type>solid</shade_type>
    		<pcolor>#ffffff</pcolor>
    		<scolor>#000000</scolor>
    	</wallpaper>
      
      <wallpaper deleted="false">
    		<name>Grace Over Adrien</name>
    		<filename>${config.home.homeDirectory}/Pictures/Wallpapers/grace-over-adrien.png</filename>
    		<options>zoom</options>
    		<shade_type>solid</shade_type>
    		<pcolor>#ffffff</pcolor>
    		<scolor>#000000</scolor>
    	</wallpaper>

      <wallpaper deleted="false">
    		<name>Mojave</name>
    		<filename>${config.home.homeDirectory}/Pictures/Wallpapers/mojave.png</filename>
    		<options>zoom</options>
    		<shade_type>solid</shade_type>
    		<pcolor>#ffffff</pcolor>
    		<scolor>#000000</scolor>
    	</wallpaper>

      <wallpaper deleted="false">
    		<name>Whale Shark</name>
    		<filename>${config.home.homeDirectory}/Pictures/Wallpapers/whale-shark-desktop.jpg</filename>
    		<options>zoom</options>
    		<shade_type>solid</shade_type>
    		<pcolor>#ffffff</pcolor>
    		<scolor>#000000</scolor>
    	</wallpaper>

      <!-- Multi-aspect wallpapers -->

      <wallpaper deleted="false">
        <name>Johnny Joestar SBR</name>
        <filename>${johnnyJoestarMultiRes}</filename>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#ffffff</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>

      <wallpaper deleted="false">
        <name>FY22 Turtle Wallpaper</name>
        <filename>${fy22Turtlewallpaper}</filename>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#ffffff</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>

    </wallpapers>
  '';
}
