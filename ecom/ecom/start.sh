#!/usr/bin/env bash
set -e

echo "Installing PHP dependencies…"
composer install --no-dev --working-dir=/var/www/html

echo "Caching config & routes…"
php artisan config:cache
php artisan route:cache

echo "Running migrations…"
php artisan migrate --force

# Nginx + PHP-FPM start automatically in base image 