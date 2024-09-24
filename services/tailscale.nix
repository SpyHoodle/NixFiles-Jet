{ config, pkgs, ... }:

{
  clicks.networking.tailscale = {
    enable = true;
    authKeyFile = "${config.age.secrets.tailscale.path}";
  };
  services.tailscale.extraUpFlags = [ "--hostname=jet" ];
}
