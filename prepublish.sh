npm install --ignore-scripts canvas@$npm_package_version && {
  rm -rf canvas;
  mv node_modules/canvas canvas;
  rm -r node_modules;
}

