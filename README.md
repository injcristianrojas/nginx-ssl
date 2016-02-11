# NginX server for SSL/TLS configuration classes

## Intro
This project is intended for educating clients and students about proper SSL/TLS
configuration. It has been tested on Docker 1.9.1, and includes the following
software:

* OpenSSL 1.0.1e
* NginX 1.7.12

## Install

Download code:

```shell
git clone https://github.com/injcristianrojas/nginx-ssl.git
cd nginx-ssl
```

Get Docker machine:

```shell
docker pull injcristianrojas/nginx-ssl
```

## Work

Start server instance:

```shell
docker run --name nginx-server --rm -p 80:80 -p 443:443 injcristianrojas/nginx-ssl
```

Shell access:

```shell
docker exec -it nginx-server /bin/bash
```

## Config

To modify the server's SSL/TLS configuration, you can modify default.conf,
and add/modify your ssl_* parameters. When you're done, first copy default.conf
to the running machine like this:

```shell
docker cp default.conf nginx-server:/etc/nginx/conf.d/default.conf
```

Then, inside the machine, reload the server's configuration using:

```shell
nginx -s reload
```

## Test

The best tool available for SSL/TLS configuration testing is
[Qualys' SSL Test](https://www.ssllabs.com/ssltest/), but it requires the
server to be exposed online. Since we don't want to do
that just yet, an excellent tool is jhevent's
[cipherscan](https://github.com/jvehent/cipherscan).

To use this tool, you should clone its repo and start working with it. It
requires Python and a good version of OpenSSL:

```shell
git clone https://github.com/jvehent/cipherscan.git
cd cipherscan
```

We can do two things with it:

### View HTTPS configuration

In this case, we can see the server's configuration: Its protocols, cipher
suites, cipher order, etc:

```shell
./cipherscan -o /usr/bin/openssl localhost
```

### Assess HTTPS security

This task compares the server's current configuration against Mozilla's
recommended configurations, and reports the steps to be taken to match anyone
of these configurations. If the server meets any of them, it reports that as
well:

```shell
./analyze.py -o /usr/bin/openssl -t localhost
```
