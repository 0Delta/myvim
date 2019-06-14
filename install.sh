cd vim/src
./configure \
    --enable-fail-if-missing \
    --disable-gui \
    --enable-pythoninterp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-cscope \
    --disable-netbeans \
    --enable-multibyte \
    --disable-xim \
    --disable-sysmouse \
    --with-features=huge \
    --without-x \
    --disable-xsmp \
    --enable-gui=no \
    --with-compiledby=0Delta \
    --prefix=~/bin/vim

make build && make install