-- OUTER JOIN
-- LEFT, RIGHT..... LEFT만 알면 거의 된다.
SELECT *
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO; 
-- INNER JOIN할 때 왼쪽 기준 STUDENT TABLE은 그대로 출력하고, ENROL의 조건에 맞지 않는 것은 NULL로 출력
-- 심수정, 진현무, 홍길동

-- 각 학생들의 시험을 본 개수 출력
-- 이름, 개수 출력, 단 시험을 하나도 보지 않았으면 0출력

SELECT S.STU_NO, S.STU_NAME, COUNT(ENR_GRADE)
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, S.STU_NAME; 

SELECT * FROM EMP;
-- 각 직원의 부하직원 수를 구하고, 없으면 0으로, 사번 이름 부하직원수 출력

SELECT MGR, COUNT(*) CNT
FROM EMP E
GROUP BY MGR;

SELECT EMPNO, ENAME, NVL(CNT,0) AS CNT
FROM EMP E
INNER JOIN (
    SELECT MGR, COUNT(*) AS CNT
    FROM EMP E
    GROUP BY MGR
) T ON E.EMPNO = T.MGR

ORDER BY CNT DESC;

-- 학번, 학생이름, 담당교수 이름출력
-- 단 담당교수가 없으면 담당교수 이름을 '담당교수 없음'으로 출력

SELECT * FROM PROFESSOR;
SELECT * FROM STU;

SELECT S.STUNO, S.NAME STUNAME, NVL(P.NAME,'담당교수 없음') PROFNAME
FROM STU S
LEFT JOIN PROFESSOR P ON S.PROFNO = P.PROFNO;
--LEFT JOIN (
--    SELECT PROFNO, NAME
--    FROM PROFESSOR    
--) T ON S.PROFNO = T.PROFNO;

-- STUDENT
-- 1. 학생들의 시험 평균 점수 출력
-- 단, 시험을 보지 않은 학생은 '성적없음' 출력
SELECT * FROM ENROL;

SELECT S.STU_NO, S.STU_NAME, NVL(TO_CHAR(AVG(ENR_GRADE)), '성적없음') -- NVL내 요소 타입이 같아야한다
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, S.STU_NAME;




