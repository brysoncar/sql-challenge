--List the employee number, last name, first name, sex, and salary of each employee 

SELECT
    emp.emp_no,
    emp.last_name,
    emp.first_name,
    emp.sex,
    salaries.salary
FROM
    employees emp
JOIN
    salaries salaries ON emp.emp_no = salaries.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986

SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT
    dept_man.dept_no,
    dept.dept_name,
    dept_man.emp_no AS manager_emp_no,
    emp.last_name AS manager_last_name,
    emp.first_name AS manager_first_name
FROM
    dept_manager dept_man
JOIN
    employees emp ON dept_man.emp_no = emp.emp_no
JOIN
    departments dept ON dept_man.dept_no = dept.dept_no;
	
--	List the department number for each employee along with that employee’s employee number, last name, first name, and department name 

SELECT
    dept_emp.emp_no,
    emp.last_name,
    emp.first_name,
    dept_emp.dept_no,
    dept.dept_name
FROM
    dept_emp dept_emp
JOIN
    employees emp ON dept_emp.emp_no = emp.emp_no
JOIN
    departments dept ON dept_emp.dept_no = dept.dept_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 

SELECT
    dept_emp.emp_no,
    emp.last_name,
    emp.first_name,
    dept_emp.dept_no,
    dept.dept_name
FROM
    dept_emp dept_emp
JOIN
    employees emp ON dept_emp.emp_no = emp.emp_no
JOIN
    departments dept ON dept_emp.dept_no = dept.dept_no;
	
--List each employee in the Sales department, including their employee number, last name, and first name

SELECT
    emp.emp_no,
    emp.last_name,
    emp.first_name
FROM
    employees emp
JOIN
    dept_emp dept_emp ON emp.emp_no = dept_emp.emp_no
JOIN
    departments dept ON dept_emp.dept_no = dept.dept_no
WHERE
    dept.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name


SELECT
    emp.emp_no,
    emp.last_name,
    emp.first_name,
    dept.dept_name
FROM
    employees emp
JOIN
    dept_emp dept_emp ON emp.emp_no = dept_emp.emp_no
JOIN
    departments dept ON dept_emp.dept_no = dept_emp.dept_no
WHERE
    dept.dept_name IN ('Sales', 'Development');
	
--List the frequency counts, in descending order, of all the employee last names

SELECT
    last_name,
    COUNT(*) AS frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency DESC, last_name;