-- Column Checking
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

-- Step 1		
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- Step 2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986%';

-- Step 3
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

-- Tentative Step 4
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
dept_emp.dept_no,
departments.dept_name
FROM ((departments
	   INNER JOIN dept_emp ON
	   departments.dept_no = dept_emp.dept_no)
	   INNER JOIN employees ON
	   employees.emp_no = dept_emp.emp_no);

-- Step 5
SELECT *
FROM employees
WHERE first_name LIKE '%Hercules%'
AND last_name LIKE '%B%';

-- Tentative Step 6
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name LIKE 'Sales'));

-- Better Step 6
SELECT first_name, last_name, emp_no, dept_name
FROM employees, departments
WHERE dept_name LIKE 'Sales';