FROM php:8.0-apache

# Instalar extensões necessárias
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite

# Copiar o conteúdo da aplicação
COPY . /var/www/html/

# Configurar permissões
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80
