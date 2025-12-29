FROM php:8.2-cli

# System dependencies
RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    unzip \
    git \
    curl

# PHP extensions
RUN docker-php-ext-install pdo pdo_sqlite

# Set working directory to backend
WORKDIR /app/backend

# Copy only backend
COPY backend/ .

# Create SQLite DB + permissions
RUN mkdir -p database \
 && touch database/database.sqlite \
 && chmod -R 777 database storage bootstrap/cache

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader

# Laravel setup
RUN php artisan key:generate || true
RUN php artisan migrate --force || true

# Render uses port 10000
EXPOSE 10000
CMD php artisan serve --host=0.0.0.0 --port=10000
