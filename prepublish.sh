if [ "$1" = "" ]; then
  echo "Specify which version"
  exit 1
fi

npm install --ignore-scripts canvas@$1 && {
  rm -rf canvas
  mv node_modules/canvas canvas
  rm -r node_modules
}

