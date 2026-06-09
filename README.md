https://github.com/pewdiepie-archdaemon/odysseus
https://huggingface.co/unsloth/DeepSeek-R1-0528-Qwen3-8B-GGUF
https://unsloth.ai/docs/models/tutorials/deepseek-r1-0528-how-to-run-locally#run-qwen3-distilled-r1-in-llama.cpp

https://grok.com/c/adc45b27-85a7-4b2c-9ee3-5b242045e826?rid=ecc58985-5d58-40b7-a420-c2efe6ba01af
Odesyy. What do to?

...01:17 PM
No chat session active. You can:

* Open the model picker in the chat box and pick a model

* Use the + button in the model picker to add a model endpoint

* Use /help to see all available commands


https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=24.04&target_type=deb_local
s

TODO:
* Поместисть вызов init.sh в entrypoint или вообще переместить в Dockerfile.


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
COMPOSE_FILE=docker-compose.yml:docker-compose.mcp.yml:docker/gpu.nvidia.yml
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
docker compose exec odysseus bash
docker compose ps
docker compose logs --tail=120 odysseus
docker compose logs odysseus | grep -E 'ChromaDB|MemoryVectorStore|DEGRADED'
```
