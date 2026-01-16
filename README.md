# DockerDesktopEnvironment

Table Of Content
 * [Services](#services)
 * [Configuration](#configuration)
 * [Usage](#usage)
 
<a id="services"></a>
## Services

| Services  | Description  |
|---|---|
| ![ollama logo](./assets/logo-ollama.png)  | [Ollama](#ollama) is the engine that brings large language models (LLMs) to your desktop. It allows you to download, run, and manage open-source models like Llama 3 directly on your local machine, eliminating the need for expensive cloud services. Ollama simplifies the entire process, making it easy to experiment with different models for your AI applications.  |
| ![postgres logo](./assets/logo-postgres.png)  | [Postgres](#postgres) is a powerful, open-source relational database. While it's known for its reliability and robustness in storing traditional, structured data, it also plays a critical role in modern AI stacks. In this context, Postgres is used to manage the metadata and structured information associated with your AI application, providing a solid foundation for user data, logs, and other critical backend needs.  |
| ![postgrest logo](./assets/logo-postgrest.png)  | [PostgREST](#postgrest) is a standalone web server that turns your PostgreSQL database directly into a RESTful API. The structural constraints and permissions in the database determine the API endpoints and operations.  |
| ![swagger logo](./assets/logo-swagger.png)  | [Swagger](#swagger) enables design, governance, and testing across the full AI-enabled API lifecycle, ensuring quality at every step.
Build APIs ready for humans, LLMs, agents, and continuous innovation.  |

<a id="configuration"></a>
## Configuration

Copy **.env_dev** or **.env_prd** to a new **.env** file.   
Update the corresponding environment passwords as required `openssl rand -base64 32`.
```
# POSTGRES
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=default
POSTGRES_HOST=postgres
POSTGRES_URI=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_DB}
...
```

<a id="usage"></a>
## Usage

```
Usage: setup.sh <service_name> <status>
   - <service_name> is: ollama, postgres
   - <status> is one of: start, stop, delete, test
```

<a id="ollama"></a>
## Ollama

```
> setup.sh ollama test

TEST: list of all available llms in ollama
NAME                        ID              SIZE      MODIFIED           
mxbai-embed-large:latest    468836162de7    669 MB    About a minute ago    
tinyllama:1.1b              2644915ede35    637 MB    About a minute ago    
llama3.2:1b                 baf6a787fdff    1.3 GB    About a minute ago   
```

<a id="postgres"></a>
## Postgres

```
> setup.sh postgres test   

TEST: \l - list of all available databases
                                                    List of databases
   Name    |  Owner   | Encoding | Locale Provider |  Collate   |   Ctype    | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+------------+------------+--------+-----------+-----------------------
 default   | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | 
 postgres  | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | 
 template0 | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | =c/postgres          +
           |          |          |                 |            |            |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | =c/postgres          +
           |          |          |                 |            |            |        |           | postgres=CTc/postgres
(4 rows)
```

<a id="postgrest"></a>
## PostgREST

```bash
> setup.sh postgrest test

TEST: GET /todos - retrieve all todos

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

TEST: POST /todos - create a new todo


TEST: GET /todos - retrieve specific todo (id=3)

[
  {
    "id": 3,
    "done": false,
    "task": "do bad thing",
    "due": null
  }
]

TEST: PATCH /todos - update a specific todo (change from bad to good)


TEST: DELETE /todos - delete a specific todo
```

<a id="swagger"></a>
## Swagger

![swagger screenshot](./assets/swagger-screenshot.png)

Reach out to URL: [http://localhost:8080/](http://localhost:8080/)

