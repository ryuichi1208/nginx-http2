FROM nginx:1.19.7

WORKDIR /etc/nginx
RUN openssl genrsa 2048 > server.key \
		&& openssl req -new -key server.key -subj "/C=JP/ST=Tokyo-to/L=Minato-ku/O=ICS inc./OU=/CN=ics.media" > server.csr \
		&& openssl x509 -days 3650 -req -signkey server.key < server.csr > server.crt

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/local/nginx/html/index.html
