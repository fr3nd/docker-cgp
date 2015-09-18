FROM php:5.6-apache
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN apt-get update && apt-get install -y \
      git \
      rrdtool \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/* && \
      docker-php-ext-install json

RUN a2enmod rewrite
RUN rm -rf /var/www/html & mkdir -p /var/www/html
WORKDIR /var/www/html
RUN git clone https://github.com/pommi/CGP.git . && rm -rf .git
