#!/bin/bash
CONFIG=()
CONFIG+=("enable-fail-if-missing")
CONFIG+=("disable-gui")
# CONFIG+=("enable-pythoninterp=dynamic")
# CONFIG+=("with-python-command=/usr/local/bin/python2")
 CONFIG+=("enable-python3interp")
 CONFIG+=("with-python3-command=/usr/local/bin/python3")
# CONFIG+=("enable-rubyinterp")
#CONFIG+=("enable-luainterp")
#CONFIG+=("with-lua-prefix=/usr/local")
CONFIG+=("enable-cscope")
CONFIG+=("disable-netbeans")
CONFIG+=("enable-multibyte")
CONFIG+=("disable-xim")
CONFIG+=("disable-sysmouse")
CONFIG+=("with-features=huge")
CONFIG+=("without-x")
CONFIG+=("disable-xsmp")
CONFIG+=("enable-sound")
CONFIG+=("with-compiledby=0Delta")
CONFIG+=("prefix=$HOME/bin/vim")

CONFIG_CMD="./configure"
for v in "${CONFIG[@]}"
do
  CONFIG_CMD+=" --${v}"
done

git submodule foreach git pull origin master && git add vim && git commit -m "update vim repo" && git push

cd vim/src
make distclean
eval ${CONFIG_CMD}
make -j $(sysctl -n hw.ncpu) && make install

vim --version | head -n 4
