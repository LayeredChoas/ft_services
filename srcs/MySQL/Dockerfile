# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayennoui <ayennoui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/06 20:44:55 by ayennoui          #+#    #+#              #
#    Updated: 2020/11/07 13:59:34 by ayennoui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
RUN apk update
RUn apk add mariadb mariadb-client openrc supervisor
ADD /srcs/mysql.sh              /mysql.sh
ADD /srcs/run.sh                /run.sh
ADD /srcs/data.sql              /data.sql
ADD /srcs/telegraf.conf         /etc/telegraf/telegraf.conf
ADD /srcs/supervisord.conf     /etc/supervisord.conf
RUN chmod +x 		            /mysql.sh
RUN chmod +x 		            /run.sh
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN sh mysql.sh
#RUN sh run.sh
CMD ["sh", "run.sh"]
#CMD ["/usr/bin/supervisord"]
