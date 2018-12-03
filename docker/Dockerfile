FROM debian:wheezy
RUN apt-get update && apt-get -y install curl python python-pip pkg-config g++-4.7 git \
    gtk-doc-tools x11proto-xext-dev make gcc g++ nasm wget gperf bzip2 libmount-dev
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
RUN bash -c 'cd; export NVM_DIR=$HOME/.nvm; . $NVM_DIR/nvm.sh; nvm install 7'

RUN bash -c 'cd; curl -O https://zlib.net/fossils/zlib-1.2.8.tar.gz; tar -xvf zlib-1.2.8.tar.gz; cd zlib-1.2.8; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://superb-dca2.dl.sourceforge.net/project/giflib/giflib-5.1.4.tar.gz; tar -xvf giflib-5.1.4.tar.gz; cd giflib-5.1.4; ./configure; make; make install'
RUN bash -c 'cd; curl -O ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz; tar -xvf libffi-3.2.1.tar.gz; cd libffi-3.2.1; ./configure; make; make install'
RUN bash -c 'cd; curl -LO https://download.sourceforge.net/libpng/libpng-1.6.35.tar.gz; tar -xvf libpng-1.6.35.tar.gz; cd libpng-1.6.35; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://cytranet.dl.sourceforge.net/project/libjpeg-turbo/1.5.2/libjpeg-turbo-1.5.2.tar.gz; tar -xvf libjpeg-turbo-1.5.2.tar.gz; cd libjpeg-turbo-1.5.2; ./configure --prefix=/usr/local; make; make install'
RUN bash -c 'cd; curl -O https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.bz2; tar -xvf pcre-8.41.tar.bz2; cd pcre-8.41; ./configure --enable-pcre16 --enable-pcre32 --enable-utf --enable-unicode-properties; make; make install '
RUN ldconfig
RUN bash -c 'cd; curl -O http://gensho.ftp.acc.umu.se/pub/gnome/sources/glib/2.52/glib-2.52.3.tar.xz; tar -xvf glib-2.52.3.tar.xz; cd glib-2.52.3; ./configure; make; make install'
RUN bash -c 'cd; curl -LO https://sourceforge.net/projects/freetype/files/freetype2/2.9.1/freetype-2.9.1.tar.gz; tar -xvf freetype-2.9.1.tar.gz; cd freetype-2.9.1; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.7.tar.bz2; tar -xvf harfbuzz-1.4.7.tar.bz2; cd harfbuzz-1.4.7; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://cytranet.dl.sourceforge.net/project/expat/expat/2.2.0/expat-2.2.0.tar.bz2; tar -xvf expat-2.2.0.tar.bz2; cd expat-2.2.0; ./configure; make; make install'
RUN ldconfig
RUN bash -c 'cd; curl -O https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.1.tar.bz2; tar -xvf fontconfig-2.13.1.tar.bz2; cd fontconfig-2.13.1; ./configure --enable-static --sysconfdir=/etc --localstatedir=/var; make; make install'
RUN bash -c 'cd; curl -O https://www.cairographics.org/releases/pixman-0.34.0.tar.gz; tar -xvf pixman-0.34.0.tar.gz; cd pixman-0.34.0; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://cairographics.org/releases/cairo-1.16.0.tar.xz; tar -xvf cairo-1.16.0.tar.xz; cd cairo-1.16.0; ./configure; make; make install'
RUN bash -c 'cd; curl -LO https://github.com/fribidi/fribidi/releases/download/v1.0.5/fribidi-1.0.5.tar.bz2; tar -xvf fribidi-1.0.5.tar.bz2; cd fribidi-1.0.5; ./configure; make; make install'
RUN bash -c 'cd; curl -O http://ftp.gnome.org/pub/GNOME/sources/pango/1.42/pango-1.42.4.tar.xz; tar -xvf pango-1.42.4.tar.xz; cd pango-1.42.4; ./configure; make; make install'

# librsvg
RUN bash -c 'cd; curl -O https://www.openssl.org/source/openssl-1.1.1.tar.gz; tar -xvf openssl-1.1.1.tar.gz; cd openssl-1.1.1; ./config; make; make install'
RUN ldconfig
RUN bash -c 'cd; curl -O https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz; tar -xvf Python-3.7.1.tgz; cd Python-3.7.1; ./configure --prefix=/usr --enable-shared --with-ensurepip=yes; make; make install'
RUN bash -c 'curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --disable-sudo';

RUN bash -c 'pip3 install meson ninja';
RUN bash -c 'curl -LO http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.38/gdk-pixbuf-2.38.0.tar.xz; tar -xvf gdk-pixbuf-2.38.0.tar.xz; cd gdk-pixbuf-2.38.0; meson --prefix=/usr -Dx11=false -Dgir=false _build; cd _build; ninja; ninja install';
RUN bash -c 'curl -O http://xmlsoft.org/sources/libxml2-2.9.8.tar.gz; tar -xvf libxml2-2.9.8.tar.gz; cd libxml2-2.9.8; ./configure --without-python; make; make install'
RUN bash -c 'curl -O http://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-0.6.12.tar.xz; tar -xvf libcroco-0.6.12.tar.xz; cd libcroco-0.6.12; ./configure; make; make install'
RUN bash -c 'cd; curl -LO https://download.gnome.org/sources/librsvg/2.44/librsvg-2.44.8.tar.xz; tar -xvf librsvg-2.44.8.tar.xz; cd librsvg-2.44.8; ./configure --enable-introspection=no; make; make install'
RUN ldconfig

# https://stackoverflow.com/a/29729834/487014
RUN cp /etc/apt/sources.list /etc/apt/sources.list.WHEEZY
RUN cat /etc/apt/sources.list.WHEEZY | sed 's/wheezy/jessie/g' > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install gcc-4.9 g++-4.9
RUN cp /etc/apt/sources.list.WHEEZY /etc/apt/sources.list
RUN apt-get update
