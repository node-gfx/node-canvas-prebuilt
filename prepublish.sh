if [ "$1" = "" ]; then
  echo "Specify which version"
  exit 1
fi

npm install --ignore-scripts canvas@$1 && {
  rm -rf canvas
  mv node_modules/canvas canvas

  # dependencies are handled by mirroring the dependencies
  # of canvas in our own package.json
  rm -r canvas/node_modules
}

