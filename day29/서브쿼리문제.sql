-- EMP_DATA, DEPT_DATA 테이블을 이용하여 다음의 문제를 해결하시오. (서브쿼리와 조인 사용)
use shop7;
-- 1. 최고 연봉을 받는 직원의 이름과 그의 부서명 찾기
-- 2. 각 부서의 평균 연봉보다 더 많은 연봉을 받는 직원들의 목록
-- 3. 부서별로 최고 연봉을 받는 직원의 정보 찾기
-- 4. 부서 위치가 'CHICAGO'인 모든 직원들의 정보
select * from dept_data;
select * from emp_data
where deptno =(
	select deptno
    from dept_data
    where loc = 'chicago'
);
-- 5. 모든 매니저 (MGR) 아래에서 일하는 직원들의 목록
SELECT 
e2.ENAME AS '직원 이름', e1.ENAME AS '매니저 이름'
FROM 
emp_data e1 
JOIN
emp_data e2 
ON
e1.EMPNO = e2.MGR;