# Nginx production docker container

This container use the official Nginx docker image but is modified to be more suitable for production environement:

- The config `server_tokens` is set to `off` (leads to not display Nginx version on error pages for instance)
- The image uses a non privilegied user `user1`

The built image is in the [official Docker registry](https://hub.docker.com/r/lvo9/mysql/):
```bash
$ docker pull lvo9/nginx
```

If you want to create a Dockerfile based on this image, maybe you will have to re-switch to the `root` user to execute commands which need privilegied access. Don't forget to swith again to `user1` and keep in mind each command executed after switching to `user1` needs to be preceded by sudo and to be referenced in `/etc/sudoers` if it needs privilegied permissions. For instance:
```Dockerfile
FROM lvo9/nginx

USER root

RUN my-command-that-needs-root-permissions
# ...

RUN echo "user1 ALL = (root) NOPASSWD: /run.sh" >>/etc/sudoers

USER user1

CMD ["sudo", "/run.sh"]
```

For the rest, it works like the original Nginx image. You can refer to the [official documentation](https://hub.docker.com/_/nginx) for more information.

Note that the Docker repository owns the same version tag as the official image on which it is based (from 1.15.9 version).