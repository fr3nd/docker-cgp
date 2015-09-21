# Collectd Graph Panel (CGP) docker image

## Description

Collectd Graph Panel (CGP) is a web-based front-end for RRD data collected by
collectd.

This image allows you to run CGP in a Docker container.

## How to run it

Every environment variable passed to docker prefixed with "cgp_" will be
converted to a configuration parameter in config.php.

See https://github.com/pommi/CGP/blob/master/conf/config.php for all available
options.

```
docker run \
  -it \
  --rm \
  -v /var/lib/collectd/rrd:/var/lib/collectd/rrd:ro \
  -e cgp_graph_type=hybrid \
  -p 8080:80 \
  fr3nd/cgp
```

In case you run CGP behind an apache proxy, the URL_PREFIX environment variable
defines the prefix location where to mount the web application.

For example, this command will serve the application under 
http://localhost:8080/cgp

```
docker run \
  -it \
  --rm \
  -v /var/lib/collectd/rrd:/var/lib/collectd/rrd:ro \
  -e cgp_graph_type=hybrid \
  -e URL_PREFIX=/cgp \
  -p 8080:80 \
  fr3nd/cgp
```
