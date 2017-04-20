copies=$(lddtree.sh -l node_modules/canvas/build/Release/canvas.node | sed -r -e '/^\/lib/d' -e '/canvas.node$/d');

# Travis and older versions of Ubuntu have glibs that are old and don't have
# enough symbols for the other libraries that depend on it, so we have to force
# it to be included even though it's somewhat of a system library
copies="$copies $(lddtree.sh -l node_modules/canvas/build/Release/canvas.node | grep glib)"

for so in $copies; do
  cp $so node_modules/canvas/build/Release
done;
