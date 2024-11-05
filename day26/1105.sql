use shop;

select * from product3;
select * from bbs;

create database school;

use school;

select * from dept_data;
select * from emp_data;
select * from salgrade_data;

create table dept2
as select * from dept_data;

desc dept2;
select * from dept_data;

-- 2. DDL과 csv를 이용

CREATE TABLE `dept3` (
  `DEPTNO` int,
  `DNAME` text,
  `LOC` text
);

--
use shop;
select * from member;
create table member3
as select * from member;

select * from member3;

insert into member3
values(3, 3, 3, 3, '2024-11-05');

insert into member3
values(4, 4, 4, 4, now());

insert into member3
values(5, 5, 5, 5, now());

insert into member3
values(6, 6, 6, 6, now(), '삼성');

insert into member3
values(7, 7, 7, 7, now(), default);

CREATE TABLE example1 (
 id INT AUTO_INCREMENT,
 name VARCHAR(50),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (id)
);

desc example1;

INSERT INTO example1 (name, created_at, updated_at)
VALUES ('John Doe', '2022-07-01 12:34:56', '2022-07-01 12:34:56');

INSERT INTO example1 (name) VALUES ('Jane Smith');

UPDATE example1
set name = "홍길동"
where id = 2;

select * from example1;

insert into member3 (idmember, pwmember, name, tel, team, location)
values(8, 8, 8, 8, now(), '부산');

insert into member3 (idmember, pwmember, name, tel, team, location)
values(9, 9, 9, 9, now(), '부산');
select * from member3;

use school;

create table emp
select * from emp_data;

create table dept
select * from dept_data;

create table salgrade
select * from salgrade_data;

select * from emp;
select DEPTNO from emp;
select distinct DEPTNO from emp;
select ename, sal * 12 as 연봉 from emp;
-- asc 오름차순 desc 내림차순
select * from emp
order by sal;

select ename, empno, deptno from emp
where not deptno = 30 and job = 'clerk';

select ename, empno, sal, deptno from emp
where sal >= 3000;

select ename, empno, sal, deptno from emp
where sal != 3000;

select ename, empno, sal, job from emp
where job in ('manager', 'clerk');

select ename, empno, sal, job from emp
where job not in ('manager', 'clerk');

select ename, empno, sal, deptno from emp
where sal between 2000 and 3000;

select ename, empno, sal, deptno from emp
where sal not between 2000 and 3000;

select ename, empno, sal, deptno from emp
where ename like '_L%';

select ename, empno, sal, deptno from emp
where ename not like '%L%';

select ename, empno, sal, deptno, comm from emp
where comm is not null;

select ename, empno, sal, deptno, HIREDATE from emp
where HIREDATE > '1981-01-01';