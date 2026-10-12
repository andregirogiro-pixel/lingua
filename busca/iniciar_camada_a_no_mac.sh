#!/bin/bash
set -euo pipefail

PROJETO_INICIALIZACAO="${1:-/Users/rodrigodevellis/lingua-agente}"
BASE_INICIALIZACAO="${2:-/Users/rodrigodevellis/Documents/Qoder/2026-10-11/a276916c/camada_a}"
VOLUME19_INICIALIZACAO="${3:-$PROJETO_INICIALIZACAO/instance/volume19_camada_a_20261012T103312Z_9f45c9aa}"
PYTHON_INICIALIZACAO="${PYTHON_INICIALIZACAO:-$PROJETO_INICIALIZACAO/instance/venv-agente-e5-intel/bin/python}"

if [[ ! -x "$PYTHON_INICIALIZACAO" || ! -f "$PROJETO_INICIALIZACAO/agente_analista/app.py" ]]; then
  printf 'Confira a pasta do projeto e seu Python E5 existente.\n' >&2
  exit 2
fi
for PASTA_INICIALIZACAO in "$BASE_INICIALIZACAO" "$VOLUME19_INICIALIZACAO"; do
  if [[ ! -f "$PASTA_INICIALIZACAO/manifesto.json" || ! -f "$PASTA_INICIALIZACAO/corpus.sqlite" ]]; then
    printf 'Corpus incompleto: %s\n' "$PASTA_INICIALIZACAO" >&2
    exit 2
  fi
done

cd -- "$PROJETO_INICIALIZACAO"
export AGENTE_ANALISTA_CORPUS_BACKEND=camada_a
export AGENTE_ANALISTA_CAMADA_A="$BASE_INICIALIZACAO"
export AGENTE_ANALISTA_VOLUME19_CORRIGIDO="$VOLUME19_INICIALIZACAO"
exec "$PYTHON_INICIALIZACAO" -m agente_analista.app
