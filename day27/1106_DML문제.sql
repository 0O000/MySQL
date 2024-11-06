create database shop7;
use shop7;

-- 1. ENAME의 글자수 검색(length()이용)
select length(ENAME) from emp_data;
-- 2. JOB이 MANAGER인 사람의 ENAME 글자수 검색
select length(ENAME) from emp_data
where job = 'MANAGER';
-- 3. COMM이 null인 사람의 ENAME, JOB 검색
select ENAME, JOB from emp_data
where COMM is null;
-- 4. COMM이 null이 아닌 사람의 HIREDATE 검색
select HIREDATE from emp_data
where COMM is not null;
-- 5. ENAME의 2번째글자부터 끝까지 검색
select substr(ENAME, 2) from emp_data;
-- 6. JOB의 1번째 글자부터 3번째 글자까지 검색
select substr(JOB, 1,3) from emp_data;
-- 7. ENAME의 글자 중 K를 P으로 변경하여 검색
select replace(ENAME, 'K', 'P') from emp_data;
-- 8. ENAME과 EMPNO을 이용하여 ‘7369번은 SMITH입니다' 형식으로 모든 row 출력
select concat(EMPNO, "번은 ", ENAME, "입니다.") as 결과값
from emp_data;
-- 9. HIREDATE 이용하여 입사한 월과 연도를 출력
select MONTH(HIREDATE), YEAR(HIREDATE) from emp_data;
-- 10. JOB컬럼과 함께 JOB이 MANAGER이면 level1, SALESMAN이면 level2, 기타이면 level3라고
-- LEVEL_RESULT컬럼 출력
select job, case job
		 WHEN 'MANAGER' THEN 'level1'
		 WHEN 'SALESMAN' THEN 'level2'
         ELSE 'level3'
         end as LEVEL_RESULT
from emp_data;

-- 1. 전체 직원수 출력
select count(EMPNO) from emp_data;
-- 2. DEPTNO가 20이거나 MGR이 7700이하인 직원수 출력
select count(EMPNO) from emp_data
where DEPTNO = 20 or MGR <= 7700;
-- 3. DEPTNO가 10 또는 20인 직원의 SAL최저값 출력
select min(SAL) from emp_data
where DEPTNO = 10 or DEPTNO = 20;
-- 4. 직원의 SAL 최저값, 최고값, 합계 출력
select min(sal) as 최저값, max(sal) as 최고값, sum(sal) as 합계 from emp_data;
-- 5. DEPTNO별 SAL 평균 출력
select deptno, avg(sal) from emp_data
group by deptno;
-- 6. DEPTNO별 SAL 합계를 DEPTNO 오름차순으로 출력
select sum(sal) from emp_data
group by deptno
order by deptno asc;
-- 7. DEPTNO별 SAL 평균이 2000이상인 SAL평균을 DEPTNO역순으로 출력
select avg(sal) from emp_data
group by deptno
having avg(sal) >= 2000
order by deptno desc;
-- 8. JOB이 MANAGER인 직원의 전체 수, 월급의 평균 검색
select count(job), avg(sal) from emp_data
where job = 'MANAGER';
-- 9. ENAME에 S를 포함하는 직원의 전체 수를 검색
select count(ENAME) from emp_data
where ENAME like '%S%';
-- 10. SAL이 3000이상이고, COMM이 null이 아닌 직원의 전체 수 검색, SAL의 역순으로 출력
select count(EMPNO) from emp_data
where sal >= 3000 and comm is not null
order by sal desc;