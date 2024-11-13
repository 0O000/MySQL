use shop2;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Mike', 'Johnson', 1);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Marketing');

select * from departments;
select * from employees;

-- inner join
select
e.employee_id, e.first_name, e.last_name,
d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

-- view --> emp_details
create view emp_details as 
select
e.employee_id, e.first_name, e.last_name,
d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES
(4, 'John', 'Doe', 1),
(5, 'Jane', 'Smith', 2),
(6, 'Mike', 'Johnson', 1);

-- 테이블과 뷰 비교
create table emp_details2 as 
select
e.employee_id, e.first_name, e.last_name,
d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES
(7, 'John', 'Doe', 1),
(8, 'Jane', 'Smith', 2),
(9, 'Mike', 'Johnson', 1);

-- 뷰에서의 작업이 원본테이블에 영향을 미친다.
-- 단일테이블에서 생성된 뷰만 가능하다.

create view emp_eng as
select employee_id, first_name, last_name
from employees
where department_id = "1";

-- 뷰작업
-- update
update emp_eng
set last_name = 'www'
where employee_id = 1;
-- insert
insert into emp_eng values
(10, 'John', 'Doe'),
(11, 'Jane', 'Smith'),
(12, 'Mike', 'Johnson');
-- delete
delete from emp_eng
where employee_id = 9;

select * from employees;

select * from emp_details2;
select count(*) from emp_details2;

select * from emp_details;
select count(*) from emp_details;
select * from emp_eng;

CREATE TABLE STUDENTS(
	S_ID INT PRIMARY KEY AUTO_INCREMENT,
    S_ADDR VARCHAR(100),
    S_TEL VARCHAR(20),
	TOUR_ID VARCHAR(50)
);
INSERT INTO STUDENTS(S_ADDR,S_TEL,TOUR_ID) VALUES
('강남구','011','T1'),
('영등포구','012','T2'),
('강남구','013','T1'),
('영등포구','014','T2');
CREATE TABLE TOURS(
	T_ID VARCHAR(10) PRIMARY KEY,
    T_LOCATION VARCHAR(50),
    T_CAR VARCHAR(50)
);
insert into TOURS values("T1", "부산", "ktx"),("T2", "제주도", "비행기");
select * from tours;
-- 1. 우리 사이트는 t1에 대한 검색이 많이 이루어지는 편이고, 업데이트 시기는 6개월에 1회입니다.
-- 이와 같은 경우 검색할 수 있는 사용할 수 있는 테이블을 복사해서 생성한 후, 이 테이블을 검색해보세요.
-- 테이블 이름 : t1_table
-- 테이블 컬럼 : t_id, t_location, t_car

create table t1_table as
select T_ID, T_LOCATION, T_CAR
from TOURS
where T_ID = 'T1';

select * from t1_table;

-- 2. 업데이트 시기는 실시간인 경우
-- 영등포구에 사는 학생들의 s_id, s_addr, t_location, t_car를 검색하는 뷰를 생성한 후, 이 테이블을 검색해보세요.
-- (students, tours  조인 필요)
-- 뷰 이름 : young_view
create view young_view as 
select
s_id, s_addr, t_location, t_car
from TOURS t
join STUDENTS s
on s.TOUR_ID = t.T_ID
where s.S_ADDR = '영등포구';

select * from young_view;

-- 3.업데이트 시기는 실시간인 이유
create view t1_view as 
select  s_id, s_addr, s_tel, tour_id
from students
where tour_id = 't1';
        
select * from t1_view;

insert into t1_view values (5, '강남구', '015', 't1');
select * from students;

delete from t1_view 
where s_id = 4;
select * from t1_view;
select * from students;

update t1_view
set s_tel = '333'
where s_id = 3;
select * from students;