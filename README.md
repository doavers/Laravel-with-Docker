# DOCKER CONFIG FOR LARAVEL

Root folder information

```
ROOT
D-- dockerfile
    F-- nginx.dockerfile
    F-- php_laravel.dockerfile
D-- mysql
D-- mysql_data
D-- nginx
D-- php
D-- src
F-- docker-compose.yml
F-- README.md
```

## Pastikan folder mysql_data kosong, karena akan diisi oleh container
```
rm -fr mysql_data/
mkdir mysql_data/ 
```

## install Laravel
```
 $ mkdir <name-of-root-folder>
 $ git clone git@github.com:aschmelyun/docker-compose-laravel.git
 $ sudo rm -r .git
 $ mkdir <name-of-root-folder>/src-laravel
 $ cd src-laravel/
 $ rm README.md
 $ composer create-project laravel/laravel .
```



## automatic create a image for app (source code image) & web (webserver config image)

```
 $ docker-compose build phpapp
 $ docker-compose up -d --force-recreate

 $ docker-compose build && docker-compose up -d

 $ docker-compose ps

 $ docker-compose exec phpapp ls -l

 $ docker-compose exec phpapp composer install

 $ docker-compose exec phpapp php artisan key:generate

 $ docker-compose logs <name-of-service>
 $ docker-compose logs nginx

 $ docker-compose pause
 $ docker-compose unpause

 $ docker-compose stop <id/name>
 $ docker-compose stop
 
 $ docker-compose images

 $ docker-compose kill <id/name>
 $ docker-compose kill mysql

 $ docker-compose rm <id/name>
 $ docker-compose rm mysql
 
 $ docker-compose down

 $ docker system prune --volumes
 
 $ docker-compose up -d --build
 
 $ docker-compose run --rm composer update --ignore-platform-reqs
 $ docker-compose run --rm composer require aschmelyun/larametrics
 $ docker-compose run --rm npm install
 $ docker-compose run --rm npm run dev
 $ docker-compose exec phpapp php -v
 $ docker-compose exec phpapp php /var/www/html/artisan migrate
 $ docker-compose run --rm artisan migrate
 $ docker-compose exec phpapp chmod 777 -R /var/www/html/storage/

```

## Access Laravel
[http://localhost:8000/](http://localhost:8000/)

## Youtube Reference
Andrew Smint => [YouTube](https://www.youtube.com/watch?v=I980aPL-NRM&t=3s)

DigitalOcean => [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-and-set-up-laravel-with-docker-compose-on-ubuntu-20-04)