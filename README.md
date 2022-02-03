# PostgreSQL 14.1 SQL Database Server container image
This container image includes PostgreSQL 14.1 SQL database server for general usage. Users can choose between RHEL(ubi8) and Rocky based images.

## Quick Start
* Clone or download this repository
* Go inside of directory,  `cd entando-postgres`
* Run this command `docker build -f Dockerfile.rocky8 -t (image:tag) .`
* Run this command `docker build -f Dockerfile.ubi8 -t (image:tag) .`

## Environment variables and volumes
The image recognizes the following environment variables that you can set during initialization by passing -e VAR=VALUE to the Docker run command.

```
POSTGRESQL_USER:     User name for PostgreSQL account to be created
POSTGRESQL_PASSWORD: Password for the user account
POSTGRESQL_DB:       Database name
```

You can also set the following mount points by passing the `-v /host/dir:/container/dir:Z` flag to Docker.

* `/var/lib/pgsql/data`
PostgreSQL database directory
