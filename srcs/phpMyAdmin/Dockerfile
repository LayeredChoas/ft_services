# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayennoui <ayennoui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/30 16:20:49 by ayennoui          #+#    #+#              #
#    Updated: 2020/11/04 20:38:42 by ayennoui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM alpine:latest
RUN apk update
RUN apk add openrc && apk add nginx openssl openssh wget supervisor
RUN apk add php7-fpm php7-mcrypt php7-mbstring php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session
ADD /srcs/nginx.conf		    /etc/nginx/nginx.conf
ADD /srcs/php_run.sh 			/srcs/php_run.sh
ADD /srcs/telegraf.conf         /etc/telegraf/telegraf.conf
ADD /srcs/supervisord.conf     /etc/supervisord.conf
RUN chmod +x 				    /srcs/php_run.sh
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN openrc &> /dev/null
RUN touch /run/openrc/softlevel
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /www
COPY /srcs/config.inc.php /www
RUN sh ./srcs/php_run.sh
EXPOSE 5000
CMD [ "/usr/bin/supervisord"]