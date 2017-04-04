# Generate the node-gyp formatted filename from the node environment
FILENAME=$(
  node -e "
    var p = process, v = p.versions, pkg = require('./package.json');
    console.log([pkg.name, 'v$CANVAS_PREBUILT_VERSION', 'node-v' + v.modules, p.platform, p.arch].join('-'));
  "
).tar.gz;

# Zip up the release
tar -C node_modules/canvas/build -czf $FILENAME Release/

