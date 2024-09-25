#!/bin/bash

NGX_VERSION="1.24.0"

wget https://nginx.org/download/nginx-$NGX_VERSION.tar.gz 
tar xzvf nginx-$NGX_VERSION.tar.gz
rm nginx-$NGX_VERSION.tar.gz