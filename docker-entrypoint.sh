#!/bin/sh

# use environment variables
# quite dirty and PRs are sincerely welcome
grep -Rl "https://plantuml-editor.kkeisuke.com" . | xargs -I {} sed -i "s|https://plantuml-editor.kkeisuke.com|${VUE_APP_URL}|g" {}
grep -Rl "https://plantuml-server.kkeisuke.dev" . | xargs -I {} sed -i "s|https://plantuml-server.kkeisuke.dev|${VUE_APP_CDN}|g" {}

# NGINX entrypoint
/docker-entrypoint.sh "$@"
