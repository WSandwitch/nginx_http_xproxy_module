#!/usr/bin/env bash
cd nginx-1.24.0

if [ ! -f ../build/Makefile ]
then
#  ./configure --with-debug --with-stream --builddir=../build --prefix=./root --add-module=../../http --add-module=../../stream
  ./configure --with-debug --with-stream --builddir=../build --prefix=./root --add-dynamic-module=../../http --add-dynamic-module=../../stream
fi

make -f ../build/Makefile -j2
#&& gdb --args /build/nginx -c /code/debug/nginx.conf -p $PWD
