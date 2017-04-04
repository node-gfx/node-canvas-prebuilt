if [ "$1" = "" ]; then
  echo "Specify which version"
  exit 1
fi

npm install --ignore-scripts canvas@$1 && {
  rm -rf canvas
  mv node_modules/canvas canvas
  rm -r node_modules

  # should force to put dependencies in own node_modules, we don't want to have
  # dependencies end up in some parent folder or they'll miss the release
  cd canvas
  npm install --ignore-scripts --production
  cd ..
}

