SELECT */ employee-id FROM
employees;

//9
SELECT last_name, salary
FROM employees
WHERE salary > 2580;

SELECT * FROM employees
WHERE salary > 2580;

//10
SELECT last_name, department_id
FROM employees
WHERE employee_id = 104;

//11
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 1500 AND 3000

“20-FEB-1999”
DD-MM-YYYY

select sysdate from DUAL

ORDER BY emp_id, first_name, 2;

//12
SELECT last_name, job_id, hire_date
FROM employees
WHERE hire_date BETWEEN '20-02-1987' AND '1-05-1989'
ORDER BY hire_date;

//13
SELECT TO_CHAR(hire_date, 'YYYY/ MONTH/ DD; HH24:MI') FROM employees;
//pot pune in loc de hire_date sysdate ca sa am data curenta

WHEN NULL; //NU FACE NIMIC
IS NULL || IS NOT NULL;

//16
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE ('%87%');

SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '1987';

//17
SELECT  last_name, job_id
FROM employees
WHERE manager_id IS NULL;

//18
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary, commission_pct;

//slectez toti utilizatrii care au litera A in nume si au departamentul 30 dar nu au manager
SELECT first_name LIKE (‘%A’) AND department_id = 30 OR manager_id = ‘0’)

//ULTIMUL EX
WHERE salary = saalry * commission_pct * 5 NAD commission IS NOT NULL;
