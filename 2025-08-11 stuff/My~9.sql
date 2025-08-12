-- 문자함수
-- CONCAT : 문자열 결합(2개의 인자만 받음), ||

SELECT CONCAT(STU_NAME, STU_DEPT)
FROM STUDENT;

SELECT STU_NAME || ' : ' || STU_DEPT -- 옥한빛 : 기계
FROM STUDENT;

-- LENGTH : 문자열 길이
SELECT STU_DEPT, LENGTH(STU_DEPT)
FROM STUDENT;

-- SUBSTR - 문자열 자르기(특정 부분 추출)
SELECT SUBSTR('Hello Oracle', 1, 5) -- Hello
FROM DUAL;    

SELECT NAME || ' : ' || SUBSTR(JUMIN,1,6) AS 생년월일 -- NAME 예약어처럼 굵게표시되나 문제 없음
FROM STU;

SELECT STU_DEPT || ' : ' || SUBSTR(STU_NAME,1,1) AS 과이름
FROM STUDENT;


-- DECODE - 자바의 IF문 비슷한 문법
SELECT 
    NAME,
    SUBSTR(JUMIN,7,1),
    DECODE(SUBSTR(JUMIN,7,1), 1 , '남', '여') -- 숫자는 ' ' 써도 않써도 무방하다
FROM STU;

-- UPPER LOWER : 대문자 소문자로 변경
SELECT
    UPPER('HelLo OraCle'),
    LOWER('HelLo OraCle')
FROM DUAL;

-- INSTR : 특정 문자열이 처음으로 몇번째에 나오는지
SELECT EMAIL, INSTR(EMAIL, '@') -- 메일 주소의 @ 위치
FROM PROFESSOR;

-- REPLACE : 문자열을 다른 문자열로 대체
SELECT EMAIL, REPLACE(EMAIL,'net', 'com') -- 메일 주소의 @ 뒤 net을 com으로 바꿈
FROM PROFESSOR;

-- TRIM : 공백제거
SELECT
    TRIM('    Hello Oracle  '), -- 양쪽 여백 없앰
    LTRIM('    Hello Oracle '), -- 왼쪽만 여백 없앰
    RTRIM('    Hello Oracle ')  -- 우측 여백 없앰
FROM DUAL;

-- LPAD, RPAD : 주어진 값을 포함하고, 전체 길이를 유지하면서 왼쪽, 우측에 특정값으로 바꿈
SELECT 
    LPAD(ID, 9, '*'),
    RPAD(ID, 9, '*')
FROM STU;

SELECT * FROM STU;

-- STU TABLE의 ID 끝 3글자만 *로 표시 RPAD, SUBSTR, LENGTH

SELECT 
    LENGTH(ID),
    SUBSTR(ID, 1,LENGTH(ID)-3),
    RPAD(SUBSTR(ID, 1,LENGTH(ID)-3), LENGTH(ID),'*')
FROM STU;

