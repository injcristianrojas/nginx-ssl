# Build using docker build -t nginx-ssl .
# Run using docker run --rm -p 80:80 -p 443:443 nginx-ssl

FROM nginx
RUN openssl req -nodes -new -newkey rsa:4096 -out server.csr -sha256 \
-subj "/C=CL/ST=Santiago/L=Santiago/O=MySecurity/OU=IT Department/CN=localhost"
RUN mv privkey.pem /etc/ssl/private/server.key
RUN openssl x509 -req -days 365 -in server.csr \
-signkey /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt
COPY default.conf /etc/nginx/conf.d/default.conf
