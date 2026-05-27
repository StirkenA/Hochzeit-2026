#!/bin/bash
# Hochzeit Ablauf – Netlify Deploy
# Einfach aus dem hochzeit-Ordner ausführen: ./deploy.sh

SITE_ID="5b436066-0727-4c1d-b675-42615ce24b5c"

echo "🚀 Deploying zu https://hochzeit-amelie-alex-2026.netlify.app ..."

if command -v netlify &>/dev/null; then
  netlify deploy --dir . --prod --site "$SITE_ID"
else
  npm_config_cache=/tmp/fresh-npm-cache npx netlify-cli@latest deploy --dir . --prod --site "$SITE_ID"
fi
