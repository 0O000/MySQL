-- Q1, Q2 문제풀이
CREATE DATABASE shop4;
use shop4;
-- Q1 문제 ERD에 해당하는 모든테이블에대해 CREATE문을작성하시오.
create table member(
	id varchar(100) primary key,
    pw varchar(100) not null,
    name varchar(100) not null,
    tel varchar(100)
);
create table bbs(
	no int primary key auto_increment,
    title varchar(100),
    content varchar(100),
    writer varchar(100),
    foreign key(writer) references member(id)
);
create table reply(
	id int primary key,
    oriid varchar(100),
    content varchar(100),
    writer varchar(100),
    foreign key(oriid) references member(id),
    foreign key(writer) references bbs(writer)
);
-- 샘플 데이터를 각 테이블 당 row를 2개씩 넣으시오.
insert into member
values('100', '1234', 'kim', '011');
insert into member
values('200', '1234', 'park', '010');
-- 유효성 검사
insert into bbs
values(null, 'DB', 'DBMS', '100');
insert into bbs
values(null, 'JAVA', 'SPRING', '200');
insert into reply
values(1, 100, 'DBMS', '100');
insert into reply
values(2, 200, 'SPRING', '200');
-- 데이터 제대로 들어왔는지 확인.
select * from bbs;
select * from member;
select * from reply;
-- Q3 문제풀이
-- member table내 tel의 컬럼데이터타입을 varchar(50)으로수정하시오.
alter table member
modify tel varchar(50);
-- bbs table내 title column을 삭제하시오.
alter table bbs
drop title;
-- bbs table내 passwd컬럼을 varchar(100), null 허용하지않는조건으로을 추가하시오.
alter table bbs
add pw varchar(100) Not NUll;
-- member table의 상세항목및 제약조건을출력하시오.
desc member;
-- 전체테이블목록을출력하시오.
show tables;
-- 전체데이터베이스목록을출력하시오.
show databases;
-- 각 테이블을 reply, bbs, member순서대로삭제하시오.
drop table reply;
drop table bbs;
drop table member;