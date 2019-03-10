FROM nginx:1.15.9

RUN sed -i -re "s/^(\s+)default_type\s+application\/octet-stream;/\0\n\1server_tokens off;/" /etc/nginx/nginx.conf