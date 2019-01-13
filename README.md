**NOTE:** the `canvas-prebuilt` package is deprecated. As of version 2,
[`canvas`](https://github.com/Automattic/node-canvas) itself bundles prebuilt
versions from this repo. Install by running
```
npm install --save canvas
```
…and use `canvas` as usual.

# Using `canvas-prebuilt` (deprecated)

This is a drop-in replacement for `canvas` that does not require any compiling.
The repo is just a set of scripts that downloads a specific `node-canvas` version, builds it
and bundles it on all platforms. It's meant to run on Travis and AppVeyor but it can
be run locally too.

If you still need to use prebuilt 1.x and 2-alpha versions of `canvas`,
run `npm install --save canvas-prebuilt`
or replace `canvas` with `canvas-prebuilt` in your dependencies.

In your code, use `require('canvas-prebuilt')` wherever you would otherwise use `require('canvas')`.

# Linux technicalities

Linux users will need glibc >= 2.13.1 (Ubuntu 14.04+, Debian 7+, etc)

If you are using fonts, you might see some FontConfig warnings which are harmless:

| Situation | Message | Meaning |
| --------- | ------- | ------- |
| You have an old version of FontConfig on your system | **Fontconfig warning: line 142: blank doesn't take any effect anymore. please remove it from your fonts.conf** | You don't need to do anything, but removing said line or upgrading FontConfig on your system should fix it |
| You don't have FontConfig | **Fontconfig error: Cannot load default config file** | You don't have any fonts on your system, so if you want to use the text APIs you'll either need to install FontConfig or use `Canvas.registerFont` |

# Releases

See the [releases page](https://github.com/node-gfx/node-canvas-prebuilt/releases) on GitHub to check if your OS, architecture, and node are supported. Currently we're focused on x64 for Windows, Mac and Linux for most recent Node versions.

# Bundling

The bundling scripts just take a regularly compiled executable (canvas.node in this case)
and look at which non-system libraries it links against. Those libraries are then copied to the release
directory and binaries are updated if necessary to refer to them.

The strategies for bundling could be applied to other projects too since they're general:

* On macOS, [macpack](https://github.com/chearon/macpack) is used to search dependencies, filter out non-system ones, and update binary references
* On Windows, [Dependency Walker](http://www.dependencywalker.com)'s CLI is used to search dependencies. Anything in the MSYS2 folder is considered non-system. Patching is not necessary because Windows looks for dlls in the same folder as the binary
* On Linux, [pax-utils](https://wiki.gentoo.org/wiki/Hardened/PaX_Utilities) searches dependencies, and everything not in `/lib` is non-system. The custom `binding.gyp` compiles `canvas.node` to look inside its own directory for dependencies
