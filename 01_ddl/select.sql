-- SELECT

-- first_name과 age만 뽑아서 조회
SELECT first_name, age FROM user;
-- last_name, phone, email 만 뽑아서 조회
SELECT last_name, phone, email FROM user;
-- 전체 열 조회
SELECT * FROM user;

-- SELECT ORDER BY
-- first_name 알파벳 순으로 조회
SELECT * FROM user ORDER BY first_name;
-- age 순으로 조회, 같으면 first_name 순으로 조회
-- age, first_name
SELECT age, first_name FROM user ORDER BY age, first_name;
-- age 역순으로 조회, 같으면 first_name 으로 조회
SELECT age, first_name FROM user ORDER BY age DESC, first_name;


-- DISTINCT 해당 컬럼을 중복없이 조회
-- 나이만 조회
SELECT age FROM user;
-- 중복 없이 나이를 조회
SELECT DISTINCT  age FROM user;
-- 중복 없이 first_name 조회
SELECT DISTINCT first_name FROM user;
-- 중복 없이 country 조회 후 country 알파벳 순으로 정렬
SELECT DISTINCT country FROM user ORDER BY country;


-- 조건을 붙여서 조회
-- 나이가 30미만인 사람들의 first_name 만 조회
SELECT first_name FROM user WHERE age < 30;

-- balance가 157인 사람들의 나이 조회
SELECT * FROM user WHERE balance = 157;

-- AND OR
-- balance가 150 이상이면서 나이가 30 미만인 사람들을 조회
SELECT * FROM user WHERE balance >= 150 AND age < 30;

-- balance가 150 이상이면서 나이가 30 미만인 사람들을 나이순, 이름순으로 조회
SELECT * FROM user WHERE balance >= 150 AND age < 30 ORDER BY age, first_name;

-- first_name 이 Zelda 인 사람들만 조회
SELECT * FROM user WHERE first_name == 'Zelda';

-- SELECT WHERE LIKE
-- first_name이 A로 시작하는 사람들만 조회
-- % : 0개 이상의 문자와 동일한 문자
SELECT * FROM user WHERE first_name LIKE 'A%';
-- first_name 이 A로 시작하는 사람들 중 이름이 4글자로 이루어진 사람들만 조회
--- '_' : 1개의 문자와 동일한 문자
SELECT * FROM user WHERE first_name LIKE 'A___';

-- email이 google.com의 이메일인 사람
-- 이름은 A로 시작하고 성은 C로 시작하는 사람
-- phone 이 010으로 시작하지 않는 사람

SELECT * FROM user WHERE id = '23';


-- 전화번호가 '010' 으로 시작하는 데이터를 조회하는 SQL
SELECT * FROM user WHERE phone LIKE '010%';

-- 전화번호가 '010' 으로 시작하지 않는 데이터를 조회하는 SQL
SELECT * FROM user WHERE phone NOT LIKE '010%';

-- 성에 `'` 이 포함된 이름을 조회하는 SQL
SELECT * FROM user WHERE user.last_name LIKE '%''%';

-- 국적이 미국(United States), 캐나다(Canada), 호주(Australia)
SELECT * FROM user
WHERE country =  'United State'
OR country = 'Canada'
OR country = 'Australia';

-- IN 사용
SELECT * FROM user
WHERE country IN ('United States', 'Canada', 'Australia');

-- BETWEEN 사용
SELECT first_name, last_name, age
FROM user
WHERE age BETWEEN 30 AND 39;


-- Limit
SELECT id, first_name, last_name
FROM user
LIMIT 20;

SELECT id, first_name, last_name
FROM user
WHERE age > 30
ORDER BY age
LIMIT 50;