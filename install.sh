#!/usr/bin/env bash

targetDir=$HOME/.local/bin
targetFilePath=$HOME/.local/bin/versions-finder

# first make sure the target dir exists
mkdir -p "$targetDir"

curl -sSL  https://raw.githubusercontent.com/neblabs/versions-finder/main/versions-finder.sh -o "$targetFilePath"

sudo chmod +x "$targetFilePath"

# warn if not in path
if ! [[ "$targetDir" == *"/.local/bin"* ]]; then
    echo [warn] Installed to "$targetFilePath" but it "doesn't" seem to be in your PATH.
fi
