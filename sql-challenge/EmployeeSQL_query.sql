--	1.List the following details of each employee: employee number, 
--	last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s 
	ON e.emp_no = s.emp_no;

---------------------
-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.first_name, DATE_part('year', e.hire_date) 
FROM employees e
WHERE date_part('year', e.hire_date) ='1986';

---------------------
--	3. List the manager of each department with the following information: department 
--	number, department name, the manager’s employee number, last name, first name.

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager m
	ON d.dept_no = m.dept_no
JOIN employees e
	ON m.emp_no = e.emp_no;
	
---------------------
--	4. List the department of each employee with the following information: 
--	employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no;

---------------------
--	5. List first name, last name, and sex for employees whose first name 
--	is “Hercules” and last names begin with “B.”

SELECT e.first_name, e.last_name,e.sex
FROM employees e
WHERE e.first_name= 'Hercules'
	AND e.last_name LIKE 'B%';

---------------------
--	6. List all employees in the Sales department, including their employee number,
--	last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_manager m 
	ON e.emp_no = m.emp_no
JOIN departments d
	ON	m.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

---------------------
--	7. List all employees in the Sales and Development departments, including 
--	their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
JOIN dept_manager m 
	ON e.emp_no = m.emp_no
JOIN departments d
	ON	m.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';
	
---------------------
--	8. In descending order, list the frequency count of employee last names, 
--	i.e., how many employees share each last name.

SELECT e.last_name, count(e.last_name) as Last_name_count
FROM employees e
GROUP BY e.last_name
 	ORDER BY e.last_name DESC;


---------------------* END SCRIPT *---------------------


---------------------
-- 	Bonus (Optional)

-- 	As you examine the data, you are overcome with a creeping suspicion that the 
-- 	dataset is fake. You surmise that your boss handed you spurious data in order 
--	to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

-- 	Import the SQL database into Pandas. (Yes, you could read the CSVs directly 
--	in Pandas, but you are, after all, trying to prove your technical mettle.) 
--	This step may require some research. Feel free to use the code below to get 
--	started. Be sure to make any necessary modifications for your username, 
--	password, host, port, and database name:
--    from sqlalchemy import create_engine
--    engine = create_engine('postgresql://localhost:5432/<your_db_name>')
--    connection = engine.connect()

-- Consult SQLAlchemy documentation for more information.

-- If using a password, do not upload your password to your GitHub repository. See https://www.youtube.com/watch?v=2uaTPmNvH0I and https://help.github.com/en/github/using-git/ignoring-files for more information.

-- Create a histogram to visualize the most common salary ranges for employees.

-- Create a bar chart of average salary by title.

-- Epilogue

-- Evidence in hand, you march into your boss’s office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, “Search your ID number.” You look down at your badge to see that your employee ID number is 499942.

-- Submission

-- Create an image file of your ERD.

-- Create a .sql file of your table schemata.

-- Create a .sql file of your queries.

-- (Optional) Create a Jupyter Notebook of the bonus analysis.

-- Create and upload a repository with the above files to GitHub and post a link on BootCamp Spot.

-- Ensure your repository has regular commits (i.e. 20+ commits) and a thorough README.md file

-- Copyright

-- Trilogy Education Services © 2019. All Rights Reserved.
