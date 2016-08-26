# most dependenceis have to be installed in the .travis.yml 
# since apt-get must be run through the plugin there

# not whitelisted Travis's apt-get plugin so we have to compile ourselves
git clone git://anongit.gentoo.org/proj/pax-utils.git
cd pax-utils
PATH=$PATH:$PWD
make
cd ..

