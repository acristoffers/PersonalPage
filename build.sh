rm -rf css img js MATLAB.pdf Monografia.pdf Python3.pdf PublicKey.asc
rm -rf index.html resume.pdf favicon.ico Thesis.pdf eSousa2020.pdf
rm -rf Filho2019.pdf

pushd webapp
yarn
yarn lint
yarn build
popd

mv webapp/dist/* .
