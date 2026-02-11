[Álan Crístoffer](https://acristoffers.me)

# Building

## node2nix

```bash
cd webapp
nix run nixpkgs#node2nix -- -i package.json -o node2nix/node-packages.nix -c node2nix/default.nix -e node2nix/node-env.nix
```
