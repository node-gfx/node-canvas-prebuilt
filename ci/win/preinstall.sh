# expects node, VS, and MSYS environments to be set up already. does everything else.

deps="cairo-2 png16-16 jpeg-8 pango-1.0-0 pangocairo-1.0-0 gobject-2.0-0 glib-2.0-0 turbojpeg-0 gif-7 freetype-6";

# install cairo and tools to create .lib

pacman --noconfirm -S \
  wget \
  unzip \
  mingw64/mingw-w64-x86_64-binutils \
  mingw64/mingw-w64-x86_64-tools \
  mingw64/mingw-w64-x86_64-libjpeg-turbo \
  mingw64/mingw-w64-x86_64-pango \
  mingw64/mingw-w64-x86_64-cairo \
  mingw64/mingw-w64-x86_64-giflib \
  mingw64/mingw-w64-x86_64-freetype \
  mingw64/mingw-w64-x86_64-fontconfig

# create .lib files for vc++

for lib in $deps; do
  gendef /mingw64/bin/lib$lib.dll
  dlltool -d lib$lib.def -l /mingw64/lib/lib$lib.lib
  rm lib$lib.def
done

# dependency walker will help us figure out which DLLs 
# canvas.node directly and indirectly uses

wget -nc http://www.dependencywalker.com/depends22_x64.zip
unzip -u depends22_x64.zip

