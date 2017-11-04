copies=$(lddtree.sh -l node-canvas/build/Release/canvas.node | sed -r -e '/^\/lib/d' -e '/canvas.node$/d');

for so in $copies; do
  cp $so node-canvas/build/Release
done;
