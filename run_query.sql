-- 1 List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary
FROM
	employees e,
	salaries s
WHERE
	e.emp_no = s.emp_no
;

-- 2 List employees who were hired in 1986. 
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	e.hired
FROM
	employees e
WHERE
	EXTRACT(YEAR FROM e.hired) =  '1986'
ORDER BY 4
;

-- 3 List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	dm.dept_no,
	d.dept_name,
	e.emp_no,
	e.first_name,
	e.last_name,
	dm.from_date,
	dm.to_date
FROM	
	employees e,
	dept_manager dm,
	departments d
WHERE
	dm.dept_no = d.dept_no
AND dm.emp_no = e.emp_no
;

-- 4 List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM	
	employees e,
	departments d,
	dept_emp de
WHERE
	e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
;

-- 5 List all employees whose first name is "Hercules" and last names begin with "B."
SELECT	
	e.first_name,
	e.last_name
FROM
	employees e
WHERE
	e.first_name = 'Hercules'
AND substr(e.last_name, 1, 1) = 'B'
;

-- 6 List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM	
	employees e,
	departments d,
	dept_emp de
WHERE
	e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
AND d.dept_name = 'Sales'
;

-- 7 List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM	
	employees e,
	departments d,
	dept_emp de
WHERE
	e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
AND d.dept_name IN ('Sales', 'Development')
;

-- 8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	e.last_name,
	COUNT(e.last_name)
FROM
	employees e
GROUP BY e.last_name
ORDER BY e.last_name DESC
;