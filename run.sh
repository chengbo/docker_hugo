#!/usr/bin/env sh

hugo --source="/src" --destination="/html" --theme="$THEME_NAME" || exit 1
