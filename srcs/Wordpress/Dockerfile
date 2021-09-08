# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayennoui <ayennoui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/30 16:20:49 by ayennoui          #+#    #+#              #
#    Updated: 2020/11/06 20:43:26 by ayennoui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM alpine:latest
ADD /srcs/nginx.conf		    /etc/nginx/nginx.conf
ADD /srcs/wp-config.php			/wp-config.php
ADD /srcs/setup.sh 			    /setup.sh
ADD /srcs/telegraf.conf         /etc/telegraf/telegraf.conf
ADD /srcs/supervisord.conf     /etc/supervisord.conf
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN chmod +x 				    /setup.sh
RUN sh setup.sh
EXPOSE 5050
CMD [ "/usr/bin/supervisord"]