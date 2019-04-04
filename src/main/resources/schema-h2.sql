CREATE TABLE employees (
    id BIGINT NOT NULL AUTO_INCREMENT,
    employee_no VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    job_title VARCHAR(255) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(employee_no)
);
