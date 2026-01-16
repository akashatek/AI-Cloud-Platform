#!/bin/bash

export $(grep -v '^#' .env | xargs)

services=("ollama" "postgres" "postgrest")
actions=("start" "stop" "delete" "test")

usage() {
   echo "Usage: $0 <service_name> <action>"
   echo "   - <service_name> is: ${services[*]}"
   echo "   - <action> is one of: ${actions[*]}"
   exit 1
}

# Check if $1 does NOT match the available services
if [[ ! " ${services[*]} " =~ " ${1} " ]]; then
   echo "Value '$1' is not in the array."
   usage
fi

# Check if $2 does NOT match the available actions
if [[ ! " ${actions[*]} " =~ " ${2} " ]]; then
   echo "Value '$2' is not in the array."
   usage
fi

case "$2" in
   start)
      docker compose -f ./$1/docker-compose.yaml up -d
      ;;
   stop)
      docker compose -f ./$1/docker-compose.yaml down
      ;;
   delete)
      docker compose -f ./$1/docker-compose.yaml down -v
      ;;
   test)
      ./$1/test.sh
      ;;
esac

exit 0