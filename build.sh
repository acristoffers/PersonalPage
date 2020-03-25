rm -rf css img js Monografia.pdf Python3.pdf PublicKey.asc favicon.ico
rm -rf index.html resume.pdf
pushd webapp
yarn lint
yarn build
popd
mv webapp/dist/* .
