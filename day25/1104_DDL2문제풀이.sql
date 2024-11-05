create database shop5;
use shop5;

CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(50),
    loc VARCHAR(50)
);
insert into dept
values(100, "소프트웨어학과", "공학");
insert into dept
values(200, "경영학과", "인문");

CREATE TABLE emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    mgr INT,
    hiredate DATE,
    sal INT,
    comm INT,
    deptno INT,
    FOREIGN KEY (deptno)
        REFERENCES dept (deptno)
);
insert into emp
values(500, "EMP_LEE", "MANAGER", 2, "20191003", 2500, 300, 100);
insert into emp
values(505, "EMP_KANG", "JUNIOR MANAGER", 1, "20221003", 2000, 200, 200);

CREATE TABLE professor (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    tel VARCHAR(50),
    deptid INT,
    addr VARCHAR(50),
    roomno VARCHAR(50),
    FOREIGN KEY (deptid)
        REFERENCES dept (deptno)
);
insert into professor
values(101, "PRO_BAEK", "010", 100, "gmail.com", "301");
insert into professor
values(201, "PRO_YANG", "010", 200, "naver.com", "401");

CREATE TABLE student (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    tel VARCHAR(50),
    deptid INT,
    professorid INT,
    FOREIGN KEY (deptid)
        REFERENCES dept (deptno),
    FOREIGN KEY (professorid)
        REFERENCES professor (id)
);
insert into student
values(110, "KIM", "010", 100, 101);
insert into student
values(210, "CHOI", "011", 200, 201);