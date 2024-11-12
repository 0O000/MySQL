create schema normal;

use normal;

-- Q3

-- 2정규형
create table Traffic(
	TrafficID int primary key,
    roadName varchar(50),
    panel varchar(50),
    centerName varchar(50),
    centerTel varchar(50)
);
INSERT INTO Traffic (TrafficID, roadName, panel, centerName, centerTel)
VALUES 
('001', '강변북로', '한강대교-동작대교', '서울관제센터', '02-1234-5678'),
('002', '강변북로', '동작대교-성수대교', '서울관제센터', '02-1234-5678'),
('003', '올림픽대로', '잠실대교-천호대교', '서울관제센터', '02-1234-5678'),
('004', '경부고속도로', '양재IC-죽전IC', '경기도관제센터', '031-8765-4321');
create table ControlCenter(
	TrafficID int primary key,
    traffic int,
    speed int,
    FOREIGN KEY (TrafficID) REFERENCES Traffic(TrafficID)
);
INSERT INTO ControlCenter (TrafficID, traffic, speed)
VALUES 
('001', 500, 60),
('002', 450, 55),
('003', 300, 80),
('004', 700, 90);

select * from Traffic;
select * from ControlCenter;

select * from Traffic
join ControlCenter
on Traffic.TrafficId = ControlCenter.TrafficID;

-- 제3정규형
create table Traffic (
	TrafficID int,
    roadName varchar(50),
    panel varchar(50),
    primary key (TrafficID, roadName)
);

create table ControlCenter (
	centerID int primary key auto_increment,
    centerName varchar(50),
	centerTel varchar(50)
);

create table TrafficInformation (
	InformationID int primary key auto_increment,
    TrafficID int,
    traffic int,
	speed int,
    foreign key (TrafficID) references Traffic(TrafficID)
);

select t.TrafficID, t.roadName, t.panel, ti.traffic, ti.speed, c.centerName, c.centerTel
from Traffic t
join TrafficInformation ti
on t.TrafficID = ti.TrafficID
join ControlCenter c
on c.centerID = ti.centerID;