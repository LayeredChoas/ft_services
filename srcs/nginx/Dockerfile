# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayennoui <ayennoui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/26 17:30:07 by ayennoui          #+#    #+#              #
#    Updated: 2020/11/06 20:42:23 by ayennoui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
RUN apk update
RUN apk add openrc && apk add nginx openssl openssh supervisor
ADD /srcs/nginx.conf		/etc/nginx/nginx.conf
ADD /srcs/nginx_run.sh 			/srcs/nginx_run.sh
ADD /srcs/index.html            /www/index.html
ADD /srcs/telegraf.conf         /etc/telegraf/telegraf.conf
ADD /srcs/supervisord.conf     /etc/supervisord.conf
ADD /srcs/run1.sh     run1.sh
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN openrc &> /dev/null
RUN touch /run/openrc/softlevel
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=Ayoub"
EXPOSE 80 443 22
RUN ssh-keygen -A
RUN adduser -D admin
RUN echo "admin:admin" | chpasswd
RUN sh ./srcs/nginx_run.sh
CMD ["sh", "run1.sh"]
