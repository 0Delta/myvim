FROM gcc:latest
VOLUME /vimapp

WORKDIR /root
RUN apt update -y
RUN apt install -y python-dev python3-dev ruby-dev
RUN git clone https://github.com/vim/vim.git

WORKDIR /root/vim/src
RUN ./configure \
    # --target=x86_64-apple-darwin \
    --enable-fail-if-missing \
    --disable-gui \
    --enable-pythoninterp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-cscope \
    --disable-netbeans \
    --enable-multibyte \
    --disable-xim \
    --disable-sysmouse \
    --with-features=normal \
    --without-x \
    --disable-xsmp \
    --with-mac-arch=intel \
    --with-compiledby=0Delta \
    --prefix=/vimapp

CMD make && make install
