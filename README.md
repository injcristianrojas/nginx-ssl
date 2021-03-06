# NginX server for SSL/TLS configuration classes

## Intro
This project is intended for educating clients and students about proper SSL/TLS
configuration. It has been tested on Docker 1.9.1, and includes the following
software:

* OpenSSL 1.0.1e
* NginX 1.7.12

System requirements:

* Docker 1.10.3 or higher
* Docker Compose 1.7.1 or higher

## Install

Download code:

```shell
git clone https://github.com/injcristianrojas/nginx-ssl.git
cd nginx-ssl
```

## Work

Start server instance:

```shell
docker-compose up
```

Shell access:

```shell
docker exec -it <machine_name> /bin/bash
```

## Config

To modify the server's SSL/TLS configuration, you can modify default.conf,
and add/modify your ssl_* parameters. When you're done, inside the machine,
reload the server's configuration using:

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

This task compares the server's current configuration against [Mozilla's recommended configurations](https://mozilla.github.io/server-side-tls/ssl-config-generator/),
and reports the steps to be taken to match anyone
of these configurations. If the server meets any of them, it reports that as
well:

```shell
./analyze.py -o /usr/bin/openssl -t localhost
```
