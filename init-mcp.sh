#!/bin/bash
set -ex

# Install llama-cpp-python with pre-built wheels for CUDA 13.0
# Using --user to install safely into /app/.local without requiring root privileges.
# This enables hardware acceleration for GGUF models using the host's NVIDIA GPU.
echo "Ensuring llama-cpp-python is installed with CUDA 13.0 support..."
python -m ensurepip --upgrade
python -m pip install --user llama-cpp-python --extra-index-url https://abetlen.github.io/llama-cpp-python/whl/cu130


# Check if uvx is available; if not, install the uv package
# The package will be installed to /app/.local/bin, which your entrypoint.sh has already added to $PATH
if ! command -v uvx &> /dev/null; then
    echo "uvx utility not found, installing uv..."
    python -m pip install --user uv==0.11.17
fi


FLAG_FILE="/app/data/.mcp_setup_done"

if [ ! -f "$FLAG_FILE" ]; then
  echo "Configuring MCP servers..."

  # Add Git MCP
  python3 scripts/odysseus-mcp add \
    --name "Git MCP" \
    --transport stdio \
    --command uvx \
    --args '["mcp-server-git"]'

  # Add Playwright MCP
  python3 scripts/odysseus-mcp add \
    --name "Playwright MCP" \
    --transport stdio \
    --command npx \
    --args '["@playwright/mcp@0.0.75"]'

  #echo "List of installed MCP servers:"
  #python3 scripts/odysseus-mcp list

  # Create a flag in persistent volume so the script won't run again
  touch "$FLAG_FILE"
  echo "MCP servers successfully added!"
else
  echo "MCP servers are already configured, skipping installation step."
fi

# Pass control to the original command (uvicorn)
exec "$@"
