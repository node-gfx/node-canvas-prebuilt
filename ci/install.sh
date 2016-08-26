NODEJS_VERSIONS="6 5 4 0.12 0.10";
CANVAS_VERSION=$(node -e 'console.log(require("./package.json").version)');
OS=$1;

source ci/$OS/preinstall.sh

npm install --ignore-scripts canvas@$CANVAS_VERSION || {
  echo "could not find node-canvas version $CANVAS_VERSION in NPM";
  exit 1;
}

cp ci/$OS/binding.gyp node_modules/canvas/binding.gyp

for ver in $NODEJS_VERSIONS; do 
  bash ci/$OS/node_version.sh $ver || {
    echo "could not switch to node $ver";
    exit 1;
  }

  echo "------------ Building with node $ver ------------"
  cd node_modules/canvas
  node-gyp rebuild

  if [ $? -eq 0 ]; then
    cd ../../
    source ci/$OS/bundle.sh;
    source ci/release.sh;
  else
    echo "error building in nodejs version $ver"
    cd ../../
  fi
done;

cd ..

