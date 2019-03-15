FROM nginx

RUN apt-get update && apt-get install -y sudo

RUN sed -i -re "s/^(\s+)default_type\s+application\/octet-stream;/\0\n\1server_tokens off;/" /etc/nginx/nginx.conf

RUN adduser --disabled-password --gecos "" --no-create-home user1

RUN echo "user1 ALL = (root) NOPASSWD: /usr/sbin/nginx" >>/etc/sudoers

USER user1

WORKDIR /etc/nginx

CMD ["sudo", "/usr/sbin/nginx", "-g", "daemon off;"]