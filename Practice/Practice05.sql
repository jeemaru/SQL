문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)

select  first_name,
        manager_id,
        commission_pct,
        salary
from employees
where salary > 3000
and manager_id >= 0
and commission_pct is null;

문제2. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여
(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하
세요
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)

select  employee_id,
        first_name,
        salary,
        to_char(hire_date,'YYYY-MM-DD'),
        replace(phone_number,'.','-'),
        department_id
from employees
where (department_id,salary) in (select department_id, max(salary)
                                 from employees
                                 group by department_id);


문제3
매니저별 담당직원들의 평균급여 최소급여 최대급여를 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균급여가 5000이상만 출력합니다.
-매니저별 평균급여의 내림차순으로 출력합니다.
-매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매
니저별최대급여 입니다.
(9건)

select  manager_id,
        first_name,
        round(avg(salary),1),
        min(salary),
        max(salary)
from employees
where hire_date > '05/01/01'
having round(avg(salary),1) > 5000
group by manager_id, first_name
order by round(avg(salary),1) desc;


문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명
(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)

문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요