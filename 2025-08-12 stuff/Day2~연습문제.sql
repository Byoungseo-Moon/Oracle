--1. 81년도에 입사한 교수들의 목록을 출력하시오. (PROFESSOR)
SELECT * FROM PROFESSOR;

SELECT * 
FROM PROFESSOR
WHERE TO_CHAR(HIREDATE, 'YY') = 81;

--2. 학번이 94, 95학번(STUNO의 첫 2글자)인 학생들의 평균 키를 구하시오. (STU)
SELECT AVG(HIGHT)
FROM STU
WHERE SUBSTR(STUNO,1,2) IN (94, 95);


--3. EMAIL을 *****@abc.net형태로 출력하시오. (PROFESSOR)
--	 조건) *의 개수는 @앞의 글자 개수와 같아야 함.
SELECT EMAIL, INSTR(EMAIL, '@'),
    SUBSTR(EMAIL,INSTR(EMAIL,'@'),LENGTH(EMAIL)),
    LPAD(SUBSTR(EMAIL,INSTR(EMAIL,'@'),LENGTH(EMAIL)), LENGTH(EMAIL),'*')
FROM PROFESSOR;

--4. 학생들의 남,녀 학생수를 아래 이미지와 같이 구하시오. (STU)
--   조건) 성별은 JUMIN 컬럼의 7번째 숫자를 기준으로 1이면 '남자' 2면 '여자'
SELECT * FROM STU;

SELECT 
 --DECODE(SUBSTR(JUMIN,7,1), 1, '남자',NULL) -- NULL은 생략가능
 --DECODE(SUBSTR(JUMIN,7,1), 2, '여자')  -- NULL은 생략가능
 COUNT(DECODE(SUBSTR(JUMIN,7,1), 1, '남자',NULL)) 남자, -- NULL은 생략가능
 COUNT(DECODE(SUBSTR(JUMIN,7,1), 2, '여자')) 여자  -- NULL은 생략가능

FROM STU;
