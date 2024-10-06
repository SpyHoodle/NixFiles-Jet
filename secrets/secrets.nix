let
  maddie = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM/JUhEuZSj+IOMfAZAylMKn4777ZOWd42mpbjtK8bBI";
  users = [ maddie ];

  jet = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIWnR8FAEd92HpCtdo2E0oK+aZJz7JC08hAdzmzCZlTN";
  systems = [ jet ];
in
{
  "matrix-authentication-service.age".publicKeys = users ++ systems;
  "matrix-sliding-sync.age".publicKeys = users ++ systems;
  "matrix-synapse.age".publicKeys = users ++ systems;
  "mjolnir.age".publicKeys = users ++ systems;
  "tailscale.age".publicKeys = users ++ systems;
  "syncplay.age".publicKeys = users ++ systems;
  "silverbullet.age".publicKeys = users ++ systems;
}
