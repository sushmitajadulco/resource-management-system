DROP SCHEMA IF EXISTS rmsdb;

CREATE SCHEMA rmsdb;

DROP TABLE IF EXISTS rmsdb.projects;

CREATE TABLE rmsdb.projects (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO rmsdb.projects ( name, description) VALUES ('Artemis', 'volunteer application');
INSERT INTO rmsdb.projects ( name, description) VALUES ('Attache', 'attache project desciption');
INSERT INTO rmsdb.projects ( name, description) VALUES ('Opentides', 'opentides project description');
INSERT INTO rmsdb.projects ( name, description) VALUES ('Racks', 'racks project description');
INSERT INTO rmsdb.projects ( name, description) VALUES ('DOJ', 'DOJ project description');


DROP TABLE IF EXISTS rmsdb.levels;

CREATE TABLE rmsdb.levels (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO rmsdb.levels ( name, description) VALUES ('Senior', 'senior status is given to experienced employers');
INSERT INTO rmsdb.levels ( name, description) VALUES ('Junior', 'new employees who have completed their training.');
INSERT INTO rmsdb.levels ( name, description) VALUES ('Mid', 'mid level employees are more experienced than junior employees');
INSERT INTO rmsdb.levels ( name, description) VALUES ('Trainee', 'employees in training');

DROP TABLE IF EXISTS rmsdb.designation;

CREATE TABLE rmsdb.designations (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO rmsdb.designations ( name, description) VALUES ('QA Tester', 'quality assuarance tester');
INSERT INTO rmsdb.designations ( name, description) VALUES ('Java Developer', 'full stack java developers');
INSERT INTO rmsdb.designations ( name, description) VALUES ('iOS Developer', 'iOs developers');	
INSERT INTO rmsdb.designations ( name, description) VALUES ('Project Manager', 'speaks to clients of each project');
INSERT INTO rmsdb.designations ( name, description) VALUES ('UI/UX Designer', 'designs the UI and UX of applications');

DROP TABLE IF EXISTS rmsdb.employees;

CREATE TABLE rmsdb.employees (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    designationID BIGINT NOT NULL,
	levelID BIGINT NOT NULL,
	projectID BIGINT NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (projectID) references employees(id),
	FOREIGN KEY (levelID) references levels(id),
	FOREIGN KEY (designationID) references designations(id)
);

DROP USER IF EXISTS 'rms-user'@'%';

CREATE USER 'rms-user'@'%' IDENTIFIED BY 'p4ssw0rd';

GRANT ALL PRIVILEGES ON rmsdb.* TO 'rms-user'@'%';

GRANT INSERT, UPDATE, SELECT, DELETE ON rmsdb.* TO 'rms-user'@'%';

FLUSH PRIVILEGES;
