-- Aggregate Functions
-- 여러 행을 반환받고 그 행들의 데이터를 바탕으로 결과를 계산
-- COUNT(), AVG(), MAX(), MIN(), SUM()

SELECT COUNT(country) FROM user;
SELECT COUNT(*) FROM user WHERE country = 'South Korea';

SELECT AVG(balance) FROM user WHERE country = 'South Korea';
SELECT AVG(balance) FROM user WHERE country = 'Costa RIca';


-- 동명이인찾기 (first-name 이 동일한 사람들)
SELECT first_name, COUNT(*)
FROM user
GROUP BY first_name
ORDER BY COUNT(*) DESC;

-- 나라별 나이의 평균을 나이의 평균의 역순으로 정렬해서 출력
SELECT country, AVG(age)
FROM user
GROUP BY country
ORDER BY AVG(age) DESC;


-- 10 단위로 나이를 나누어서
-- 각각 세대의 잔고의 평균을 구하는 SQL
SELECT country, (age / 10) * 10, AVG(balance)
FROM user
GROUP BY country, age / 10
ORDER BY AVG(balance);


-- WHERE는 집계 전에 데이터를 걸러내는 역할
SELECT country, AVG(balance)
FROM user
WHERE country IN ('Cananda', 'United States', 'Australia')
GROUP BY country;


-- HAVING
-- 국가 단위로 잔고 평균을 구한 뒤,
-- 잔고 평균이 149를 넘는 자료만 남기는 SQL
SELECT country, AVG(balance)
FROM user
GROUP BY country
HAVING AVG(balance) > 149;