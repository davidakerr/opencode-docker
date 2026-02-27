# Test Opencode

- Create a `./projects` directory beside the compose file (or [map you own](./docker-compose.yml#L18))
- Comes with playwright for [example MCP setup](./config/opencode.json#L6)
- [ohmyopencode](https://github.com/code-yeongyu/oh-my-opencode) preinstaled _(in a hacky way for docker)_
- [example ohmyopencode.config](./config/example.oh-my-opencode.json) - not added to container yet, it's just using the free models.

## Give it a whirl!

`docker compose up -d`

http://localhost:8080