FROM alpine:3.11
LABEL maintainer="@singe at SensePost <research@sensepost.com>"

# binutils - as & ld
# gcc - ggc for compilation and -S
# libc-dev - to link against
# vim/nano - editors
# strace - for tracing execution
# ncurses - make gdb look better
# gdb - debugging
# bash - easier shell
# man & man-pages - function lookup
RUN apk --no-cache add \
  binutils \
  gcc \
  libc-dev \
  vim \
  nano \
  strace \
  ncurses \
  gdb \
  bash \
  man \
  man-pages
RUN apk --no-cache add \
  make
RUN rm -rf /var/cache/apk/*

# Don't be a psycopath
RUN echo ":set tabstop=4 shiftwidth=4 softtabstop=0 expandtab" > ~/.vimrc
# Make gdb useful for asm debugging
RUN echo -e "layout asm\nlayout regs\nset history save on" > ~/.gdbinit
RUN echo 'PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "' > ~/.bashrc \
  && echo 'alias make="make -f /root/build/Makefile"' >> ~/.bashrc \
  && echo 'export PAGER=less' >> ~/.bashrc \
  && echo 'cd' >> ~/.bashrc

COPY build /root/build
COPY exit /root/exit
COPY helloworld /root/helloworld
COPY vars /root/vars
COPY if /root/if
COPY loop /root/loop
COPY function /root/function

CMD [ "/bin/bash" ]
