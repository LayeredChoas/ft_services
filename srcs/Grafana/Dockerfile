# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayennoui <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/06 20:47:16 by ayennoui          #+#    #+#              #
#    Updated: 2020/11/06 20:47:17 by ayennoui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
RUN apk update
RUN apk add openrc supervisor
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.0-beta2.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.0-beta2.linux-amd64.tar.gz
ADD /srcs/grafana_run.sh     /grafana_run.sh
ADD /srcs/setup.sh          /setup.sh
ADD /srcs/telegraf.conf     /etc/telegraf/telegraf.conf
ADD /srcs/supervisord.conf     /etc/supervisord.conf
RUN sh ./setup.sh
ADD /srcs/grafana.db            /grafana/data/grafana.db
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN sh grafana_run.sh
EXPOSE 3000
CMD [ "/usr/bin/supervisord"]
