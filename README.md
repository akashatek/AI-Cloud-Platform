# AI-Cloud-Platform-ACP-

## PostgREST

Reference:
 * [dockerhub](https://hub.docker.com/r/postgrest/postgrest)
 * [PostgREST](https://postgrest.org/en/stable/index.html)

Installation 
```
> source ../dev.env

> psql $POSTGRES_URL -f 01_postgrest_api.sql

CREATE SCHEMA
CREATE ROLE
CREATE ROLE
GRANT ROLE
GRANT
ALTER ROLE
GRANT
ALTER DEFAULT PRIVILEGES

> psql $POSTGRES_URL -f 02_postgres_api_todos.sql

CREATE TABLE
INSERT 0 2
```

Testing
```
List all Todos

> curl -s -X GET "http://localhost:3000/todos" | jq .

[
  {
    "id": 1,
    "done": false,
    "task": "finish tutorial 0",
    "due": null
  },
  {
    "id": 2,
    "done": false,
    "task": "pat self on back",
    "due": null
  }
]

List a specific Todo by id.
> curl -s -X GET "http://localhost:3000/todos?id=eq.1" | jq .

[
  {
    "id": 1,
    "done": true,
    "task": "finish tutorial 0",
    "due": null
  }
]

Create a new Todo
> curl -X POST "http://localhost:3000/todos" -H "Content-Type: application/json" -d '{ "task": "example task" }'

Update a Todo
> curl -X PATCH "http://localhost:3000/todos?id=eq.1" -H "Content-Type: application/json"  -d '{ "done": true }'

Delete a Todo
> curl -X DELETE "http://localhost:3000/todos?id=eq.3"

```