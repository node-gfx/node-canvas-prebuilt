# Bundling libraries

The typical way to bundle libraries with an executable is to do a static compilation. That
means that you have to distribute the source code of other libraries within yours and compile
it as a part of your build. I don't like having other peoples' source code in my repo, so that
wasn't acceptable

The next thought was to use '.a' files that exist in library directories on the OS. That almost
works except that I couldn't find any way to get VS to link against MinGW .lib.a files. This
approach also made me realize I don't want to change the build system significantly.

In the end, the best way to distribute an executable without any preexisting dependencies
is to ship it with the shared libraries.

## Determining which libraries are used

One of the hardest things was to determine which files to distribute. Getting a (recursive) list of
which libraries are needed is possible since those things are baked into ELF (linux executables) and
PE (windows), but you end up with a really long list that includes stuff already bundled with
operating systems.

So you have to figure out which libraries to distribute, and which libraries are on the operating
system by default.

## Filtering out system libraries

In Windows with MSYS, it's easy - assume everything in the /mingw64/bin folder (where all the
DLLs go) that is used by the executable needs to be distributed

On OSX, just assume assume /usr/local is the directory for third party things since that's
where Homebrew installs libraries. /System and /usr/lib are some of the defaults.

On Linux, /lib should be the folder where system libraries go. Unfortunately that doesn't work
on Arch, but it does work on Ubuntu and probably most distros.

