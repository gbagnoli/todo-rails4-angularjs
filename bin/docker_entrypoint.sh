#!/bin/bash

set -u
set -e

PGADDR=$DB_1_PORT_5432_TCP_ADDR
PGPORT=$DB_1_PORT_5432_TCP_PORT
PGDBNAME="${DATABASE_NAME:-todo}"
PGUSER="${DATABASE_USER:-postgres}"

# export database configuration for rails.
export DATABASE_URL="postgresql://${PGUSER}@${PGADDR}:${PGPORT}/${PGDBNAME}"

# exec what the user wants
exec "$@"
