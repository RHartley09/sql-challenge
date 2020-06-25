SELECT emp_no
FROM employees
WHERE 

SELECT *
FROM

SELECT emp_no, first_name, last_name, sex
FROM employees
WHERE emp_no IN (
 SELECT emp_no

SELECT emp_no, first_name, last_name, sex
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary IN(
		SELECT salary
		FROM salaries
		WHERE emp_no = salary));

SELECT *
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary IN(
		SELECT salary
		FROM salaries
		WHERE salary IN(
			SELECT salary
			FROM salaries)));

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = '%1986%';

SELECT *
FROM dept_emp
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE emp_no IN (
		SELECT emp_no
		FROM dept_manager));

SELECT *
FROM deparments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_emp
	WHERE emp_no IN employees);

SELECT *
FROM departments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_emp
	WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE emp_no IN (
			SELECT emp_no
			FROM employees
			WHERE first_name IN employees)));


-- Ask for help on step 6
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name LIKE 'Sales'));
		
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
dept_emp.emp_no,
dept_emp.dept_no,
departments.dept_name
FROM departments
WHERE dept_name LIKE 'Sales';

