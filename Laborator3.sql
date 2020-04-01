//1.
select e1.last_name, TO_CHAR(e1.hire_date, 'MON-YYYY') as data_angj
from employees e1, employees e2
where (e1.last_name != 'Gates') and (e1.department_id = e2.department_id) and (e2.last_name = 'Gates') and (e1.last_name like '%a');

select e1.last_name, TO_CHAR(e1.hire_date, 'MON-YYYY') as data_angj
from employees e1
join employees e2 using (department_id)
where (e1.last_name != 'Gates') and (e2.last_name = 'Gates') and (instr(e1.last_name, 'a') != 0);

//2.
select distinct e1.employee_id, e1.last_name
from employees e1, employees e2
where (e1.department_id = e2.department_id) and (e2.last_name like '%t%')
order by e1.last_name;

select distinct e1.employee_id, e1.last_name
from employees e1
join employees e2 using (department_id)
where (e2.last_name like '%t%')
order by e1.last_name;

//3.
select e1.last_name, e1.salary, e2.job_title, e4.city, e5.country_name
from employees e1
join jobs e2 on e1.job_id = e2.job_id
join departments e3 on e1.department_id = e3.department_id
join locations e4 on e3.location_id = e4.location_id
join countries e5 on e4.country_id = e5.country_id
where e1.manager_id = (select employee_id from employees where first_name like 'Steven' and last_name like 'King');

//4.
select e1.department_id, e1.department_name, e2.last_name, e2.job_id, TO_CHAR(e2.salary, '$99,999.99') as salary
from departments e1
join employees e2 on e1.department_id = e2.department_id
where e1.department_name like '%ti' 
order by e1.department_name, e2.last_name;

//5.
select e1.last_name, e1.department_id, e2.department_name, e3.city, e1.job_id
from employees e1
join departments e2 on e1.department_id = e2.department_id
join locations e3 on e2.location_id = e3.location_id 
where e3.city like 'Oxford';

//6.
select e1.employee_id, e1.last_name, e1.salary
from employees e1
join jobs e2 on (e1.job_id = e2.job_id) and (e1.salary >= (e2.min_salary + e2.max_salary) / 2)
join departments e3 on e1.department_id = e3.department_id
where e3.department_id in (select e1.department_id from departments e1 join employees e2 on e1.department_id = e2.department_id where e2.last_name like '%t%');

//7.
select e2.last_name, e1.department_name from departments e1
right outer join employees e2 on e1.department_id = e2.department_id;

select e2.last_name, e1.department_name
from departments e1, employees e2
where e1.department_id = e2.department_id union
select last_name, null
from employees
where department_id is null;

//8.
select e1.department_name, e2.last_name from departments e1
left outer join employees e2 on e1.department_id = e2.department_id;

select e1.department_name, e2.last_name
from departments e1, employees e2
where e1.department_id = e2.department_id union
select department_name, null 
from departments;

//9.
select * from employees e1
left join employees e2 on e1.commission_pct = e2.commission_pct union all
select * from employees e1 right join employees e2 on e1.commission_pct = e2.commission_pct;

//10.
select department_id from departments
where department_name like '%re%' union
select distinct e1.department_id from departments e1
join employees e2 on e1.department_id = e2.department_id
where e2.job_id = 'SA_REP'; //crescator

//11.
select department_id from departments
where department_name like '%re%' union all
select distinct e1.department_id from departments e1
join employees e2 on e1.department_id = e2.department_id
where e2.job_id = 'SA_REP'; //Pot aparea duplicate, iar rezultatul nu va aparea in ordine crescatoare neaparat.

//12.
select department_id from departments
where department_id not in(select distinct department_id from employees where department_id is not null);

//13.
select department_id from departments
where department_name like '%Re%' and department_id = any (select department_id from employees where job_id = 'HR_REP');

//14.
select employee_id, job_id, last_name from employees
where salary >= 3000 union 
select e1.employee_id, e1.job_id, e1.last_name
from employees e1
join jobs e2 on e1.job_id = e2.job_id
where e1.salary = (e2.min_salary + e2.max_salary) / 2;

//15.
select last_name, hire_date
from employees
where hire_date > (select hire_date from employees where last_name = 'Gates');

//16.
select last_name, salary
from employees
where department_id = (select department_id from employees where last_name = 'Gates');

//17.
select last_name, salary
from employees
where manager_id = (select employee_id from employees where manager_id is null);

//18.
select last_name, department_id, salary
from employees
where (department_id, salary) in (select department_id, salary from employees where commission_pct is not null);

//19.
select employee_id, last_name, salary
from employees
where salary >= (select (min_salary + max_salary) / 2 from jobs where job_id = employees.job_id) 
and department_id in (select e1.department_id from departments e1 join employees e2 on e1.department_id = e2.department_id where e2.last_name LIKE '%t%');

//20.
select * from employees where salary >= all (select salary from employees where job_id like '%CLERK%') 
order by salary desc;

//21.
select e1.last_name, e2.department_name, e1.salary from employees e1
join departments e2 on e1.department_id = e2.department_id
where e1.manager_id = any (select employee_id from employees where commission_pct is not null);

//22.
select last_name, department_id, salary, job_id
from employees
where (salary, commission_pct) in (select e1.salary, e1.commission_pct from employees e1
    join departments e2 on e1.department_id = e2.department_id
    join locations e3 on e2.location_id = e3.location_id
    where e3.city like 'Oxford');

//23.
select last_name, department_id, job_id
from employees
where department_id = (select department_id from departments 
    where location_id = (select location_id from locations where city like 'Toronto'));