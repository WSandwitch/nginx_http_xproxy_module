# nginx_http_xproxy_module and nginx_stream_xproxy_module

An extended fork of `nginx_http_proxy_module` and `nginx_stream_proxy_module` module from nginx 1.24.0.

New features:
- http connection over socks proxy

Inspired of [socks-nginx-module](https://github.com/dannote/socks-nginx-module) by Dannote.

## Building

nginx >= **1.24.0** is supported.

```bash
# apt-get install git build-essential zlib1g-dev libpcre3 libpcre3-dev unzip

$ git clone https://github.com/WSandwitch/nginx_xproxy_module

$ cd nginx_dir
$ patch -p1 < /path/to/nginx_xproxy_module/http/nginx_1.24.0.patch
# See http://nginx.org/en/docs/configure.html for more configuration options
$ ./configure [other params] --add-dynamic-module=/path/to/nginx_xproxy_module/http --add-dynamic-module=/path/to/nginx_xproxy_module/stream

$ make
# make install
```

## Configuring

Sample reverse proxy over SOCKS5 proxy configuration:

```
location / {
  xproxy_socks socks5://proxy:1080;
  xproxy_pass http://httpbin.org/get;
}
```

All [ngx_http_proxy_module](http://nginx.org/en/docs/http/ngx_http_proxy_module.html) directives are supported.

### xproxy_socks

Context: `http`, `server`, `location`

Default: `none;`

Set socks proxy pass and enables connection over socks.

This example will proxy requests to `ipinfo.io` socks local Tor daemon:

```
location /ip {
  xproxy_socks socks5://127.0.0.1:9050;
  xproxy_pass http://ipinfo.io;
}
```
