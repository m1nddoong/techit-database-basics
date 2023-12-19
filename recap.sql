CREATE TABLE student(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(32) UNIQUE ,
    year INTEGER,
    -- major는 비어있으면 안된다.
    major VARCHAR(32) NOT NULL
);

-- 데이터 자체에 할수있는 4가지 작업
-- CREATE READ UPDATE DELETE
-- INSERT SELECT UPDATE DELETE
INSERT INTO student(name, year, major)
VALUES ('Alex', 1999, 'CSE');

SELECT * FROM student;
SELECT name, major FROM student;
SELECT name FROM student WHERE major = 'CSE';

UPDATE student
SET major = 'Computer Science Engineering'
WHERE major = 'CSE';

DELETE FROM student
WHERE name = 'Alex';