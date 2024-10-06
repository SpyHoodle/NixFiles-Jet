{ domains, ... }:

{
  services.gitea = {
    enable = true;
    appName = "Archives";
    
    settings.service = {
      DISABLE_REGISTRATION = true;
      ENABLE_CAPTCHA = false;
      REQUIRE_SIGNIN_VIEW = false;
      DEFAULT_KEEP_EMAIL_PRIVATE = false;
      DEFAULT_ENABLE_TIMETRACKING = true;
    };
    settings.server = {
      DOMAIN = "${domains.git}";
      ROOT_URL = "https://${domains.git}/";
      HTTP_PORT = 3002;
      SSH_DOMAIN = "${domains.ssh}";
      DISABLE_SSH = false;
      OFFLINE_MODE = false;
    };
    settings."repository.pull-request".DEFAULT_MERGE_STYLE = "merge";
    settings."repository.signing".DEFAULT_TRUST_MODEL = "committer";
  };

  services.nginx.virtualHosts."${domains.git}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://localhost:3002";
    };
  };
}
