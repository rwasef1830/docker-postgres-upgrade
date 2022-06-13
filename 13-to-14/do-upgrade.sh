#!/bin/sh
PG_SUPERUSER=${PG_SUPERUSER?Specify PG_SUPERUSER}
docker build . -t pgroonga-migrate-13-to-14:latest
docker run --rm -v `pwd`/postgres-13:/var/lib/postgresql/13/data -v `pwd`/postgres-14:/var/lib/postgresql/14/data \
	-e POSTGRES_INITDB_ARGS="-U $PG_SUPERUSER" pgroonga-migrate-13-to-14:latest -U $PG_SUPERUSER
