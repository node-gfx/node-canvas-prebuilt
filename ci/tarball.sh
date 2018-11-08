# Generate the node-gyp formatted filename from the node environment
CANVAS_PREBUILT_VERSION=$1
FILENAME=$(
  node -e "
    var p = process, v = p.versions, pkg = require('./package.json'), libc = require('detect-libc').family || 'unknown';
    console.log([pkg.name, 'v$CANVAS_PREBUILT_VERSION', 'node-v' + v.modules, p.platform, libc, p.arch].join('-'));
  "
).tar.gz;

# Zip up the release
tar -C node-canvas/build -czf $FILENAME Release/;

if [ $? -ne 0 ]; then
  echo "failed to make tarball $FILENAME from node-canvas/build"
  exit 1;
else
  echo "created release tarball $FILENAME";
fi
