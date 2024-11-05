create database shop6;
use shop6;

-- Q1
-- 1. product3 테이블을 sql문으로 생성, price는int로 설정 다른 필드의 타입은 임의로 설정 가능
-- 2. 다운로드 받은 csv파일을 이용하여 데이터를 삽입
-- 3. price로 내림차순 정렬하여 전체컬럼 검색
select * from product3
order by price desc;
-- 4. company로 오름차순 정렬하여 제품의 이름, 내용, 가격 검색
select name, content, price from product3
order by name;
-- 5. company의 목록을 중복을 제거하여 검색
select distinct company from product3;
-- 6. 각 음식을 5개씩 주문했을 때의 가격을 price5라고 항목명으로 하여 출력
select price * 5 as price5 from product3;
-- 7. price가 5000인 제품명과 회사명
select content, company from product3
where price = 5000;

-- Q2
-- 1. productOrder 테이블 생성(SQL문 이용)
-- ● 각 컬럼을 만들고, 다음 조건에 맞게 제약조건을 설정
create table productOrder(
	id varchar(100) primary key,
    title varchar(100) not null,
    price int,
    buydate date,
    addr varchar(200) default 'home' not null
);

-- 2. 다음 데이터를 insert문을 이용하여 삽입한 후, 검색하여 확인
insert into productOrder
values('100', 'hat', 1000, now(), 'office');
insert into productOrder(id, title, price, buydate)
values('200', 'mouse', 2000, now());
insert into productOrder(id, title, buydate)
values('300', 'mouse', now());
select * from productOrder;