#!/bin/bash

export $(grep -v '^#' .env | xargs)

usage() {
   echo "Usage: $0 <service_name> <action>"
   echo "   - <service_name> is: ollama, postgres"
   echo "   - <action> is one of: start, stop, delete, test"
   exit 1
}

# Check if $1 does NOT match the available services
services=("ollama" "postgres")
if [[ ! " ${services[*]} " =~ " ${1} " ]]; then
   echo "Value '$1' is not in the array."
   usage
fi

# Check if $2 does NOT match the available actions
actions=("start" "stop" "delete" "test")
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