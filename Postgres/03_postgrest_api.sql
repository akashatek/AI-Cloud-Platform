--
-- File: postgres.sql
--
-- This script sets up a basic schema, role, and user for a PostgREST API.
-- It's intended to be run by a PostgreSQL superuser.
--

-- 1. Create a schema for the API to live in.
--    This helps to logically separate the API-facing tables from other
--    database objects.
CREATE SCHEMA api;

-- 2. Create a dedicated role for the API.
--    This role will be used by PostgREST to connect to the database.
--    We will grant it permissions on the 'api' schema later.
CREATE ROLE api_role;

-- 3. Create a user for the API and assign the role.
--    The user 'api_user' will authenticate with this password.
CREATE USER api_user WITH PASSWORD 'api_password';
GRANT api_role TO api_user;

-- 4. Grant USAGE on the 'api' schema to the API role.
--    This allows the role to access objects within the schema.
GRANT USAGE ON SCHEMA api TO api_role;

-- 5. Set the default role for the API user.
--    This ensures that when 'api_user' connects, it automatically
--    assumes the 'api_role' permissions.
ALTER ROLE api_user SET role = api_role;

-- 6. Grant execute permissions on all functions in the 'api' schema.
--    This is useful if you plan to expose functions as API endpoints.
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA api TO api_role;

-- 7. Grant SELECT, INSERT, UPDATE, DELETE on all tables in the 'api' schema.
--    This is the core permission set needed for a standard REST API.
ALTER DEFAULT PRIVILEGES IN SCHEMA api
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO api_role;