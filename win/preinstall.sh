# install cairo and tools to create .lib

pacman --noconfirm -S \
  wget \
  unzip \
  mingw64/mingw-w64-x86_64-cairo \
  mingw64/mingw-w64-x86_64-binutils \
  mingw64/mingw-w64-x86_64-tools
  
# create .lib files for vc++

gendef /mingw64/bin/libcairo-2.dll
dlltool -d libcairo-2.def -l /mingw64/lib/libcairo-2.lib

gendef /mingw64/bin/libpng16-16.dll
dlltool -d libpng16-16.def -l /mingw64/lib/libpng16-16.lib

rm libcairo-2.def libpng16-16.def

# dependency walker will help us figure out which DLLs 
# canvas.node directly and indirectly uses

wget http://www.dependencywalker.com/depends22_x64.zip
unzip depends22_x64.zip

