#!/usr/bin/env bash

addInstaller=${1:-true}
targetDir=${2:-$HOME/.local/bin}
targetFilePath=$targetDir/versions-finder
installerTargetFilePath=$targetDir/versions-finder-installer

# first make sure the target dir exists
mkdir -p "$targetDir"

set -e
curl -sSL  https://raw.githubusercontent.com/neblabs/versions-finder/main/versions-finder.sh -o "$targetFilePath"

sudo chmod +x "$targetFilePath"

# warn if not in path
if ! [[ "$targetDir" == *"/.local/bin"* ]]; then
    echo [warn] Installed to "$targetFilePath" but it "doesn't" seem to be in your PATH.
fi

if $addInstaller; then
    # also install the installer, good for updates
    curl -sSL  https://raw.githubusercontent.com/neblabs/versions-finder/main/install.sh -o "$installerTargetFilePath"

    sudo chmod +x "$installerTargetFilePath"
fi



