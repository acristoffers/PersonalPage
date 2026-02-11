{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
    mkElmDerivation.url = "github:jeslie0/mkElmDerivation";
  };

  outputs = { self, flake-utils, nixpkgs, mkElmDerivation }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ mkElmDerivation.overlays.default ]; };
        nodeDependencies = (pkgs.callPackage ./webapp/node2nix/default.nix { }).nodeDependencies;
        dev-dependencies = with pkgs; [
          elmPackages.elm
          elmPackages.elm-format
          elmPackages.elm-json
          elmPackages.elm-live
          nodePackages.sass
          nodejs
          uglify-js
          webpack-cli
        ];
      in
      {
        formatter = pkgs.nixpkgs-fmt;
        packages.default = pkgs.mkElmDerivation {
          elmJson = webapp/elm.json;
          name = "personal-page";
          src = ./.;
          buildInputs = dev-dependencies;
          buildPhase = ''
            cd webapp
            cp -r ${nodeDependencies}/lib/node_modules .
            sass -s compressed src/App.scss public/app.css
            elm make src/Main.elm --optimize --output=app.js
            uglifyjs app.js --output app2.js --compress 'pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe'
            uglifyjs app2.js --mangle --output public/app.js
            webpack --mode production --config webpack.config.js
            rm -rf public/app.css.map
            mkdir -p $out
            mv public/* $out/
          '';
        };
        devShell = pkgs.mkShell { packages = dev-dependencies; };
      }
    );
}
