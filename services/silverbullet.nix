{ config, domains, ... }:

{
  services.silverbullet = {
    enable = true;
    envFile = config.age.secrets.silverbullet.path;
  };

  services.nginx.virtualHosts."${domains.notes}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://localhost:3000";
    };
  };
}
