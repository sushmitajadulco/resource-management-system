DROP SCHEMA IF EXISTS rmsdb;

CREATE SCHEMA rmsdb;


DROP TABLE IF EXISTS rmsdb.project;

CREATE TABLE rmsdb.project (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
	start_date Date,
	end_date Date,
    PRIMARY KEY (id)
);

INSERT INTO rmsdb.project ( name, description, start_date, end_date) VALUES ('Artemis', 'volunteer application', '01/11/2019', '10/11/2019');
INSERT INTO rmsdb.project ( name, description, start_date, end_date) VALUES ('Attache', 'attache project desciption', '01/11/2019', '10/11/2019');
INSERT INTO rmsdb.project ( name, description, start_date, end_date) VALUES ('Opentides', 'opentides project description', '01/11/2019', '10/11/2019');
INSERT INTO rmsdb.project ( name, description, start_date, end_date) VALUES ('Racks', 'racks project description', '01/11/2019', '10/11/2019');
INSERT INTO rmsdb.project ( name, description, start_date, end_date) VALUES ('DOJ', 'DOJ project description', '01/11/2019', '10/11/2019');


DROP TABLE IF EXISTS rmsdb.level;

CREATE TABLE rmsdb.level (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO rmsdb.level ( name, description) VALUES ('Senior', 'senior status is given to experienced employers');
INSERT INTO rmsdb.level ( name, description) VALUES ('Junior', 'new employees who have completed their training.');
INSERT INTO rmsdb.level ( name, description) VALUES ('Mid', 'mid level employees are more experienced than junior employees');
INSERT INTO rmsdb.level ( name, description) VALUES ('Trainee', 'employees in training');

DROP TABLE IF EXISTS rmsdb.designation;

CREATE TABLE rmsdb.designation (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO rmsdb.designation ( name, description) VALUES ('QA Tester', 'quality assuarance tester');
INSERT INTO rmsdb.designation ( name, description) VALUES ('Java Developer', 'full stack java developers');
INSERT INTO rmsdb.designation ( name, description) VALUES ('iOS Developer', 'iOs developers');
INSERT INTO rmsdb.designation ( name, description) VALUES ('Project Manager', 'speaks to clients of each project');
INSERT INTO rmsdb.designation ( name, description) VALUES ('UI/UX Designer', 'designs the UI and UX of applications');


DROP TABLE IF EXISTS rmsdb.employee;

CREATE TABLE rmsdb.employee (
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

CREATE USER 'rms-user'@'%' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON rmsdb.* TO 'rms-user'@'%';

GRANT INSERT, UPDATE, SELECT, DELETE ON rmsdb.* TO 'rms-user'@'%';

FLUSH PRIVILEGES;


