FROM sameersbn/ubuntu:14.04.20150712
MAINTAINER mkimura3

RUN apt-get update \
 && apt-get install -y mysql-server \
 && rm -rf /var/lib/mysql/mysql \
 && rm -rf /var/lib/mysql/* \
 && rm -rf /var/lib/apt/lists/* # 20150712

RUN rm -f /etc/mysql/conf.d/mysqld_safe_syslog.cnf

ADD start /start
RUN chmod 755 /start

EXPOSE 3306

VOLUME ["/var/lib/mysql"]
VOLUME ["/run/mysqld"]

CMD ["/start"]
