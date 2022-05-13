--그룹함수 - count() 함수에 입력되는 데이터의 총 건수를 구하는 함수
select  count(*),
        count(commission_pct) --null을 제외한 모든값
from employees;

select count(*)
from employees
where salary > 16000;

--그룹함수sum() 입력된 데이터들의 합계 값을 구하는 함수
select  count(*),    
        sum(salary)
from employees;

-- 그룹함수 - avg() 입력된 값들의 평균값을 구하는 함수
select  count(*),
        sum(salary),
        avg(salary)
from employees;

--그룹함수 - max() / min() 입력된 값들중 가장 큰값/작은값 을 구하는 함수
--여러건의 데이터를 순서대로 정렬 후 값을 구하기때문에 데이터가 많을 때는 느리다
--(주의해서 사용)
select  count(*),
        max(salary),
        min(salary)
from employees;

--GROUP BY 절
select  department_id, -- 출력안댐
        avg(salary)
from employees;

select  department_id, --숫자의 평균으로 표현 출력o
        avg(salary) --department_id 부서별 평균
        sum(salary) --department_id 부서별 합계
        count(salary) --department_id 부서별 카운트
from employees
group by department_id
order by department_id asc;

select  job_id, --문자의 평균 못냄 출력x
        avg(salary)
from employees
group by department_id --그룹에 지정된값이 샐렉트에 있어야 함
order by department_id asc;

select  job_id, --데이터를 더 세분화해서 표현함
        avg(salary)
from employees
group by department_id, job_id -- department_id, job_id 순서대로 나누고 나누는거랄까..
order by department_id asc;

--GROUP BY 절 예제
--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
select  department_id,
        count(*),
        sum(salary)
from employees
where sum(salary) >= 20000 --에러, where절은 그룹함수에 사용할수없음
group by department_id;

--having 절
select  department_id,
        count(*),
        sum(salary)
from employees
group by department_id
having sum(salary) >= 20000 --having 절에는 그룹함수 와 Group by에 참여한 컬럼만 사용할 수 있다
and department_id = 100
--and hire_date >= '04/01/01' 그룸한수에 포함된 컬럼이 아니므로 안됨
order by department_id asc;