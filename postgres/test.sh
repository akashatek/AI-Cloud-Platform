#!/bin/bash

echo "TEST: \l - list of all available databases"
docker exec -i postgres env PGPASSWORD="${POSTGRES_PASSWORD}" psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -c "\l"
