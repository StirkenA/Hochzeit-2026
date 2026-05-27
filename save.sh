#!/bin/bash
# Änderungen speichern & live schalten
# Aufruf: ./save.sh "kurze Beschreibung was geändert wurde"

MSG=${1:-"content update"}

# JSON validieren
node -e "
  const fs = require('fs');
  const html = fs.readFileSync('Hochzeit_Ablauf_Marvin.html', 'utf8');
  const m = html.match(/<script id=\"ablaufDaten\"[^>]*>([\s\S]*?)<\/script>/);
  JSON.parse(m[1]);
  console.log('✅ JSON valid');
" || { echo "❌ JSON-Fehler – bitte fix before pushing!"; exit 1; }

git add .
git commit -m "$MSG"
git push
echo "🚀 Live auf https://hochzeit-amelie-alex-2026.netlify.app"
