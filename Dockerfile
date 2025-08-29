FROM php:8.2-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    mariadb-client \
    git \
    unzip \
    curl \
    icu-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libwebp-dev \
    gmp-dev \
    libxml2-dev \
    oniguruma-dev \
    postgresql-dev \
    sqlite-dev \
    autoconf \
    linux-headers \
    make

# Install PHP extensions
RUN docker-php-ext-install -j$(nproc) \
    pdo_mysql \
    mysqli \
    opcache \
    zip \
    gd \
    gmp \
    xml \
    mbstring \
    intl \
    pcntl \
    bcmath \
    exif \
    pdo_pgsql \
    pdo_sqlite

# Install Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install Composer
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

# Install PHPStan
RUN composer global require phpstan/phpstan
ENV PATH="$PATH:/root/.composer/vendor/bin"

# Install PHP-CS-Fixer
RUN composer global require friendsofphp/php-cs-fixer

# Configure PHP-FPM
COPY docker/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY docker/php.ini /usr/local/etc/php/conf.d/php.ini

# Set working directory
WORKDIR /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm", "-F"]