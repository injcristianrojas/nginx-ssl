# Build using docker build -t nginx-ssl .
# Run using docker run --rm -p 80:80 -p 443:443 nginx-ssl

FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
