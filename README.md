# docker-images

This repository is meant to be a collection of custom Docker images I use. The idea is simple: add the Dockerfile and all other necessary files and then have a GitHub Workfolw build it for you.

You can either get the images from the Packages section or from [DockerHub](https://hub.docker.com/u/fischerfelix).

## nginx-nc (nextcloud)
This image is meant for use when deploying [nextcloud-fpm](https://github.com/nextcloud/docker/tree/master/.examples/docker-compose/insecure/mariadb/fpm).
It provides a standard `nginx:alpine` image with the `nginx.conf` file recommended on the official [GitHub Repo](https://github.com/nextcloud/docker/tree/master/.examples/docker-compose/insecure/mariadb/fpm) (plus correct routing for /.well-known/{webfinger, nodeinfo}).

You might use this image over just building it yourself (i.e. from the official compose file) if, for example you are using a software like portainer that does not (easily) support building automatically/from the compose file directly.

## octoprint-dynamic-usb (octoprint-docker)
This image is a modified version of the official octoprint-docker image. It adds the ability to start the container, even though the printer is not connected. 

In order for this to function, some modifications have to be made to `docker-compose.yml`, so here is the default docker-compose for octoprint with the necessary changes:
```
version: '2.4'

services:
  octoprint:
    image: fischerfelix/octoprint-dynamic-usb
    restart: unless-stopped
    ports:
      - 80:80
    devices:
      - /dev/bus/usb 
    #  - /dev/video0:/dev/video0
    volumes:
      - /run/udev:/run/udev:ro
      - octoprint:/octoprint
    device_cgroup_rules:
      - 'c 188:* rmw'
    # uncomment the lines below to ensure camera streaming is enabled when
    # you add a video device
    #environment:
    #  - ENABLE_MJPG_STREAMER=true
  
  ####
  # uncomment if you wish to edit the configuration files of octoprint
  # refer to docs on configuration editing for more information
  ####

  #config-editor:
  #  image: linuxserver/code-server
  #  ports:
  #    - 8443:8443
  #  depends_on:
  #    - octoprint
  #  restart: unless-stopped
  #  environment:
  #    - PUID=0
  #    - GUID=0
  #    - TZ=America/Chicago
  #  volumes:
  #    - octoprint:/octoprint

volumes:
  octoprint:
```
