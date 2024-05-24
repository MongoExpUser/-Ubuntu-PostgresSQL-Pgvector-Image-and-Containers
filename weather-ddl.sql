
-- create extension
CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS sslinfo;
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- schema/namepace
CREATE SCHEMA IF NOT EXISTS weather AUTHORIZATION postgres;

-- weather user table
DROP TABLE IF EXISTS weather.user CASCADE;
CREATE TABLE IF NOT EXISTS weather.user (
  id INTEGER PRIMARY KEY NOT NULL GENERATED ALWAYS  AS IDENTITY, 
  username VARCHAR(30) NOT NULL, 
  email VARCHAR(40) NOT NULL, 
  details JSONB NOT NULL, 
  UNIQUE (email)
);

-- weather info table
DROP TABLE IF EXISTS weather.info CASCADE;
CREATE TABLE IF NOT EXISTS weather.info (
  id INTEGER PRIMARY KEY NOT NULL GENERATED ALWAYS  AS IDENTITY, 
  createdon TIMESTAMP NOT NULL, 
  uid VARCHAR(36) NOT NULL, 
  details JSONB NOT NULL, 
  UNIQUE (uid)
);
