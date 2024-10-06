# server
> Simple and tidy configuration files for my homeserver.

## Explanation
The main use for the server is hosting a private matrix homeserver, by hosting [Synapse](https://github.com/element-hq/synapse), and [MAS](https://github.com/matrix-org/matrix-authentication-service).
A private [Gitea](https://github.com/go-gitea/gitea) instance is also hosted, for storing git repositories and mirrors.
The other service is a private [Syncplay](https://github.com/Syncplay/syncplay) server, which is great for playing media in sync between multiple parties.

Secrets are encrypted using [agenix](https://github.com/ryantm/agenix), and the configuration is deployed using [deploy-rs](https://github.com/serokell/deploy-rs).

## File Structure
- `services` - The main hosted services being ran on the server
- `system` - Configuration files for the specific system
- `secrets` - Secret files used in other modules encrypted with `agenix`
- `modules` - Custom written modules, which are then used in the configuration 
