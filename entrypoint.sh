#!/bin/bash

set -e

if [ "$URL_PREFIX" = "/" ]
then
  ln -s /usr/src/CGP /var/www/html
else
  mkdir -p /var/www/html$(dirname $URL_PREFIX)
  ln -s /usr/src/CGP /var/www/html${URL_PREFIX}
fi


if [ -z "$@" ]; then
  exec apache2-foreground
else
  exec $@
fi
