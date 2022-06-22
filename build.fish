#!/usr/bin/env fish

fish clean.fish

pushd webapp
fish build.fish
cp -r public/* ..
fish clean.fish
popd

