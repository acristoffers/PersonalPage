#!/usr/bin/env fish

fish build.fish
elm-live src/Main.elm --hot -d public --start-page=index.html -u -- --output=public/app.js
fish clean.fish
