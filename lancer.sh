#!/usr/bin/env bash
# Lance l'interface web ADK (adk web) sur le port 8000.
#
# Dans GitHub Codespaces, le navigateur passe par une adresse en *.app.github.dev.
# Par sécurité, ADK refuse les requêtes venant d'une autre adresse que localhost
# (protection contre les attaques par "DNS rebinding"). On autorise donc
# UNIQUEMENT l'adresse de votre propre Codespace, et rien d'autre.
cd "$(dirname "$0")" || exit 1

if [ -n "${CODESPACE_NAME:-}" ]; then
  ORIGINE="https://${CODESPACE_NAME}-8000.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-app.github.dev}"
  echo "🌐 Codespace détecté : adresse autorisée = $ORIGINE"
  exec adk web --port 8000 --allow_origins "$ORIGINE" "$@" agents
else
  exec adk web --port 8000 "$@" agents
fi
