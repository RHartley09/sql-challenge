-- Table Checks

SELECT *
FROM departments;

SELECT * 
FROM dept_emp;

SELECT *
FROM dept_manager;

SELECT *
FROM employees;

SELECT *
FROM salaries;

SELECT *
FROM titles;


-- *Step 1*	

SELECT employees.emp_no,
employees.first_name,
employees.last_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- *Step 2*

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986%';

-- *Step 3*

SELECT dept_manager.dept_no,
dept_manager.emp_no,
departments.dept_name,
employees.last_name,
employees.first_name
FROM ((dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no)
INNER JOIN employees ON
employees.emp_no = dept_manager.emp_no);

-- *Step 4*

SELECT employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
FROM ((departments
	   INNER JOIN dept_emp ON
	   departments.dept_no = dept_emp.dept_no)
	   INNER JOIN employees ON
	   employees.emp_no = dept_emp.emp_no);

-- *Step 5*

SELECT *
FROM employees
WHERE first_name LIKE '%Hercules%'
AND last_name LIKE '%B%';
	   
-- *Step 6*
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name LIKE 'Sales'));

-- Okay create a new table
CREATE TABLE sales_table
AS
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name LIKE 'Sales'));
		
-- Check

SELECT *
FROM sales_table;

-- Now create another one

CREATE TABLE sales_dept
AS
SELECT *
FROM dept_emp
WHERE dept_no = 'd007';

-- Check

SELECT *
FROM sales_dept;

-- Join tables

-- I joined my newly created tables with the existing 'departments' table to create this output

SELECT sales_table.first_name,
sales_table.last_name,
sales_table.emp_no,
departments.dept_name
FROM ((departments
	   INNER JOIN sales_dept ON
	   departments.dept_no = sales_dept.dept_no)
	   INNER JOIN sales_table ON
	   sales_table.emp_no = sales_dept.emp_no);
		
-- *Step 7*

CREATE TABLE sales_dev
AS
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name IN('Sales', 'Development')));
		
-- Check

SELECT *
FROM sales_dev;

-- Another table for Sales and Development dept names

CREATE TABLE sales_dev_dept
AS
SELECT *
FROM dept_emp
WHERE dept_no IN ('d007','d005');

-- Check

SELECT *
FROM sales_dev_dept;

-- Join tables

SELECT sales_dev.first_name,
sales_dev.last_name,
sales_dev.emp_no,
departments.dept_name
FROM ((departments
	   INNER JOIN sales_dev_dept ON
	   departments.dept_no = sales_dev_dept.dept_no)
	   INNER JOIN sales_dev ON
	   sales_dev.emp_no = sales_dev_dept.emp_no);
	   
-- *Step 8*

SELECT last_name, COUNT(last_name) AS "Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Name Count" DESC;