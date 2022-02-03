#!/usr/bin/env bash
set -e

POSTGRES="psql --username \"${POSTGRESQL_USER}\""

echo "Creating database: ${POSTGRESQL_DATABASE}"

[[ "${POSTGRESQL_DATABASE}" == *'"'* ]] && {
  echo "Invalid database name" 1>&2
  exit 1
}

[[ "${POSTGRESQL_USER}" == *'"'* ]] && {
  echo "Invalid user name" 1>&2
  exit 1
}

$POSTGRES <<EOSQL
CREATE DATABASE "${POSTGRESQL_DATABASE}" OWNER "${POSTGRESQL_USER}";
EOSQL
