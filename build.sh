#!/usr/bin/env sh

mkdir -p ./dist/
npx @rose-pine/build -t template.nix -o ./dist/ -f hex-ns
