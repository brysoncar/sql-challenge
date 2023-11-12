--create parent table which will be employees

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex CHAR(1) CHECK (sex IN ('M', 'F')),
    hire_date DATE NOT NULL,
    UNIQUE (emp_title)
);

--create departments table which dept_emp and dept_manager with reference

CREATE TABLE departments (
    dept_no VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR(25) NOT NULL
);

--create tables referencing employees and departments

CREATE TABLE dept_manager (
    emp_no INT PRIMARY KEY,
    dept_no VARCHAR(50) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_emp (
    emp_no INT PRIMARY KEY,
    dept_no VARCHAR(50) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--create tables referencing employees

CREATE TABLE salaries (
    emp_no INT,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255),
    FOREIGN KEY (title) REFERENCES employees(emp_title)
);


-- Load data into employees table
LOAD DATA INFILE 'employees' INTO TABLE employees
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into departments table
LOAD DATA INFILE 'departments' INTO TABLE departments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into dept_manager table
LOAD DATA INFILE 'dept_manager' INTO TABLE dept_manager
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into dept_emp table
LOAD DATA INFILE 'dept_emp.csv' INTO TABLE dept_emp
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into salaries table
LOAD DATA INFILE 'salaries.csv' INTO TABLE salaries
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into titles table
LOAD DATA INFILE 'titles.csv' INTO TABLE titles
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;








