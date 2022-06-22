#!/usr/bin/env fish

for entry in (ls -1 | grep -Ev "404.html|CNAME|README.md|clean.fish|build.fish|webapp")
    rm -rf $entry
end

pushd webapp
fish clean.fish
popd
