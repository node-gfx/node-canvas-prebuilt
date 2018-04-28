FROM debian:wheezy
RUN apt-get update && apt-get -y install curl python pkg-config g++-4.7 git \
    gtk-doc-tools x11proto-xext-dev make gcc g++ nasm wget gperf bzip2 libmount-dev
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
RUN bash -c 'cd; export NVM_DIR=$HOME/.nvm; . $NVM_DIR/nvm.sh; nvm install 7'

RUN bash -c 'cd; curl -O https://zlib.net/fossils/zlib-1.2.8.tar.gz; tar -xvf zlib-1.2.8.tar.gz; cd zlib-1.2.8; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://superb-dca2.dl.sourceforge.net/project/giflib/giflib-5.1.4.tar.gz; tar -xvf giflib-5.1.4.tar.gz; cd giflib-5.1.4; ./configure; make; make install'
RUN bash -c 'cd; curl -O ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz; tar -xvf libffi-3.2.1.tar.gz; cd libffi-3.2.1; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://gigenet.dl.sourceforge.net/project/libpng/libpng16/1.6.30/libpng-1.6.30.tar.xz; tar -xvf libpng-1.6.30.tar.xz; cd libpng-1.6.30; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://cytranet.dl.sourceforge.net/project/libjpeg-turbo/1.5.2/libjpeg-turbo-1.5.2.tar.gz; tar -xvf libjpeg-turbo-1.5.2.tar.gz; cd libjpeg-turbo-1.5.2; ./configure --prefix=/usr/local; make; make install'
RUN bash -c 'cd; curl -O https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.bz2; tar -xvf pcre-8.41.tar.bz2; cd pcre-8.41; ./configure --enable-pcre16 --enable-pcre32 --enable-utf --enable-unicode-properties; make; make install '
RUN ldconfig
RUN bash -c 'cd; curl -O http://gensho.ftp.acc.umu.se/pub/gnome/sources/glib/2.52/glib-2.52.3.tar.xz; tar -xvf glib-2.52.3.tar.xz; cd glib-2.52.3; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://svwh.dl.sourceforge.net/project/freetype/freetype2/2.8/freetype-2.8.tar.gz; tar -xvf freetype-2.8.tar.gz; cd freetype-2.8; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.7.tar.bz2; tar -xvf harfbuzz-1.4.7.tar.bz2; cd harfbuzz-1.4.7; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://cytranet.dl.sourceforge.net/project/expat/expat/2.2.0/expat-2.2.0.tar.bz2; tar -xvf expat-2.2.0.tar.bz2; cd expat-2.2.0; ./configure; make; make install'
RUN ldconfig
RUN bash -c 'cd; curl -O https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.4.tar.bz2; tar -xvf fontconfig-2.12.4.tar.bz2; cd fontconfig-2.12.4; ./configure --enable-static --sysconfdir=/etc --localstatedir=/var; make; make install'
RUN bash -c 'cd; curl -O https://www.cairographics.org/releases/pixman-0.34.0.tar.gz; tar -xvf pixman-0.34.0.tar.gz; cd pixman-0.34.0; ./configure; make; make install'
RUN bash -c 'cd; curl -O https://www.cairographics.org/releases/cairo-1.14.10.tar.xz; tar -xvf cairo-1.14.10.tar.xz; cd cairo-1.14.10; ./configure; make; make install'
RUN bash -c 'cd; curl -O http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.7.tar.xz; tar -xvf pango-1.40.7.tar.xz; cd pango-1.40.7; ./configure; make; make install'

# https://stackoverflow.com/a/29729834/487014
RUN cp /etc/apt/sources.list /etc/apt/sources.list.WHEEZY
RUN cat /etc/apt/sources.list.WHEEZY | sed 's/wheezy/jessie/g' > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install gcc-4.9 g++-4.9
RUN cp /etc/apt/sources.list.WHEEZY /etc/apt/sources.list
RUN apt-get update
