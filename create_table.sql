DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hired DATE);

CREATE TABLE dept_emp (
	dept_emp_id SERIAL PRIMARY KEY NOT NULL,
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL REFERENCES departments(dept_no),
	from_date DATE,
	to_date DATE);

CREATE TABLE dept_manager (
	dept_manager_id SERIAL PRIMARY KEY NOT NULL,
	dept_no VARCHAR NOT NULL REFERENCES departments(dept_no),
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	from_date DATE,
	to_date DATE);

CREATE TABLE salaries (
	salaries_id SERIAL PRIMARY KEY NOT NULL,
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	salary DEC,
	from_date DATE,
	to_date DATE);

CREATE TABLE titles (
	titles_id SERIAL PRIMARY KEY NOT NULL,
	emp_no INT NOT NULL REFERENCES employees(emp_no),
	title VARCHAR,
	from_date DATE,
	to_date DATE);
	
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;