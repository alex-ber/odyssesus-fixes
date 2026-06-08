```bash
git clone https://github.com/pewdiepie-archdaemon/odysseus.git
cd odysseus
cp .env.example .env

echo "PUID=$(id -u)" > .env
echo "PGID=$(id -g)" >> .env

#PUID=1000
#PGID=1000
```

Change in .env

```bash
SEARXNG_INSTANCE=http://localhost:8085
AUTH_ENABLED=false
COMPOSE_FILE=docker-compose.yml:docker-compose.mcp.yml:docker-compose-mygpu.nvidia.yml
```

cp ../odyssesus-fixes/docker-compose.mcp.yml .
cp ../docker-compose-mygpu.nvidia.yml .





? Add a server endpoint wrapped local model as dockercontainer. ?






Build and run

```bash
docker compose build --no-cache --progress=plain
docker compose up -d
```

**Useful checks.**

```bash
docker compose config
docker compose ps
docker compose logs --tail=120 odysseus
docker compose logs odysseus | grep -E 'ChromaDB|MemoryVectorStore|DEGRADED'
```
