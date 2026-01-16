#!/bin/bash

echo "TEST: \l - list of all available databases\n"
docker exec -i postgres psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -c "\l"