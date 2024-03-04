# Use an official PHP runtime as a parent image for the builder stage
FROM php:7.4-apache AS builder

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the contents of the current directory into the container at /var/www/html
COPY . /var/www/html

# Install required dependencies
RUN apt-get update \
    && apt-get install -y \
        curl \
        unzip \
        nodejs \
        npm \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP dependencies
RUN composer install

# Install Node.js dependencies
RUN npm install

# Build the final image
FROM php:7.4-apache

# Copy only the necessary files from the builder image
COPY --from=builder /var/www/html /var/www/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
