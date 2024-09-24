{ config, pkgs, domains, ... }:

{
  services.matrix-synapse = {
    enable = true;
    withJemalloc = true;
    extras = [ "oidc" ];

    settings = {
      # General settings
      server_name = "${domains.root}";
      public_baseurl = "https://${domains.root}";
      enable_registration = false;
      max_upload_size = "100M";
      presence.enabled = true;
      auto_join_rooms = [ "#general:${domains.root}" "#announcements:${domains.root}" ];
      database = {
        name = "psycopg2";
        allow_unsafe_locale = true;
      };

      # Performance
      caches = {
        global_factor = 2.0;   
      };
      limit_remote_rooms = {
        enabled = true;
        complexity = 5.0;
        complexity_error = "This room is too complex for the server to handle, and you have been blocked from joining.";
      };

      # Messages from the server
      server_notices = {
        system_mxid_display_name = "Server";
        system_mxid_localpart = "server";
        system_mxid_avatar_url = "mxc://${domains.root}/yLgywrxwQkdHpWAnICJGmJjs";
        room_name = "Server Notice";
        room_avatar_url = "mxc://${domains.root}/ImyaGvtWLaPtacVEQWcDiEoC";
        auto_join = false;
      };
    };

    # Listeners
    settings.listeners = [{ 
      bind_addresses = [ "::1" ];
      port = 8008;
      type = "http";
      tls = false;
      x_forwarded = true;
      resources = [{
        names = [ "client" "federation" ];
        compress = true;
      }];
    }];
    # Experimental features and secrets
    extraConfigFiles = [ config.age.secrets.matrix-synapse.path ];
  };

  # Ensure a PostgreSQL database for synapse
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "matrix-synapse" ];
    ensureUsers = [ { name = "matrix-synapse"; ensureDBOwnership = true; } ];
  };

  # Increase the file descriptor limit for synapse
  systemd.services.matrix-synapse.serviceConfig.LimitNOFILE = 20000;

  # Authlib is required for OIDC support
  environment.systemPackages = with pkgs; [ python312Packages.authlib ];
}

