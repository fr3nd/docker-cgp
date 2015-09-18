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

ENV CGP_VERSION b24eeac

RUN a2enmod rewrite
RUN rm -rf /var/www/html & mkdir -p /var/www/html
WORKDIR /var/www/html
RUN git clone https://github.com/pommi/CGP.git . && \
    git checkout ${CGP_VERSION} && \
    rm -rf .git
COPY config.local.php /var/www/html/conf/
