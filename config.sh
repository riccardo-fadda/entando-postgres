#!/usr/bin/env bash
set -e

sed -ri "s/#log_statement = 'none'/log_statement = 'all'/g" /var/lib/pgsql/data/postgresql.conf
sed -ri "s/#log_destination = 'syslog'/log_destination = 'all'/g" c