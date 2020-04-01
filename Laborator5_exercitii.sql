--ex1
--a)toate functiile grrup, cu exceptia fucntiei COUNT, nu ia in calcul NULL
--b) HAVING filtreaza gruparile in timp ce WHERE filtreaza daor liniile

--ex2
select  round(max(e1.salary)) as Maxim, round(min(e1.salary)) as Minim, round(sum(e1.salary)) as Suma, round(avg(e1.salary)) as Media
from employees e1;

--ex3
select job_id, min(salary) as minim, max(salary) as maxim, avg(salary)as medie, sum(salary) as suma from employees
group by job_id;

--ex4
select sum(1)as numar_angajati
from employees 
group by job_id;

--ex5
select sum(1)as numar_manageri
from employees e1
join employees e2
on (e1.department_id = e2.department_id)
where (e1.employee_id = e2.manager_id);

--ex6
select max(salary) - min(salary) as diferenta
from employees;

--ex7
SELECT d1.department_name as nume_departament,l1.STREET_ADDRESS as locatie , SUM(1) as nr_angajati, ROUND(AVG(e1.salary))as salariu_mediu
FROM employees e1
INNER JOIN departments d1
ON(e1.department_id = d1.department_id)
INNER JOIN locations l1
ON(l1.location_id = d1.location_id)
GROUP BY d1.department_name, l1.STREET_ADDRESS;

--ex8
select employee_id as cod, last_name, first_name
from employees
where salary > (select avg(salary) from employees)
order by salary desc;

--9
select manager_id, min(salary), max(salary) from employees
where manager_id is not null
group by manager_id
having min(salary) > 5000
order by 2 desc;

--10
select e1.department_id,(select department_name from departments where department_id = e1.department_id) as nume_departament, MAX(e1.salary) as salariu_maxim
from employees e1
where e1.department_id is not null
group by e1.department_id
having max(e1.SALARY) > 3000;

--11
select round(avg(min(salary))) from employees group by job_id;

--12
select e1.department_id, d1.department_name, sum(e1.salary)
from employees e1
join departments d1 on (e1.department_id= d1.department_id)
group by e1.department_id, d1.department_name;

--13
select round(max(avg(salary))) from employees group by job_id;

--14
select e1.job_id, j1.job_title, avg(e1.salary) 
from employees e1
join jobs j1 on (e1.job_id = j1.job_id)
group by e1.job_id, j1.job_title
having avg(e1.salary) = (select min(avg(salary)) from employees group by job_id);

--15
select round(avg(e1.salary))
from employees e1
having round(avg(e1.salary)) > 2500;

--16
select round(sum(e1.salary))
from employees e1
group by e1.department_id
union select round(sum(e1.salary))
from employees e1
group by e1.job_id;

--17
select d1.department_name, min(e1.salary)
from departments d1
join employees e1 on (e1.department_id = d1.department_id)
group by d1.department_name
having round(avg(e1.salary)) = (select round(max(avg(salary))) from employees group by department_id);

--18 a)
select d1.department_id, d1.department_name, sum(1) as nr_angajati
from departments d1
join employees e1 on (e1.department_id = d1.department_id)
group by d1.department_id, d1.department_name
having sum(1) < 4;

--18 b)
select d1.department_id, d1.department_name as departament_nr_mmax_angajati, sum(1) as nr_angajati
from departments d1
join employees e1 on (e1.department_id = d1.department_id)
group by d1.department_id, d1.department_name
having sum(1) = (select max(sum(1)) from departments d1 join employees e1 on (d1.department_id = e1.department_id) group by d1.department_id);

--19
select e1.last_name, e1.first_name, to_char(e1.hire_date, 'mm')
from employees e1
group by (e1.last_name, e1.first_name, to_char(e1.hire_date, 'mm'))
having to_char(e1.hire_date, 'mm') = (select to_char(e1.hire_date, 'mm') from employees e1 group by to_char(e1.hire_date, 'mm') having sum(1) = (select max(sum(1)) from employees e1 group by to_char(e1.hire_date, 'mm')));

