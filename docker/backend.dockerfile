FROM php:8.3-fpm
ARG HOST_UID=1000
ARG HOST_USER=user

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    openssh-server \
    curl \
    git \
    supervisor \
    sudo \
    nano \
    cron \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions

RUN install-php-extensions \
    bcmath \
    exif \
    intl \
    mbstring \
    mcrypt \
    memcached \
    oauth \
    opcache \
    pcntl \
    pdo \
    pdo_mysql \
    redis \
    soap \
    sockets \
    xml \
    xsl \
    zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
RUN apt-get update && apt-get install -y nodejs
RUN npm install -g npm
RUN npm install -g pnpm

RUN useradd -G www-data,root -u $HOST_UID -d /home/$HOST_USER $HOST_USER
RUN mkdir -p /home/$HOST_USER/.composer && \
    chown -R $HOST_USER:$HOST_USER /home/$HOST_USER && \
    chown -R $HOST_USER:$HOST_USER /var/www

WORKDIR /var/www/html
USER $HOST_USER
