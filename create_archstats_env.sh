#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_PATH="$SCRIPT_DIR/conda_env"

source /cds/group/pcds/pyps/conda/py312/etc/profile.d/conda.sh

conda create -p "$ENV_PATH" python=3.7 -y

git submodule update --init --recursive

conda run -p "$ENV_PATH" python -m pip install -r "$SCRIPT_DIR/archstats/requirements.txt"

cd "$SCRIPT_DIR/archstats"
conda run -p "$ENV_PATH" python -m pip install -e .
