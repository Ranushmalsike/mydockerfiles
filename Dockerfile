# Use the official PHP Apache image as the base image
FROM php:apache

# Update system and install required packages
RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    libpng-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install gd zip mysqli pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy the project files to the Apache document root
COPY . /var/www/html/

# Expose the Apache port
EXPOSE 80


