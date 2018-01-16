FROM alpine:latest
LABEL maintainer="gwaewion@gmail.com"
EXPOSE 3306
VOLUME /data
COPY docker-entrypoint.sh /root

ENV DB_DATA_PATH /data
ENV DB_ROOT_PASSWORD P@ssw0rd

RUN apk update
RUN apk add mariadb mariadb-client
RUN mkdir /run/mysqld
RUN chown mysql:mysql /run/mysqld
RUN chown mysql:mysql /data
RUN sed -i 's/\[mysqld\]/\[mysqld\]\nbind-address\t= 0.0.0.0/' /etc/mysql/my.cnf

CMD ["sh", "/root/docker-entrypoint.sh"]