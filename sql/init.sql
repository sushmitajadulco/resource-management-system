DROP SCHEMA IF EXISTS rmsdb;

CREATE SCHEMA rmsdb;

DROP TABLE IF EXISTS rmsdb.allocationPercentage;

CREATE TABLE rmsdb.allocationPercentage (
    percentage VARCHAR(50) NOT NULL
    PRIMARY KEY (percentage)
);

INSERT INTO rmsdb.allocationPercentage ( percentage ) VALUES ('0.1'), ('0.25'), ('0.5'), ('0.75');

DROP TABLE IF EXISTS rmsdb.project;

CREATE TABLE rmsdb.project (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
	start_date Date,
	end_date Date,
	is_active char(1),
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
    designation_id BIGINT NOT NULL,
	level_id BIGINT NOT NULL,
	is_employed char(1),
    PRIMARY KEY (id),
	FOREIGN KEY (level_id) references level(id),
	FOREIGN KEY (designation_id) references designation(id)
);

DROP TABLE IF EXISTS rmsdb.allocation;

CREATE TABLE rmsdb.allocation (
    employee_id BIGINT NOT NULL,
    project_id BIGINT NOT NULL,
    start_date Date,
    end_date Date,
    in_project char(1),
    percentage VARCHAR(50) NOT NULL
    PRIMARY KEY (percentage)
);


DROP USER IF EXISTS 'rms-user'@'%';

CREATE USER 'rms-user'@'%' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON rmsdb.* TO 'rms-user'@'%';

GRANT INSERT, UPDATE, SELECT, DELETE ON rmsdb.* TO 'rms-user'@'%';

FLUSH PRIVILEGES;


