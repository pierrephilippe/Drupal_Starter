FROM drupal:10-apache

# Install dev tools
RUN apt-get update && apt-get install -y \
    git unzip zip vim less libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN pecl install xdebug \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable xdebug

# Composer & Drush
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require drush/drush
ENV PATH="/root/.composer/vendor/bin:$PATH"

WORKDIR /var/www/html
