#!/usr/bin/env fish

fish clean.fish

nix build
cp -r result/* .
rm -f result
