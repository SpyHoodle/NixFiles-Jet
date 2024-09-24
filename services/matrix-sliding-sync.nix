{ config, domains, ... }:

{
  services.matrix-sliding-sync = {
    enable = true;
    createDatabase = true;
    environmentFile = "${config.age.secrets.matrix-sliding-sync.path}";
    settings = {
      SYNCV3_SERVER = "https://${domains.root}";
      SYNCV3_BINDADDR = "[::1]:8010";
    };
  };
}