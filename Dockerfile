FROM php:8.0-apache

# Instalar extensões necessárias
RUN apt-get update && \
    apt-get install -y libpq-dev zip unzip && \
    docker-php-ext-install pdo pdo_pgsql

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite

# Copiar o conteúdo da aplicação
COPY public/index.php /var/www/html/
COPY src/View/ /var/www/html/views/
COPY src/Controller/ /var/www/html/controller/
COPY src/Model/ /var/www/html/model/
COPY public/assets/ /var/www/html/assets/
COPY composer.json /var/www/html/composer.json

# Configurar permissões e instalar dependências
RUN composer install && \
    chown -R www-data:www-data /var/www/html

# porta
EXPOSE 8084
