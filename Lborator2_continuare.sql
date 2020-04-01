SELECT * FROM EMPLOYEES;

SELECT LAST_NAME || ' '|| FIRST_NAME || ' '|| JOB_ID || ' '||
DECODE(JOB_ID, 'IT_PROG', SALARY + (SALARY * 20/100), 'SA_REP', SALARY + (SALARY * 25/100), 'SA_MAN', SALARY + (SALARY * 35/100), SALARY) 
FROM EMPLOYEES;

SELECT FIRST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

SELECT j.job_title
FROM jobs j
INNER JOIN employees e
ON j.job_id = e.job_id
WHERE e.department_id = 30;

SELECT e.first_name|| ' '|| e.last_name || ' ' || d.department_name || ' ' || d.location_id
FROM employees e 
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.commission_pct > 0;

SELECT e.first_name || ' ' || e.last_name || ' ' || d.department_name
FROM EMPLOYEES e
INNER JOIN DEPARTMENTS d
ON e.department_id = d.department_id
WHERE LOWER(e.first_name) LIKE '%a%' OR LOWER(e.last_name) LIKE '%a%';


SELECT e.first_name || ' ' || e.last_name || ' ' || d.department_name
FROM EMPLOYEES e
INNER JOIN DEPARTMENTS d
ON e.department_id = d.department_id
WHERE LOWER(e.first_name) LIKE '%a%' OR LOWER(e.last_name) LIKE '%a%';

SELECT e.first_name || ' ' || e.last_name || ' ' || e.job_id || ' ' || d.department_id || ' ' || d.department_name FROM
employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.location_id = (SELECT location_id  FROM locations WHERE city LIKE '%Oxford%');

SELECT e.employee_id as ang#, (e.first_name || ' ' || e.last_name) as angajat, e.employee_id as mgr#, e.first_name || ' ' || e.last_name as manager 
FROM employees e
INNER JOIN employees d
on e.manager_id = d.employee_id;

SELECT e.employee_id as ang#, (e.first_name || ' ' || e.last_name) as angajat, e.employee_id as mgr#, e.first_name || ' ' || e.last_name as manager 
FROM employees e
LEFT OUTER JOIN employees d
on e.manager_id = d.employee_id;

SELECT e.last_name as nume, e.department_id as departament, d.last_name as coleg
FROM employees e
JOIN employees d
ON e.department_id = d.department_id;

SELECT e.first_name || ' ' || e.last_name name,d.job_id,d.job_title,e.department_id,e.salary
FROM employees e
INNER JOIN jobs d
ON e.job_id = d.job_id;

SELECT e.first_name || ' ' || e.last_name as nume, e.hire_date
FROM employees e
INNER JOIN employees d
ON (e.hire_date > d.hire_date)
WHERE LOWER(d.last_name) = 'gates';

SELECT e.first_name || ' ' || e.last_name as nume, e.hire_date, d.first_name || ' ' || d.last_name, d.hire_date
FROM employees e
INNER JOIN employees d
ON e.manager_id = d.employee_id
WHERE e.hire_date < d.hire_date;