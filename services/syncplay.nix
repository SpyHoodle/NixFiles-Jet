{ config, ... }:

{
  services.syncplay = {
    enable = true;
    passwordFile = config.age.secrets.syncplay.path;
  };
}
