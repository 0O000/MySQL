CREATE TABLE Youth (
 YouthID INT AUTO_INCREMENT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL,
 BirthDate DATE NOT NULL,
 Gender ENUM('Male', 'Female', 'Other') NOT NULL,
 City VARCHAR(100) NOT NULL,
 Phone VARCHAR(15),
 Email VARCHAR(100) NOT NULL
);
CREATE TABLE Activities (
 ActivityID INT AUTO_INCREMENT PRIMARY KEY,
 ActivityName VARCHAR(100) NOT NULL,
 Description VARCHAR(255)
);
CREATE TABLE YouthActivities (
 YouthActivityID INT AUTO_INCREMENT PRIMARY KEY,
 YouthID INT NOT NULL,
 ActivityID INT NOT NULL,
 ParticipationDate DATE NOT NULL,
 FOREIGN KEY (YouthID) REFERENCES Youth(YouthID),
 FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);

INSERT INTO Youth (Name, BirthDate, Gender, City, Phone, Email) VALUES
('김철수', '2003-05-21', 'Male', '서울', '010-1234-5678', 'chulsoo@example.com'),
('이영희', '2004-07-30', 'Female', '부산', '010-8765-4321', 'younghi@example.com'),
('박지민', '2005-02-15', 'Other', '대구', '010-1357-2468', 'jimin@example.com'),
('최유리', '2002-10-11', 'Female', '인천', '010-2468-1357', 'yuri@example.com'),
('장민호', '2001-12-25', 'Male', '광주', '010-5678-1234', 'minho@example.com');
INSERT INTO Activities (ActivityName, Description) VALUES
('축구', '팀 스포츠의 하나로, 11명이 한 팀을 이루어 공을 차서 상대방의 골대에 넣는 게임'),
('음악', '다양한 악기와 목소리를 사용하여 조화로운 소리를 만드는 예술 활동'),
('봉사활동', '지역 사회 봉사를 통해 사회에 기여하는 활동'),
('프로그래밍', '컴퓨터 소프트웨어를 개발하는 과정'),
('미술', '그림, 조각 등 시각적 예술을 통해 창의적 표현을 하는 활동');
INSERT INTO YouthActivities (YouthID, ActivityID, ParticipationDate) VALUES
(1, 1, '2024-01-20'),
(2, 2, '2024-02-15'),
(3, 3, '2024-03-10'),
(4, 4, '2024-04-05'),
(5, 5, '2024-05-01');
select * from Youth;
select * from Activities;
-- 1. Youth 테이블에서 각 이름(Name)의 길이를 계산하시오.(CHAR_LENGTH())
select CHAR_LENGTH(Name) from Youth;
-- 2. Activities 테이블에서 활동 이름(ActivityName)을 모두 대문자로 변환하시오.(UPPER())
select UPPER(ActivityName) from Activities;
-- 3. Youth 테이블에서 이메일(Email)의 도메인 부분만 추출하시오.(SUBSTRING_INDEX())
select SUBSTRING_INDEX(Email, '@', -1) as EmailDomain from Youth;
-- 4. Youth 테이블에서 각 이름(Name)의 첫 글자만 대문자로 변환하시오.(CONCAT(UPPER(LEFT()),SUBSTRING()))
select concat(upper(left(name, 1)), substring(name, 2)) as properName from Youth;
-- 5. Activities 테이블에서 활동 설명(Description)에서 '활동'이라는 단어가 처음 나타나는 위치를 찾으시오.(LOCATE())
select Description, Locate('활동', Description) from Activities;
-- 6. YouthActivities 테이블에서 각 청소년(YouthID)별로 참여한 활동의 수를 계산하시오.(COUNT())
select YouthID, count(*) from YouthActivites group by YouthID;
-- 7. YouthActivities 테이블에서 각 활동(ActivityID)별 참여 횟수를 집계하시오.(COUNT())
select ActivityID, count(*) from YouthActivities group by ActivityID;