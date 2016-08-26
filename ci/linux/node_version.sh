VER=$1
source ~/.nvm/nvm.sh
nvm use $VER || { nvm install $VER; nvm use $VER; }
npm install -g node-gyp

