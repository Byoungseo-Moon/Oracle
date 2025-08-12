-- 주석 1. SELECT (테이블에서 데이터를 검색하라는 명령어)

SELECT *       -- '*'은 모든 컬럼을 조회하는 것
FROM STUDENT;  

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT;  -- 필요한 컬럼만 선택하여 조회

SELECT *
FROM STUDENT
WHERE STU_DEPT = '기계';  -- 조건을 만족하는 레코드만 조회는 WHERE사용

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2; -- 2학년 이상 학생 조회

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2 AND STU_GENDER='M';  -- 2가지 조건만족하는 레코드 조회

SELECT *
FROM STUDENT
WHERE STU_GRADE >= 2 OR STU_GENDER='M'; -- 2학년이상이거나 남자 레코드 조회

SELECT *
FROM STUDENT
WHERE STU_DEPT IN ('기계', '전기전자'); -- 아래와 동일한 결과
-- WHERE STU_DEPT = '기계' OR STU_DEPT = '전기전자';

SELECT *
FROM STUDENT
WHERE STU_HEIGHT BETWEEN 170 AND 180; -- 아래와 동일한 결과
-- WHERE STU_HEIGHT >=170 AND STU_HEIGHT <= 180;

SELECT * 
FROM STUDENT
WHERE STU_NAME LIKE '%옥%';  --  특정문자가 포함된 앞뒤 레코드 모두 조회

SELECT * 
FROM STUDENT
WHERE STU_NO LIKE '%3%';

SELECT * 
FROM STUDENT
WHERE STU_WEIGHT >= 50
ORDER BY STU_WEIGHT; -- 오름차순 = ORDER BY STU_WEIGHT ASC(ASC는 생략가능, 디폴트임)

-- 내림차순으로 할려면 ORDER BY STU_WEIGHT DESC 로 조회




