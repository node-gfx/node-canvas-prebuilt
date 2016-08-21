VERSION=$(node -e 'console.log(require("./package.json").version)');

npm install --ignore-scripts canvas@$VERSION

cp ci/$1/binding.gyp node_modules/canvas/binding.gyp
cd node_modules/canvas
node-gyp rebuild
cd ../../

mv node_modules/canvas canvas
rm -rf node_modules

