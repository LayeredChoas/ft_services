# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayennoui <ayennoui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/06 20:47:01 by ayennoui          #+#    #+#              #
#    Updated: 2020/11/07 11:46:55 by ayennoui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
RUN apk update
RUN apk add influxdb openrc supervisor
ADD /srcs/influx_run.sh         /influx_run.sh
ADD /srcs/telegraf.conf         /etc/telegraf/telegraf.conf
ADD /srcs/supervisord.conf     /etc/supervisord.conf
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN chmod +x 				/influx_run.sh
EXPOSE 8086
RUN sh influx_run.sh
CMD [ "/usr/bin/supervisord"]
