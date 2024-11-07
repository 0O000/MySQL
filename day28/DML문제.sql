-- Q1 - DML
-- EMP_DATA, DEPT_DATA 테이블을 이용하여 다음의 문제를 해결하시오.(조인사용)
use shop7;
-- 1. DEPTNO컬럼을 기준으로 두 개의 테이블을 조인 후, 
-- EMPNO, JOB, SAL, COMM, DNAME, LOC를 검색하여 출력하시오.(INNER JOIN)
select EMPNO, JOB, SAL, COMM, DNAME, LOC
from dept_data d
inner join emp_data e;
-- 2. EMP테이블 내에는 일반 직원과 매니저가 함께 저장되어있다.
-- 일반 직원의 EMPNO, JOB, SAL과 일반직원을 관리하는 MGR의 EMPNO, JOB을 함께 검색하여 출력하시오.(SELF JOIN)
select e1.EMPNO, e1.JOB, e2.empno, e2.job
from emp_data e1, emp_data e2
where e1.mgr = e2.empno;
-- 3. 모든 DEPT_DATA 테이블의 항목이 출력되고, 두 테이블 간 DEPTNO가 일치하는 것을 찾아 EMP_DATA테이블의
-- DEPTNO, EMPNO, ENAME 항목을 추가 출력되도록 조인하시오.(OUTER JOIN)
SELECT 
    *
FROM
    DEPT_DATA d
        JOIN
    emp_data e ON d.deptno = e.DEPTNO;

-- Q3 - DML
-- 1. SALES와 RESEARCH부서 직원 목록 합치기(UNION)
select DNAME from DEPT_DATA
where DNAME = 'SALES'
union
select DNAME from DEPT_DATA
where DNAME = 'RESEARCH';
-- 2. 연봉이 2000 이상인 직원과 관리자 목록 합치기(UNION)
select *
from dept_data d
join emp_data e
on(d.deptno = e.deptno)
where e.sal >= 2000
union
select *
from dept_data d
join emp_data e
on(d.deptno = e.deptno)
where e.job = 'MANAGER';
-- 3. 보스턴과 댈러스에 위치한 부서의 직원 목록 합치기(UNION)
select *
from dept_data d
join emp_data e
on(d.deptno = e.deptno)
where d.loc = 'boston'
union
select *
from dept_data d
join emp_data e
on(d.deptno = e.deptno)
where d.loc = 'dallas';