build=node_modules/canvas/build/Release

git clone https://github.com/auriamg/macdylibbundler.git
cd macdylibbundler
make
cd ..

./macdylibbundler/dylibbundler -b -x $build/canvas.node -p @loader_path -d $build

