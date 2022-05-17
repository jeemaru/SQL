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

--각 부서별로 최고급여를 받는 사원을 출력하세요      
select  department_id,
        max(salary)
from employees
group by department_id;

select  employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (select  department_id,
                                          max(salary)
                                  from employees
                                  group by department_id);

select  employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in ((10,4400), (20, 13000));                                  

--부서번호가 110인 직원의 급여 보다 큰 모든 직원의
--사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)

-- 부서번호가 110인 직원의 급여
select  first_name,
        salary,
        department_id
from employees
where department_id = 110;
-- 부서번호가 110인 직원의 급여 보다 큰 직원의 이름 급여 출력
select  first_name,
        salary
from employees
where salary >any (select   salary
                   from employees
                   where department_id = 110);

--all <--> any 비교
select  first_name,
        salary,
        department_id
from employees
where department_id = 110;

select  first_name,
        salray
from employees
where salary > 8300
and salary > 12008

select  first_name,
        salary
from employees
where salary >all (select   salary
                   from employees
                   where department_id = 110);
                   
--각 부서별로 최고 급여를 받는 사원을 출력하세요
select  department_id,
        max(salary)
from employees
group by department_id;

select  department_id,
        employee_id,
        first_name,
        salary
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                  from employees
                                  group by department_id);

select  e.department_id,
        e.employee_id,
        e.first_name,
        e.salary
from employees e, (select department_id, //비교 대상값, 테이블을 만들어줌
                          max(salary) salary
                   from employees
                   group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.salary;

--직원의 이름과 직원이 속한 부서명
select  e.first_name,
        e.salary,
        e.employee_id,
        
from employees e, departments d
where e.department_id = d.department_id