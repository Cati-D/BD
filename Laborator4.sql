select department_id, count(employee_id) from employees
group by department_id;

select count(employee_id), min(salary), max(salary)from employees
group by department_id;

select department_id, count(employee_id), min(salary), max(salary) from employees
group by department_id, job_id;

select count(*) from employees;--ia in calcul null
select count(department_id) from employees;
--count nu intoarce niciodata null

--tot ce apare in select apare si la group by

select job_id, sum(salary) from employees
where manager_id is not null
group by job_id;

select job_id, sum(salary) from employees
where lower(last_name) not like'%t'
group by job_id;

--having filtreaza gruparile
select job_id, sum(salary) from employees
group by job_id
having sum(salary) > 10000;

--eroare, where nu suporta group func, filtreaza doar linii
select job_id, sum(salary) from employees
where salary > 10000
group by job_id;

select employee_id, last_name from employees 
where salary > (select avg(salary) from employees);

--rollup
select department_id, to_char(hire_date, 'yyyy'), job_id, sum(salary)
from employees where department_id < 50
group by rollup(department_id, to_char(hire_date, 'yyyy'), job_id);

select department_id, to_char(hire_date, 'yyyy'), sum(salary)
from employees where department_id < 50
group by rollup(department_id, to_char(hire_date, 'yyyy'));

select department_id, to_char(hire_date, 'yyyy'), sum(salary)
from employees where department_id < 50
group by department_id, to_char(hire_date, 'yyyy');

select department_id, sum(salary)
from employees
where department_id < 50
group by department_id;

select sum(salary)
from employees
where department_id < 50;

--cube
select department_id, to_char(hire_date, 'yyyy'), job_id, sum(salary)
from employees where department_id < 50
group by cube(department_id, to_char(hire_date, 'yyyy'), job_id);

select department_id, to_char(hire_date, 'yyyy'), sum(salary)
from employees where department_id < 50
group by cube(department_id, to_char(hire_date, 'yyyy'));

--ex V.3
select job_id, min(salary), max(salary), avg(salary), sum(salary) from employees
group by job_id;

--ex 9
select manager_id, min(salary), max(salary) from employees
where manager_id is not null
group by manager_id
having min(salary) > 5000
order by 2 desc;

--tema pana la 17 pana vineri

