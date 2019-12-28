SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;

-- Salaries of employees
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
FROM employees 
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;

-- Employees hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date 
FROM employees 
WHERE hire_date >= '1986-01-01' 
AND hire_date < '1987-01-01';

-- Managers info
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments 
INNER JOIN dept_manager 
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees 
ON dept_manager.emp_no = employees.emp_no;

-- Employees and department names
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees 
ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments 
ON dept_emp.dept_no = departments.dept_no;

-- Employees first name 'Hercules' and last name begins with 'B'
SELECT employees.first_name, employees.last_name
FROM employees 
WHERE first_name = 'Hercules' 
AND last_name 
LIKE 'B%';

-- Employees in sales
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees 
ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- Employees in sales OR development
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees 
ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- Frequency count of last names in descending order
SELECT employees.last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
