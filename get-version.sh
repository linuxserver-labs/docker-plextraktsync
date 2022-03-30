#!/usr/bin/env bash

APP_VERSION=$(curl -sL "https://pypi.python.org/pypi/PlexTraktSync/json" \
    | jq -r '. | .info.version')

printf "%s" "${APP_VERSION}"