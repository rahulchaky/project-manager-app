DROP DATABASE IF EXISTS proj_man;
CREATE DATABASE proj_man;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;

\connect proj_man

CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
	username TEXT NOT NULL,
	password TEXT NOT NULL
);

CREATE TABLE permissions (
	permission_id SERIAL PRIMARY KEY,
	project_id INT,
	user_id INT
);

CREATE TABLE projects (
	project_id SERIAL PRIMARY KEY,
	project_name TEXT NOT NULL,
	status_of_project TEXT,
	description_of_project TEXT
);

CREATE TABLE tasks (
	task_id SERIAL PRIMARY KEY,
	project_id INT NOT NULL,
	task_name TEXT NOT NULL,
	status_of_task TEXT,
	description_of_task TEXT
);

CREATE TABLE bugs (
	bug_id SERIAL PRIMARY KEY,
	task_id INT NOT NULL,
	type_of_bug TEXT NOT NULL,
	status_of_bug TEXT,
	description_of_bug TEXT
);

ALTER TABLE permissions
ADD CONSTRAINT fk_perm_users
FOREIGN KEY (user_id)
REFERENCES users (user_id);

ALTER TABLE permissions
ADD CONSTRAINT fk_perm_projects
FOREIGN KEY (project_id)
REFERENCES projects (project_id);

ALTER TABLE tasks
ADD CONSTRAINT fk_tasks_project
FOREIGN KEY (project_id)
REFERENCES projects (project_id);

ALTER TABLE bugs
ADD CONSTRAINT fk_bugs_task
FOREIGN KEY (task_id)
REFERENCES tasks (task_id);

INSERT INTO users (username, password) VALUES ('admin', 'admin');

INSERT INTO projects (project_name) VALUES ('Project Manager');

INSERT INTO permissions (project_id, user_id) VALUES (1, 1);

INSERT INTO tasks (project_id, task_name) VALUES (1, 'Setup');

INSERT INTO bugs (task_id, type_of_bug, status_of_bug) VALUES (1, 'Testing', 'Closed');