# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx_run.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayennoui <ayennoui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/28 16:33:42 by ayennoui          #+#    #+#              #
#    Updated: 2020/11/07 14:33:55 by ayennoui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_amd64.tar.gz
tar -xvf telegraf-1.16.1_linux_amd64.tar.gz
mv telegraf-1.16.1 telegraf
openrc &> /dev/null
touch /run/openrc/softlevel