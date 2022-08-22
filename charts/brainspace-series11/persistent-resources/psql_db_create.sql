CREATE USER brainspace PASSWORD 'brainspace1' CREATEDB;
SET ROLE brainspace;
CREATE DATABASE brainspace;
\connect brainspace;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";