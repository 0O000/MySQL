use school;

create table departments
as select * from dept_data;

create table employees
as select * from emp_data;

select * from employees;
select * from departments;

-- 단일 행 서브쿼리
-- 서브쿼리 먼저 실행해보자.
select deptno -- 30
from departments
where dname = 'SALES';

-- 메인쿼리를 나중에 실행해보자.
SELECT 
    EMPNO, ENAME, DEPTNO
FROM
    employees
WHERE
    deptno = (SELECT 
            deptno
        FROM
            departments
        WHERE
            dname = 'SALES');
            
-- 다중 행 서브쿼리
-- 서브쿼리의 조건검색 결과가 여러 개의 행인 경우
-- 서브쿼리 먼저 해보자.

update departments
set loc = 1700
where deptno in (10,20);

update departments
set loc = 1000
where deptno in (20,40);

select deptno
from departments
where loc = '1700';

SELECT 
    empno, ename, deptno
FROM
    employees
WHERE
    deptno IN (SELECT 
            deptno
        FROM
            departments
        WHERE
            loc = '1700');

-- 다중 열 서브쿼리

SELECT 
    empno, ename, deptno, job
FROM
    employees
WHERE
    (deptno, job) IN (SELECT 
            deptno, job
        FROM
            employees
        WHERE
            empno = 7369);

-- empno가 7499인 사람의 job과 mgr을 찾아서
-- 같은 job과 mgr인 사람들을 찾아보세요.
SELECT 
    job, mgr
FROM
    employees
WHERE
    (job , mgr) IN (SELECT 
            job, mgr
        FROM
            employees
        WHERE
            empno = 7499);

-- 다중행 서브쿼리(ANY)
-- 서브쿼리
select empno, sal -- 2975, 2850, 3000
from employees
where sal >= 2700;

-- 메인쿼리
select empno, ename, sal
from employees
where sal >= ALL (
	select sal -- 2975, 2850, 3000
	from employees
	where sal >= 2700
);
-- 다중행 서브쿼리(ALL)
select empno, ename, sal
from employees
where sal >= ALL (
	select sal -- 2975, 2850, 3000, 800
	from employees
	where sal >= 2700
);

SELECT empno, sal
FROM employees
WHERE sal > ALL (
    SELECT AVG(sal) -- 2175
    FROM employees
    GROUP BY deptno
);

-- any: or성격
-- all: and성격

-- 상관서브 쿼리
select empno, ename, (
	select dname 
    from departments
    where deptno = employees.deptno
) as deptname 
from employees;

-- 1. 단일행 서브쿼리 --> ACCOUNTING부서의 deptno를 조회해서
-- 해당부서의 직원이름과 급여를 검색
-- (단일 행 서브쿼리)
select ENAME, SAL
from employees
where deptno = (
	select deptno
    from departments
    where dname = 'ACCOUNTING'
);

-- 2. loc가 1800인 부서no를 검색해서 
--    해당 부서에 속한 직원들의 이름과 부서no를 검색
--    (다중 행 서브쿼리)
select ENAME, EMPNO
from employees
where (ENAME, EMPNO) IN(
	select ENAME, EMPNO
    from departments
    where loc = 1800
);

-- 3.특정 직원(empno=7499)의 deptno와 job가 같은 
--   다른 직원들의 ID와 이름을 조회하세요.(다중 열 서브쿼리)
select deptno, job from employees
where (empno, ename) IN (
	select empno, ename
    from employees
    where empno = 7499
);

-- 4. 부서에서 deptno가 10이 있으면 
--    직원테이블에서 empno와 결과라는 컬럼을 만들어 "있음"으로 출력
select empno, "있음" as "결과" from employees
where exists (select 1 from departments where deptno = 100);

select empno, "있음" as "결과" from employees
where exists (select 1 from departments where deptno = 10);