#!/usr/bin/env bash
set -e

echo "📦 Installing custom MIME types for JS/TS/JSX/TSX..."

sudo mkdir -p /usr/share/mime/packages

declare -A mime_defs=(
  ["text-x-javascript-react"]="*.jsx"
  ["text-x-typescript-react"]="*.tsx"
  ["text-x-typescript"]="*.ts"
  ["text-x-javascript"]="*.js"
)

for mime in "${!mime_defs[@]}"; do
  filename="/usr/share/mime/packages/${mime}.xml"
  pattern="${mime_defs[$mime]}"
  comment="$(echo "${mime#text-x-}" | tr '-' ' ')"
  mime_type="${mime/-//}"   # ← only replaces the first hyphen

  sudo tee "$filename" > /dev/null <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="${mime_type}">
    <comment>${comment}</comment>
    <glob pattern="${pattern}"/>
  </mime-type>
</mime-info>
EOF
done

sudo update-mime-database /usr/share/mime

echo "✅ Done! MIME types registered."
