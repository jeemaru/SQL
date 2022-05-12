/*select 문 기본*/

select * from employees;

select *from departments;

select employee_id first_name, phone_number from employees;

/***************
select 문
    select 절
    froma 절
    where 절
    order by 절
****************/

--모든 컬럼 조회하기 (한줄 주석"--")
select * 
from employees;

select *
from departments;

--원하는 컬럼만 조회하기
select employee_id, first_name, last_name
from employees;

--예제)
--사원의 이름 (fisrt_name)과 전화번호 입사일 연봉을 출력하세요
select first_name, phone_number, hire_date, salay
from employees;

--사원의 이름(fisrt_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
select first_name, 
       last_name, 
       salary, 
       phone_number, 
       email, 
       hire_date
from employees;

--출력할때 컬럼명 별명 사용하기
select first_name "이름",
       phone_number "전화번호", 
       hire_date "입사일",
       salary "급여"
from employees;

--사원의 이름(fisrt_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
select first_name as 이름, 
       last_name 성,
       salary "salary", 
       phone_number "hp", 
       email"이 메 일", 
       hire_date 입사일
from employees;

--연결연산자 (컬럼을 붙이기)
select  first_name,
        last_name
from employees;

select first_name || last_name
from employees;

select first_name ||''|| hire_date
from employees;

select first_name ||' hire date is '|| hire_date as 입사일
from employees;

--산술연산자
select  first_name,
        salary,
        salary*12,
        (salary+300)*12
from employees;

select job_id
from employees;

select  first_name||'-'||last_name 이름,
        salary 급여,
        salary*12 연봉,
        salary*12+5000 연봉2,
        phone_number 전화번호
from employees

/*where절*/
select first_name
from employees
where department_id = 10;

--연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
select first_name, salary
from employees
where salary >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name, hire_date
from employees
where hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
select  salary
from employees
where hire_name >= 'Lex';

--조건이 2개이상 일때 한꺼번에 조회하기
select first_name, salary
from employees
where salary >= 14000 
and salary <= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where salary >= 14000 
or salary <= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name, hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/30';

--IN 연산자로 여러 조건을 검사하기
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
where salary in ('2100','3100','4100','5100');

--Like 연산자로 비슷한것들 모두 찾기 %는 뒤에 뭐가오든 상관없다라는뜻
select first_name, last_name, salary
from employees
where first_name like 'L%';
--언더바(_)는 언더바 갯수만큼의 글자수만 보여줆
select first_name, last_name, salary
from employees
where first_name like 'L___';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, last_name, salary
from employees
where first_name like '%am%';
--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name, last_name, salary
from employees
where first_name like '_a%';
--이름의 네번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name, last_name
from employees
where first_name like '___a%';
--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name, last_name
from employees
where first_name like '__a_';

--null <-- 0도 아닌 아무것도 없는 값이므로 어떠란 형태의 값도 들어옴
select  first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where salary between 13000 and 15000;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select  first_name, salary, commission_pct
        salary,
        commission_pct
from employees
where commission_pct >= 0
--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select  first_name,
        salary,
        commission_pct
from employees
where manager_id is null
and commission_pct is null;

select  first_name,
        salary
from employees
where salary >= 10000;

--order by 절을 사용해 보기좋게정렬하기 내림차순 desc 오름차순 asc
select  first_name,
        salary
from employees
order by salary desc; --asc

select  first_name,
        salary
from employees
where salary >= 9000
order by salary desc; --asc

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select  first_name,
        salary
from employees
order by department_id asc; 

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select  first_name,
        salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터
--부서번호 급여 이름을 출력하세요
select  department_id,
        salary,
        first_name
from employees
order by department_id asc, salary desc;

/*
단일행 함수
*/
--문자함수 --INITCAP(컬럼명)
--부서번호 100인 직원의 이메일 주소와 부서번호를 출력하세요

select  email,
        initcap(email),
        department_id
where department_id = 100;

--문자함수 -LOWER(컬럼명) / UPPER(컬럼명)
select  first_name,
        upper(first_name),
        lower(first_name)
        --해당컬럼명을 다른형식으로 표현하려면 ""표시 후 작성
from employees
where department_id = 100;

--문자함수 – SUBSTR(컬럼명, 시작위치, 글자수)
-- -값은 뒤에서부터 시작됨
select  first_name,
        substr(first_name,1,3),
        substr(first_name,-3,2)
from employees
where department_id = 100;

--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) / RPAD(컬럼명, 자리수, ‘채울문자’)
-- LPAD() :왼쪽 공백에 특별한 문자로 채우기
-- RPAD() :오른쪽 공백에 특별한 문자로 채우기
select  first_name, 
        lpad(first_name,10,'*'), 
        rpad(first_name,10,'*')
from employees;

-- 문자함수 – REPLACE (컬럼명, 문자1, 문자2)
--컬럼명에서 문자1을 문자2로 바꾸는 함수
select  first_name, 
        replace(first_name, 'a', '*') 
        from employees
where department_id =100;

select  first_name, 
        replace(first_name, 'a', '*'), 
        substr(first_name,2,3),
        replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;

--숫자함수 – ROUND(숫자, 출력을 원하는 자리수) 
--주어진 숫자의 반올림을 하는 함수
select  round(123.346, 2) "r2",
        round(123.456, 0) "r0",
        round(123.456, -1) "r-1"
from dual;

--숫자함수 – TRUNC(숫자, 출력을 원하는 자리수)
--주어진 숫자의 버림을 하는 함수
select  trunc(123.346, 2) "r2",
        trunc(123.456, 0) "r0",
        trunc(123.456, -1) "r-1"
from dual;

--날짜함수 – SYSDATE()
--현재날짜와 시간을 출력해주는 함수
select sysdate
from dual;

--단일함수>날짜함수 – MONTH_BETWEEN(d1, d2) 
--d1날짜와 d2날짜의 개월수를 출력하는 함수
select months_between(sysdate, hire_date) 
from employees
where department_id = 110;

--TO_CHAR(숫자, ‘출력모양’) 숫자형문자형으로 변환하기
select first_name, to_char(salary*12, '$999,999.99') "SAL"
from employees
where department_id =110;

select  to_char(9876, '99999'), --9가 자릿수를 표시
        to_char(9876, '099999'), --0이 빈 자릿수를 채움
        to_char(9876, '$99999'), -- 단위 표시
        to_char(9876, '9999.99'), -- 소수점자리 표시
        to_char(987698769876,'9999,9999,9999')
from dual;

--변환함수>TO_CHAR(날짜, ‘출력모양’) 날짜문자형으로 변환하기
select  sysdate,
        to_char(sysdate,'YYYY-MM-DD'),
        to_char(sysdate,'YYYY-MM-DD HH24:MI:SS'),
        to_char(sysdate,'YYYY'),
        to_char(sysdate,'YY'),
        to_char(sysdate,'MM'),
        to_char(sysdate,'MONTH'),
        to_char(sysdate,'DD'),
        to_char(sysdate,'DAY'),
        to_char(sysdate,'HH24'),
        to_char(sysdate,'MI'),
        to_char(sysdate,'SS')
from dual;