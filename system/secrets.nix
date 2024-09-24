{ config, pkgs, ... }:

{
  age.secrets = {
    matrix-synapse = {
      file = ../secrets/matrix-synapse.age;
      owner = "matrix-synapse";
      group = "matrix-synapse";
    };
    matrix-authentication-service = {
      file = ../secrets/matrix-authentication-service.age;
      owner = "matrix-authentication-service";
      group = "matrix-authentication-service";
    };
    matrix-sliding-sync = {
      file = ../secrets/matrix-sliding-sync.age;
    };
    mjolnir = {
      file = ../secrets/mjolnir.age;
      owner = "mjolnir";
      group = "mjolnir";
    };
    syncplay = {
      file = ../secrets/syncplay.age;
    };
    tailscale = {
      file = ../secrets/tailscale.age;
    };
  };
}
