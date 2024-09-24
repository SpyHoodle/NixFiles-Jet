{ config, lib, ... }:

{
  services.postgresql = {
    enable = true;
    enableTCPIP = false;
  };
}
