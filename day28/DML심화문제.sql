use shop7;

CREATE TABLE Youth (
    YouthID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    City VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100) NOT NULL
);
INSERT INTO Youth (Name, BirthDate, Gender, City, Phone, Email) VALUES
('John Doe', '1995-06-15', 'Male', 'Seoul', '010-1234-5678', 'john.doe@example.com'),
('Jane Smith', '1997-09-21', 'Female', 'Busan', '010-8765-4321', 'jane.smith@example.com');
CREATE TABLE Activities (
    ActivityID INT AUTO_INCREMENT PRIMARY KEY,
    ActivityName VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);
INSERT INTO Activities (ActivityName, Description) VALUES
('Community Service', 'Volunteering at the local community center'),
('Coding Bootcamp', 'Intensive programming course for beginners');
CREATE TABLE YouthActivities (
    YouthActivityID INT AUTO_INCREMENT PRIMARY KEY,
    YouthID INT NOT NULL,
    ActivityID INT NOT NULL,
    ParticipationDate DATE NOT NULL,
    FOREIGN KEY (YouthID)
        REFERENCES Youth (YouthID),
    FOREIGN KEY (ActivityID)
        REFERENCES Activities (ActivityID)
);
INSERT INTO YouthActivities (YouthID, ActivityID, ParticipationDate) VALUES
(1, 1, '2024-05-01'),
(2, 2, '2024-06-15');

-- Q1

-- 4. 이름이 'John Doe'인 청년의 모든 정보를 조회
SELECT 
    *
FROM
    Youth
WHERE
    Name = 'John Doe';

-- 5. 'Community Service' 활동에 참여한 청년의 이름을 조회
SELECT 
    y.Name
FROM
    Youth y
        INNER JOIN
    YouthActivities ya ON (y.YouthID = ya.YouthID)
WHERE
    ya.ActivityID = 1;

-- 6. 'Seoul'에 거주하는 청년의 이름과 이메일을 조회
SELECT 
    Name, Email
FROM
    Youth
WHERE
    City = 'Seoul';

-- Q2

-- 1. 2024년 5월 1일부터 2024년 6월 30일 사이에 활동에 참여한 청년의 이름과 활동명을 조회
SELECT 
    Y.Name, A.ActivityName
FROM
    Youth Y
        JOIN
    YouthActivities YA ON Y.YouthID = YA.YouthID
        JOIN
    Activities A ON YA.ActivityID = A.ActivityID
WHERE
    YA.ParticipationDate BETWEEN '2024-05-01' AND '2024-06-30';
-- 2. 각 청년의 활동 참여 횟수를 조회
SELECT count(Y.Name)
FROM Youth Y
;
-- 3. 'Jane Smith'의 전화번호를 '010-0000-0000'으로 수정

-- 4. 'Coding Bootcamp' 활동 정보를 삭제

-- 5. 청년의 이름과 나이를 계산하여 조회

-- 6. 'Community Service' 활동에 참여한 청년 수를 조회

-- 7. 각 도시별 청년 수를 조회
