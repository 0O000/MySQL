create schema shop8;

CREATE TABLE Student (
 StudentID INT PRIMARY KEY,
 StudentName VARCHAR(50),
 PhoneNumber VARCHAR(15),
 Address VARCHAR(100)
);

CREATE TABLE Professor (
 ProfessorName VARCHAR(50) PRIMARY KEY,
 Office VARCHAR(50),
 PhoneNumber VARCHAR(15)
);

CREATE TABLE clubapplication (
 clubID int primary key auto_increment,
 StudentID int NOT NULL,
 ClubName varchar(50),
 ProfessorName varchar(50),
 FOREIGN KEY (StudentID) REFERENCES student (StudentID),
 FOREIGN KEY (ProfessorName) REFERENCES professor (ProfessorName)
);

INSERT INTO Student (StudentID, StudentName, PhoneNumber, Address) VALUES
(101, '이영희', '02-234-5678', '서울시 강남구'),
(102, '박철수', '02-345-6789', '서울시 서초구'),
(103, '최수민', '02-456-7890', '서울시 송파구');

INSERT INTO Professor (ProfessorName, Office, PhoneNumber) VALUES
('김명수', '공학관101호', '02-111-2222'),
('이정민', '공학관202호', '02-333-4444'),
('박지훈', '공학관303호', '02-555-6666');

INSERT INTO ClubApplication (StudentID, ClubName, ProfessorName) VALUES
(101, '음악', '김명수'),
(102, '미술', '이정민'),
(103, '체육', '박지훈');

-- Q1
-- 1. ClubName이 '음악'인 신청 삭제
delete from clubapplication
where ClubName = '음악';
-- 2. StudentID가 103인 학생의 주소를 '서울시 강북구'로 수정
update Student set Address = '서울시 강북구'
where StudentID = 103;
-- 3. ProfessorName이 '박지훈'인 교수의 연락처를 '02-777-8888'로 수정
update Professor set PhoneNumber = '02-777-8888'
where ProfessorName = '박지훈';
-- 4. 모든 학생의 이름과 그들이 신청한 클럽 이름을 출력(조인)
select s.StudentName, c.ClubName from Student s
join ClubApplication c
on c.StudentID = s.StudentID;
-- 5. 모든 학생들의 정보는 출력하고, 학생이 가입한 클럽이 있으면 클럽명과 지도교수이름을 함께 출력 (조인)
select s.StudentName, c.ClubName, c.ProfessorName from Student s
join ClubApplication c
on c.StudentID = s.StudentID;
select * from Student;
select * from Professor;
select * from ClubApplication;