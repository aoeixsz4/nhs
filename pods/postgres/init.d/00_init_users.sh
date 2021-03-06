#!/usr/bin/env sh
set -e
POSTGRES="psql -U ${POSTGRES_USER}"
$POSTGRES <<-EOSQL
  CREATE ROLE nhdbfeeder WITH PASSWORD 'feed' LOGIN;
EOSQL
$POSTGRES <<-EOSQL
  CREATE ROLE nhdbstats WITH PASSWORD 'stat' LOGIN;
EOSQL
$POSTGRES <<-EOSQL
  GRANT ALL ON DATABASE ${POSTGRES_DB} TO nhdbfeeder;
  GRANT CONNECT,SELECT ON ${POSTGRES_DB} TO nhdbstats;
EOSQL
