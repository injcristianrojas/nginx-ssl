# NginX server for SSL/TLS configuration classes

## Intro
As a project for educating clients and students about proper SSL/TLS
configuration, I tried to develop this project, which includes OpenSSL 1.0.1k
and NginX 1.9.9.

## Install

Download code:

```shell
git clone
cd
```

Build docker machine:

```shell
docker build -t nginx-ssl .
```

## Work

Start server instance

```shell
docker run --name nginx-server --rm -p 80:80 -p 443:443 nginx-ssl
```

For shell access:

```shell
docker exec -it nginx-server /bin/bash
```

For server restart (inside the machine):

```shell
kill -HUP `cat /var/run/nginx.pid`
```
