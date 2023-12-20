-- CROSS JOIN
-- 왼쪽과 오른쪽 데이터를 하나씩 조합해서
-- 전체 출력
SELECT *
FROM student, instructor;

SELECT *
FROM student CROSS JOIN instructor
WHERE advisor_id = instructor.id;

-- 어떤 교수님이 어떤 강의를 하는지 알고 싶다면?
SELECT instructor_id, lecture.instructor_id, first_name, last_name, name
FROM instructor, lecture
WHERE instructor_id = lecture.instructor_id;


-- INNER JOIN
-- ON을 통해 어떤 컬럼이 일치해야 하는지, 어떤 컬럼을 기준으로 JOIN을 하는지를 전달
-- 교수님들과 강의하시는 강의를 동시에 출력하고 싶다
SELECT *
FROM instructor INNER JOIN lecture
    ON instructor.id = lecture.instructor_id;

-- 강의별로 강의하는 교수님을 출력하고싶다.
SELECT *
FROM lecture INNER JOIN instructor
    ON lecture.instructor_id = instructor.id;

-- 학생들의 지도교수 정보를 포함해서 학생들을 출력하고 싶다.
SELECT *
FROM student INNER JOIN instructor
    ON student.advisor_id = instructor.id;

-- INNER는 생략 가능
SELECT *
FROM student JOIN instructor
ON student.advisor_id = instructor.id;
-- 15명

SELECT count(*) FROM student;
-- 20명
-- inner join 은 모든 것을 다 완벽하게 일치하는, 교집합으로 포함되어있는 데이터만 가져올 수 있다.



-- OUTER JOIN
-- 학생을 지도교수님 정보까지 포함해서 출력하되
-- 지도교수가 없는 학생도 출력
SELECT *
FROM student LEFT OUTER JOIN instructor -- 학생 중에서
    ON student.advisor_id = instructor.id;
-- 지도 교수 컬럼이 비어있는 데이터들도 다 표시한다.
-- student.advisor_id = instructor.id 이여야 하는데, 둘다 null 의 경우 (데이터가 비어있으면)
-- 없는 대로 null 출력


-- 교수와 지도학생을 출력하되
-- 지도하는 학생이 없는 교수님도 출력
SELECT *
FROM instructor LEFT OUTER JOIN student -- 교수님 중에서
    ON student.advisor_id = instructor.id;


-- OR
SELECT *
FROM student RIGHT OUTER JOIN instructor
    ON student.advisor_id = instructor.id;

SELECT *
FROM instructor RIGHT OUTER JOIN student
ON instructor.id = student.advisor_id;


-- 학생과 지도교수를 전부 출력한다.
-- 한명의 학생도, 교수님도 빠지지 않는다.
SELECT *
FROM student FULL OUTER JOIN instructor
    ON student.advisor_id = instructor.id
WHERE student.advisor_id IS NULL;


-- Many To Many
-- 각 학생이 듣고 있는 강의들을 출력한다.
-- 1. student와 enrolling_lectures 와 inner join한다.
-- SELECT *
-- FROM student
--          -- 여기까지 해서 lecture_id 가 포함된 테이블이 만들어짐
--     INNER JOIN enrolling_lectures
--         ON student.id = enrolling_lectures.student_id
--     -- 새로운 테이블과 lecture를 INNER JOIN한다.
--     INNER JOIN lecture
--         ON enrolling_lectures.lecture_id = lecture.id;

-- 이제 필요한 데이터 컬럼만 가쟈오자
SELECT student_id, student.first_name, student.last_name, lecture.name
FROM student
    -- 여기까지 해서 lecture_id 가 포함된 테이블이 만들어짐
    INNER JOIN enrolling_lectures
       ON student.id = enrolling_lectures.student_id
        -- 새로운 테이블과 lecture를 INNER JOIN한다.
    INNER JOIN lecture
       ON enrolling_lectures.lecture_id = lecture.id
WHERE student.id = 1
ORDER BY student.first_name;


-- OUTER JOIN도 가능
-- 모든 학생이 듣고 있는 강의들을 다 출력한다.
-- 가의를 듣고 있지 않은 학생들도 출력한다.
SELECT student.id, student.first_name, student.last_name, lecture.name -- count(name)
FROM student
    LEFT JOIN enrolling_lectures
        ON student.id = enrolling_lectures.student_id
    LEFT JOIN lecture
        ON enrolling_lectures.lecture_id = lecture.id;
-- GROUP BY student.id;



-- ALIAS
-- 학생과 지도교수의 이름들
-- 너무 길다!
SELECT student.first_name, student.last_name, instructor.first_name, instructor.last_name
FROM student JOIN instructor
ON student.advisor_id = instructor.id;

SELECT st.first_name, st.last_name, i.first_name, i.last_name
FROM student st JOIN instructor i
ON st.advisor_id = i.id;

SELECT s.first_name, s.last_name, l.name
FROM student s
    LEFT JOIN enrolling_lectures sl
        ON s.id = sl.student_id
    LEFT JOIN lecture l
        ON sl.lecture_id = l.id
ORDER BY s.id;

--- SubQuery
-- 어떤 특정 강의(2번 강의)를 듣는 학생들의 id를 가져오고 싶다.
SELECT student_id
FROM enrolling_lectures
WHERE lecture_id = 2;


-- 2번 강의를 듣는 학생들의 이름을 가져오고 싶다.
-- join 사용
SELECT first_name, last_name
FROM student
    INNER JOIN enrolling_lectures
        ON student.id = enrolling_lectures.student_id
    INNER JOIN lecture
        ON lecture_id = lecture.id
WHERE lecture_id = 2;


-- 만약 강의를 듣는 학생의 id들을 알고있다면, IN을 활용할 수 있다.
SELECT first_name
FROM student
WHERE id IN (16, 18, 17);

-- 16, 18, 17 부분을 서브 쿼리로 채우기
SELECT first_name
FROM student
WHERE id IN (
    SELECT student_id
    FROM enrolling_lectures
    WHERE lecture_id = 2
);

