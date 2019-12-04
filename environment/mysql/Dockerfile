FROM mysql:5.7

#ARG MYSQL_DATABASE
#ARG MYSQL_USER
#ARG MYSQL_PASSWORD
#ARG MYSQL_ROOT_PASSWORD
#
#ENV MYSQL_DATABASE=phalcon3
#ENV MYSQL_USER=root
#ENV MYSQL_PASSWORD=753159
#ENV MYSQL_ROOT_PASSWORD=753159
#
#RUN chown -R mysql:mysql /var/run/mysqld/mysqld.sock
RUN sleep 15
RUN /bin/bash -c "/usr/bin/mysqld_safe --skip-grant-tables &"
RUN /bin/bash -c "drop user root@localhost;"
RUN /bin/bash -c "flush privileges;"
RUN /bin/bash -c "create user root@localhost identified by '753159'"

#RUN sleep 15
#RUN rm -rf /var/lib/mysql
#RUN sleep 5
#RUN mkdir -p /var/lib/mysql /var/run/mysqld
#RUN sleep 5
#RUN chown -R mysql:root /var/lib/mysql/
#RUN sleep 5
#RUN chown -R mysql:root /var/run/mysqld/
#RUN sleep 5
#RUN chmod 777 /var/run/mysqld

#ADD dump.sql /etc/mysql/dump.sql
#RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /etc/mysql/dump.sql
#RUN cp /etc/mysql/dump.sql /docker-entrypoint-initdb.d

EXPOSE 33060



