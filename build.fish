#!/usr/bin/env fish

fish clean.fish

pushd webapp
fish build.fish
popd

cp -r webapp/public/* .
