[![NPM version](https://badge.fury.io/js/canvas-prebuilt.svg)](http://badge.fury.io/js/canvas-prebuilt)

This is a drop-in replacement for canvas that does not require any compiling. To use it
just `npm install canvas-prebuilt` or replace `canvas` with `canvas-prebuilt` in your
dependencies.

The repo is just a set of scripts that downloads a specific node-canvas version, builds it
and bundles it on all platforms. It's meant to run on Travis and AppVeyor but it can
be run locally too

# Releases

Make sure your node version is the most recent to guarantee ABI compatibility

| canvas@1.4.0<br>canvas@1.5.0<br>canvas@1.6.0 | node 6 | node 5 | node 4 | node 0.12 | node 0.10 |
| ------------ | ------ | ------ | ------ | --------- | --------- |
| Linux x64    |   ✓    |   ✓    |    ✓   |    ✓      |     ✓     |
| Windows x64  |   ✓    |   ✓    |    ✓   |    ✓      |     ✓     |  
| OSX x64      |   ✓    |   ✓    |    ✓   |    ✓      |     ✓     |
| Windows x86  |   𐄂¹   |   𐄂¹   |    𐄂¹  |    𐄂¹     |     𐄂¹    |
| Linux x86    |   𐄂¹   |   𐄂¹   |    𐄂¹  |    𐄂¹     |     𐄂¹    |
| Linux ARM    |   𐄂¹   |   𐄂¹   |    𐄂¹  |    𐄂¹     |     𐄂¹    |

¹I have some ideas on how to get these working with cross-compilation if people request it.
I plan to add Linux/ARM

# Bundling

The bundling scripts just take a regularly compiled executable (canvas.node in this case)
and look at which shared libraries it links against. Those libraries are then copied to the release
directory. Windows will look for DLLs in the same directory by default, OSX hard-codes the
path to the dylib in executables so you have to recursively update references after the copy,
and in Linux you simply have to compile canvas.node in such a way that it will look in the
current directory first (using the rpath linker option).


