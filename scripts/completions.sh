#!/bin/sh

# sha that fish-shell repo is locked to
sha=80394ea4e38138e0ce0bf23b016dc931e22ff788

# setup
rm -rf fish
mkdir -p fish
cd fish

# sparse clone in a way that user presence only needs to be confirmed once
git init
git remote add origin git@github.com:fish-shell/fish-shell.git
git sparse-checkout init --no-cone
git sparse-checkout set share/completions
git fetch --depth=1 origin "$sha"
git config --local advice.detachedHead false
git checkout "$sha"

# cleanup
mv share/completions completions
rm -rf share
rm -rf .git
