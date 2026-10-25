# Toolpath for a Mac without home-manager: the theme folder lands at
# /etc/livery/toolpath, a fixed path that dotfiles managed elsewhere (chezmoi
# on scriptshade) point at. Livery owns the assets; the dotfiles own only
# which file each tool reads.
{ config, lib, ... }:
{
  options.livery.toolpath.enable = lib.mkEnableOption "the Toolpath theme files at /etc/livery/toolpath";

  config = lib.mkIf config.livery.toolpath.enable {
    # builtins.path copies the folder into its own store path. A bare
    # ../themes/toolpath points inside livery's flake source, which
    # Determinate Nix's lazy trees never write to disk, so the /etc link
    # dangled and activation stopped with "ln: ... File exists".
    environment.etc."livery/toolpath".source = builtins.path {
      path = ../themes/toolpath;
      name = "livery-toolpath";
    };
  };
}
