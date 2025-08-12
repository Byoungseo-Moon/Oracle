SELECT * FROM EMP;
SELECT * FROM SALGRADE;
SELECT * FROM DEPT;

--문자 함수 관련 연습문제

--1. ENAME 열에서 모든 이름을 소문자로 변경하여 출력해 보시오.
SELECT 
    LOWER(ENAME)       
FROM EMP;

--2. ENAME 열에서 'SMITH'를 찾고, 그 값을 'JOHN'으로 변경하여 출력해 보시오.
SELECT *
FROM EMP
WHERE ENAME = 'SMITH';


SELECT ENAME, REPLACE(ENAME, 'SMITH', 'JOHN') AS 이름
FROM EMP;

SELECT ENAME, REPLACE(ENAME, 'JOHN', 'SMITH') AS 이름
FROM EMP;
 
--3. JOB 열에서 'SALESMAN'만 추출하고, 해당 컬럼(SALESMAN)의 길이를 구해 보시오.
SELECT E.*, LENGTH(JOB) AS 길이  // 별칠
FROM EMP E    // 테이블 별칭
WHERE JOB = 'SALESMAN';

SELECT *
FROM EMP
WHERE JOB LIKE '%SALESMAN%';

--4. ENAME 열에서 이름의 첫 글자만 대문자로 변경하여 출력해 보시오.
SELECT 
    LENGTH(ENAME),        
    ': ' || UPPER(SUBSTR(ENAME,1,1)) || LOWER(SUBSTR(ENAME, 2, LENGTH(ENAME)-1)) // SUBSTR(인덱스, 글자숫자)
FROM EMP;

--5. ENAME 열에서 이름의 마지막 3글자를 추출하여 출력해 보시오.
SELECT
    LENGTH(ENAME),
    SUBSTR(ENAME,LENGTH(ENAME)-2, 3)
FROM EMP;

--6. JOB 열의 값 중 'MANAGER'로 시작하는 직책을 가진 사람들의 수를 구해 보시오.
SELECT JOB, COUNT(*)
FROM EMP
WHERE JOB = 'MANAGER'
GROUP BY JOB;

--7. ENAME과 JOB 열을 합쳐서 'ENAME(JOB)' 형태로 출력해 보시오.
SELECT ENAME ||'(' || JOB ||')'
FROM EMP;

--8. ENAME 열에서 'A'가 포함된 모든 사람의 이름을 추출해 보시오.
SELECT ENAME 
FROM EMP
WHERE ENAME LIKE '%A%';



--숫자 함수 관련 연습문제

--1. 모든 직원의 SAL 값에 10%를 추가한 값을 출력해 보시오.
SELECT SAL * 1.1
FROM EMP;

UPDATE EMP
SET
    SAL = SAL * 1.1;

ROLLBACK;

--2. SAL 값이 1500 이상인 직원들의 평균 급여를 구해 보시오.
SELECT AVG(SAL)
FROM EMP
WHERE SAL >= 1500;

--3. 각 부서(DEPTNO)별로 급여의 총합을 구해 보시오.
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

--4. SAL 값이 1300 이상이면서 부서번호가 20인 직원들의 평균 급여를 구해 보시오.
SELECT AVG(SAL)
FROM EMP
WHERE SAL >= 1300 AND DEPTNO = 20;

--5. 각 부서별로 급여가 가장 높은 직원의 이름을 구해 보시오.
SELECT DEPTNO, MAX(SAL) AS MAX_SAL   -- SUBQUERY 및 JOIN를 통해 가능함
FROM EMP
GROUP BY DEPTNO;

SELECT ENAME, MAX_SAL 
FROM EMP E
INNER JOIN (
    SELECT DEPTNO, MAX(SAL) MAX_SAL
    FROM EMP
    GROUP BY DEPTNO
) E2 ON E.DEPTNO = E2.DEPTNO AND E.SAL = E2.MAX_SAL;

--6. 직원들의 급여를 오름차순으로 정렬하시오.
SELECT *
FROM EMP
ORDER BY SAL ASC; //ASC생략가능.. 오름차순이 디폴트



--날짜 함수 관련 연습문제

--1. HIREDATE에서 직원이 입사한 년도를 추출하여 출력해 보시오.
SELECT ENAME,HIREDATE 
FROM EMP;

SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY')
FROM EMP;

--2. HIREDATE가 1981년 1월 1일 이후인 직원들의 이름을 출력해 보시오.
SELECT ENAME
FROM EMP
WHERE HIREDATE >= TO_DATE('1981-01-01', 'YYYY-MM-DD');
  -- WHERE HIREDATE >= '1981-01-01' 

--3. 입사일이 1981년 5월 1일 이전인 직원들의 이름과 입사일을 출력해 보시오.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE <= TO_DATE('1981-05-01', 'YYYY-MM-DD');



--그룹 함수 관련 연습문제

--1. 각 부서별 평균 급여를 출력.
SELECT DEPTNO, CEIL(AVG(SAL))  -- ROUND(값, 소수점자리), TRUNC, FLOOR
FROM EMP
GROUP BY DEPTNO;

--2. 각 부서별 인원 출력.
SELECT DEPTNO, COUNT(*) 
FROM EMP
GROUP BY DEPTNO;

--3. 각 부서에서 급여가 1500이상인 사람의 부서별 사람 수 출력(부서명, 사람수 출력)
SELECT DEPTNO, COUNT(*) 
FROM EMP
WHERE SAL >=1500   -- GROUP문 앞에 와야한다.
GROUP BY DEPTNO
HAVING COUNT(*) >=3;  --- 위 조건 만족하면서 3명이상 (GROUP문에 조건을 줄 때, HAVING
