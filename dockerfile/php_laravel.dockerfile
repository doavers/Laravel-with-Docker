FROM php:7.4-fpm
# FROM php:7.4-fpm-alpine

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apt-get update 2>/dev/null | grep packages | cut -d '.' -f 1 && \
    apt-get install -y \
    libonig-dev libxml2-dev libzip-dev \
    libmcrypt-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \ 
    zip unzip vim nano git curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Mcrypt 1.0.4 release date 2020-12-02
RUN pecl install mcrypt-1.0.4 && docker-php-ext-enable mcrypt

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip
# RUN docker-php-ext-install -j$(nproc) iconv pdo pdo_mysql gd
# RUN docker-php-ext-install -j$(nproc) mbstring
# RUN docker-php-ext-install -j$(nproc) zip
# RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www

# ADD . /var/www
RUN chown -R www-data:www-data /var/www

USER $user