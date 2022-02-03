#!/bin/sh

# Before PostgreSQL can function correctly, the database cluster must be initialized:
/usr/pgsql-14/bin/initdb -D /var/lib/pgsql/data

# internal start of server in order to allow set-up using psql-client
# does not listen on external TCP/IP and waits until start finishes
/usr/pgsql-14/bin/pg_ctl -D "/var/lib/pgsql/data" -o "-c listen_addresses='*'" -w start

# create a user or role
psql -d postgres -c "CREATE USER ${POSTGRESQL_USER} WITH PASSWORD '${POSTGRESQL_PASSWORD}';" 

# create database 
psql -v ON_ERROR_STOP=1 -d postgres -c "CREATE DATABASE ${POSTGRESQL_DATABASE} OWNER '${POSTGRESQL_USER}';"

# stop internal postgres server
/usr/pgsql-14/bin/pg_ctl -D "/var/lib/pgsql/data" -m fast -w stop -l /var/lib/pgsql/log/stdout

sed -i 's/logging_collector = on/logging_collector = off/g' /var/lib/pgsql/data/postgresql.conf

exec "$@"