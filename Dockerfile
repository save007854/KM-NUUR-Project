# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Install any needed extensions
RUN docker-php-ext-install mysqli pdo_mysql

# Enable Apache modules and restart Apache
RUN a2enmod rewrite && service apache2 restart

# Run Apache in the foreground when the container launches
CMD ["apache2-foreground"]
