#!/bin/bash

MIMIC_IV_DATA_DIR=~/physionet.org/files/mimiciv/3.0/gzip
MIMIC_IV_SQL_DIR=../sql
POSTGRES_CONTAINER=mimiciv-full-pg

export MIMIC_IV_DATA_DIR=$MIMIC_IV_DATA_DIR
export MIMIC_IV_SQL_DIR=$MIMIC_IV_SQL_DIR

if [ "$(docker inspect -f '{{.State.Running}}' "${POSTGRES_CONTAINER}" 2>/dev/null || true)" != 'true' ]; then
  docker compose -f ./compose.yml up -d
fi

sleep 1

#DB_NAME=mimiciv
#docker exec $POSTGRES_CONTAINER createdb -U postgres $DB_NAME
#docker exec $POSTGRES_CONTAINER \
#  psql -U postgres -d $DB_NAME -v ON_ERROR_STOP=1 -f /mimic-iv/sql/create.sql
#docker exec $POSTGRES_CONTAINER \
#  psql -U postgres -d $DB_NAME -v ON_ERROR_STOP=1 -v mimic_data_dir=/mimic-iv/data -f /mimic-iv/sql/load_gz.sql
#docker exec $POSTGRES_CONTAINER \
#  psql -U postgres -d $DB_NAME -v ON_ERROR_STOP=1 -v mimic_data_dir=/mimic-iv/data -f /mimic-iv/sql/constraint.sql
#docker exec $POSTGRES_CONTAINER \
#  psql -U postgres -d $DB_NAME -v ON_ERROR_STOP=1 -v mimic_data_dir=/mimic-iv/data -f /mimic-iv/sql/index.sql