/**********************
* Join
***********************/
--equi join
select *
from employees, departments;

select  employee_id ,
        first_name,
        salary,
        department_name,
        em.department_id "e_did",
        de.department_id "d_did"
from employees em, departments de
where em.department_id = de.department_id;

--모든 직원이름, 부서이름, 업무명 을 출력하세요
select  e.first_name,
        d.department_name,
        j.job_title,
        e.salary,
        e.department_id,
        d.department_id,
        e.job_id,
        j.job_id
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
and e.salary >= 7000
order by salary desc
;

--left join

--equi join 테이터 106개 --> null은 포함되지 않는다
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id;

--left join 예제
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e left outer join departments d
on e.department_id = d.department_id;

--left join 오라클 표현법
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id(+);


--right join 

--equi join 테이터 106개 --> null은 포함되지 않는다
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id;

--right join 예제
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;

--right join 오라클 표현법
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;

--right join --> left join
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;


select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from departments d left outer join employees e
on e.department_id = d.department_id;

--full outer join
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e full outer join departments d
on e.department_id = d.department_id;


--*Self Join
select  e.employee_id,
        e.first_name,
        e.salary,
        e.phone_number,
        e.manager_id,
        m.employee_id,
        m.first_name ManagerName,
        m.phone_number
from employees e, employees m
where e.manager_id = m.employee_id;


--subquery
--SubQuery : 하나의 SQL 질의문 속에 다른 SQL 질의문이 포함되어 있는 형태
-- 두개의 질문을 하나의 값으로 넣는 형태
--‘Den’ 보다 급여를 많은 사람의 이름과 급여는?

select salary
from employees
where first_name = 'Den'

select  first_name,
        salary
from employees
where salary >= 11000
order by salary desc;

select  first_name,
        salary
from employees
where salary >= (select salary
                 from employees
                 where first_name = 'Den')
order by salary desc;

--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select  first_name,
        salary,
        employee_id
from employees
where salary <= (select min(salary)
                 from employees)

--평균 급여보다 적게받는 사람
select  first_name,
        salary,
        employee_id
from employees
where salary <  (select avg(salary)
                 from employees)
order by salary desc;

-- 부서번호 110인 직원의 급여와 같은모든 직원의 사번, 이름, 급여를 출력하세요
-- 110 12008, 8300
select  salary
from employees
where department_id = 110;

select  employee_id,
        first_name,
        salary
from employees
where salary = 12008
or salary = 8300

select  employee_id,
        first_name,
        salary
from employees
where salary in (select  salary
                 from employees
                 where department_id = 110); -- 12008, 8300