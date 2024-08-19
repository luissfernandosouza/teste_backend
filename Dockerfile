FROM php:8.0-apache

# Instalar extensões necessárias
RUN apt-get update && apt-get install -y libpq-dev zip unzip && docker-php-ext-install pdo pdo_pgsql && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite

# Copiar o conteúdo da aplicação
COPY public/index.php /var/www/html
COPY src/View/ views/
COPY src/Controller/ controller
COPY src/Model /model
COPY public/assets assets
COPY composer.json composer.json

# Configurar permissões
RUN composer install
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80