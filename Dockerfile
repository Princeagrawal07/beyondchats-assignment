FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    unzip \
    git \
    curl

RUN docker-php-ext-install pdo pdo_sqlite

WORKDIR /app

COPY . .

RUN mkdir -p database \
 && touch database/database.sqlite \
 && chmod -R 777 database storage bootstrap/cache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader

RUN php artisan key:generate || true
RUN php artisan migrate --force || true

EXPOSE 10000
CMD php artisan serve --host=0.0.0.0 --port=10000
