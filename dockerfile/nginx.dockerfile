FROM nginx:stable-alpine

ADD ./nginx/nginx.conf /etc/nginx/conf.d/nginx.conf
WORKDIR /var/www/html