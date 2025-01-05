#!/usr/bin/env sh

mkdir -p ./variants/
npx @rose-pine/build -t template.nix -o ./variants/ -f hex-ns
