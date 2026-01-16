#!/bin/bash

echo -e "TEST: GET /todos - retrieve all todos\n"
curl -s "http://localhost:3000/todos" -X GET | jq .

echo -e "\nTEST: POST /todos - create a new todo\n"
curl -s "http://localhost:3000/todos" -X POST -H "Content-Type: application/json" -d '{"id": 3, "task": "do bad thing"}' | jq .

echo -e "\nTEST: GET /todos - retrieve specific todo (id=3)\n"
curl -s "http://localhost:3000/todos?id=eq.3" -X GET | jq .

echo -e "\nTEST: PATCH /todos - update a specific todo (change from bad to good)\n"
curl -s "http://localhost:3000/todos?id=eq.3" -X PATCH -H "Content-Type: application/json" -d '{"task": "do good thing"}' | jq .

echo -e "\nTEST: DELETE /todos - delete a specific todo\n"
curl -s "http://localhost:3000/todos?id=eq.3" -X DELETE | jq .


