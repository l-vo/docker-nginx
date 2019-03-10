# Nginx docker container

This container use the official Nginx docker image (version 1.15.9) but with the config `server_tokens` to `off`.
This configuration leads to not display Nginx version on error pages for instance.

The built image is in the [official Docker registry](https://hub.docker.com/r/lvo9/mysql/):
```bash
$ docker pull lvo9/nginx
```

You can refer to the [official documentation](https://hub.docker.com/_/nginx) for using the container.