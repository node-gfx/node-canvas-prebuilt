NODEJS_VERSIONS="7 6 5 4 0.12 0.10";
OS=$1;
CANVAS_PREBUILT_VERSION=$2;
CANVAS_VERSION_TO_BUILD=$3;

if [ "$CANVAS_VERSION_TO_BUILD" = "" ]; then
  echo "Can't do anything since you didn't specify which version we're building!";
  echo "Specify the environment variable in AppVeyor/Travis"
  echo "Make sure that building pushes is disabled, and that you are executing builds manually."
  exit 0;
fi;

npm install --ignore-scripts canvas@$CANVAS_VERSION_TO_BUILD || {
  echo "could not find node-canvas version $CANVAS_VERSION_TO_BUILD in NPM";
  exit 1;
}

if [ "$CANVAS_PREBUILT_VERSION" = "" ]; then
  echo "You need to specify the prebuilt version, which might be different than the"
  echo "canvas version that is being built"
  exit 0;
fi;

source ci/$OS/preinstall.sh

cp ci/$OS/binding.gyp node_modules/canvas/binding.gyp

for ver in $NODEJS_VERSIONS; do 
  source ci/$OS/node_version.sh $ver;

  if [ $? -ne 0 ]; then
    echo "could not switch to node $ver";
    exit 1;
  fi;

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

echo "------------ Releasing with release.js ------------"
source ci/$OS/node_version.sh 7
node ci/release.js $PREBUILD_VERSION || exit 1;

cd ..

