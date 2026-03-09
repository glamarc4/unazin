#!/usr/bin/env bash
# Unazin - Roda o app Flutter no simulador/dispositivo padrão
set -e
cd "$(dirname "$0")"

if ! command -v flutter &> /dev/null; then
  echo "Flutter não está no PATH. Instale o Flutter primeiro (veja SETUP.md)."
  exit 1
fi

echo "→ Obtendo dependências..."
flutter pub get

echo ""
echo "→ Iniciando app (simulador/dispositivo padrão)..."
flutter run
