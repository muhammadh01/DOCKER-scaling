FROM ubuntu

ARG packages="love with docker"
RUN echo "Hunter is in ${packages}"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt install -y \
        nano \
	nginx  

COPY /conf.d/reverse-ser.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
COPY mySite /var/www/html/mySite
COPY Web /var/www/html/Web

EXPOSE 80/tcp
EXPOSE 80/udp
EXPOSE 443/tcp
EXPOSE 443/udp

ENTRYPOINT ["nginx"]

CMD ["-g","daemon off;"]
