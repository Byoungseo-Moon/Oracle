-- 오라클 조건 처리

SELECT NAME, PAY, BONUS, PAY+BONUS -- NULL이 있으면 PAY+BONUS가 NULL이됨
FROM PROFESSOR;

-- NVL
SELECT NAME, PAY, NVL(BONUS,0), PAY+NVL(BONUS,0)
FROM PROFESSOR
WHERE PAY+NVL(BONUS,0)>=300;

-- NVL2
SELECT BONUS, NVL2(BONUS, 1000, 0)
FROM PROFESSOR;

SELECT * FROM STU;

SELECT NAME, SUBSTR(JUMIN, 7, 1) AS 성별
FROM STU;

-- DECODE, 자바의 IF와 같은 기능 
-- DECODE(컬럼명, '조건값', '컬럼/조건값이 같을 때 들어가는 값', 컬럼/조건값이 다를 때 들어가는 값') 

SELECT ENAME, JOB, DECODE(JOB, 'MANAGER', '매니저', '그외') FROM EMP;
SELECT NAME, DECODE(SUBSTR(JUMIN,7,1),1,'남자', '여자') 성별 FROM STU;

-- IF, ELSE IF, ELSE 같은 로직
SELECT ENAME, JOB, 
    DECODE(JOB, 'MANAGER', '매니저!','SALESMAN', '세일즈맨!', '그외') 
FROM EMP;

-- 주민번호 1,3이면 남자, 2,4면 여자

SELECT 
    NAME,JUMIN, 
    DECODE(SUBSTR(JUMIN,7,1), 1, '남자', 3, '남자', '여자') 성별
FROM STU;



