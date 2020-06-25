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

SELECT emp_no, first_name, last_name, sex
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary IN(
		SELECT salary
		FROM salaries));
		
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986%';

SELECT dept_manager.dept_no,
dept_manager.emp_no,
departments.dept_name,
employees.last_name,
employees.first_name
FROM ((dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no),
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no);