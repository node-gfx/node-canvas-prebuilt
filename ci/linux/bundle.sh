copies=$(lddtree.sh -l node_modules/canvas/build/Release/canvas.node | sed -r -e '/^\/lib/d' -e '/canvas.node$/d');

for so in $copies; do
  cp $so node_modules/canvas/build/Release
done;
