create schema g_market;

use g_market;

create table product(
	product_code int unique,
    product_id int auto_increment primary key,
    product_name varchar(50),
    product_price int,
    product_sale int
);

create table users(
    user_id varchar(50) primary key,
    user_pw varchar(50) not null,
    user_name varchar(50) not null,
    user_addr varchar(100) not null,
    user_tel varchar(50) not null,
    user_year int,
    user_rank int not null
);

create table cart(
	cart_id int primary key auto_increment,
    cart_user_id varchar(50),
    cart_name varchar(50),
    cart_count int,
    cart_sum int,
    cart_price int
);

insert user
values(1, "삼성동", "010", 20, 2);
insert user
values(2, "대치동", "011", 23, 1);

insert product(code, name, price, sale)
values(001, "베베숲 프라임 아기물티슈", 29850, 53);
insert product(code, name, price, sale)
values(002, "하림 무항생제 닭", 7190, 31);
insert product(code, name, price, sale)
values(003, "유한락스 욕실청소용", 9900, 14);

insert cart(cart_id, cart_name, cart_price)
values(1, "베베숲 프라임 아기물티슈", 29850);
insert cart(cart_id, cart_name, cart_price)
values(2, "유한락스 욕실청소용", 9900);