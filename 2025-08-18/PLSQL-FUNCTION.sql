-- PL/SQL : 선언부(IS 이하)와 실행부(BEGIN이하), 예외처리(선택) 마지막(END; / )
-- FUNCTION : 사용자 정의 함수
-- PROCEDURE : 
-- TRIGGER : LOG관리

CREATE OR REPLACE FUNCTION MULTI -- OR REPLACE는 선택적이고, 기존 함수(MULTI)가 정의되어 있으면 아래 내용으로 수정
    (P_VALUE IN NUMBER)          -- 줄바꿔쓰는 관례 
RETURN NUMBER                    -- NUMBER(수), VARCHAR(문자), DATE(날짜), EMP.SAL%TYPE(수)
IS
 -- 변수선언

BEGIN
    RETURN P_VALUE * 2;
END;
/      
-- "/" 로 반드시 마무리로 해야 한다

SELECT MULTI(10)
FROM DUAL;

SELECT SAL, MULTI(SAL) 급여가두배
FROM EMP;


CREATE OR REPLACE FUNCTION DATE_FUNC   -- DATE형을 받아서 'YYYY-MM-DD HH24:MI:SS'형태로 리턴
    (P_DATE IN DATE)
RETURN VARCHAR2
IS
BEGIN
    RETURN TO_CHAR(P_DATE, 'YYYY-MM-DD HH24:MI:SS');
END;
/

UPDATE TBL_BOARD
SET
    UDATETIME = SYSDATE
WHERE BOARDNO IN(1,3,5,7);
COMMIT;

SELECT 
    TITLE,
    DATE_FUNC(UDATETIME),--------------------- DATE형을 받아서 'YYYY-MM-DD HH24:MI:SS'형태로 리턴
    TO_CHAR(UDATETIME,'YYYY-MM-DD HH24:MI:SS')
FROM TBL_BOARD;

-- DATE_FUNC2(DATE, 'DATETIME') --> 'YYYY-MM-DD HH24:MI:SS';
-- DATE_FUNC2(DATE, 'DATE') --> 'YYYY-MM-DD';
-- DATE_FUNC2(DATE, 'TIME') --> 'HH24:MI:SS';
CREATE OR REPLACE FUNCTION DATE_FUNC2
    (
    P_DATE IN DATE,
    P_KEY IN VARCHAR2
    )
RETURN VARCHAR2
IS
BEGIN
    IF P_KEY = 'DATETIME' THEN
        RETURN TO_CHAR(P_DATE,'YYYY-MM-DD HH24:MI:SS');
    ELSIF P_KEY = 'DATE' THEN
        RETURN TO_CHAR(P_DATE,'YYYY-MM-DD');
    ELSIF P_KEY = 'TIME' THEN
        RETURN TO_CHAR(P_DATE,'HH24:MI:SS');
    ELSE
        RETURN '키값 확인바람';
    END IF;

END DATE_FUNC2; -- DATE_FUNC2 생각가능
/

-- 아래 조건을 만족하는 SCORE_FUNC 함수 만들기
-- SCORE_FUNC(숫자) 호출 시
-- 숫자가 90이상이면 A, 80이상이면 B, 70이상이면 C 그 외 숫자면 'D' 출력
-- 100 초과, 0미만 숫자가 입력되면 '잘못된 숫자' 출력

SELECT STU_NAME, ENR_GRADE, SCORE_FUNC(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;

-- 위 쿼리로 결과 확인

CREATE OR REPLACE FUNCTION SCORE_FUNC
    (P_SCORE IN NUMBER)
    
RETURN VARCHAR2
IS
BEGIN
    IF P_SCORE > 100 OR P_SCORE < 0 THEN
        RETURN '잘못된 숫자';
    ELSIF P_SCORE >= 90 THEN
        RETURN 'A';
    ELSIF P_SCORE >=80 THEN
        RETURN 'B';
    ELSIF P_SCORE >= 70 OR P_SCORE < 0 THEN
        RETURN 'C';
    ELSE 
        RETURN 'D';
    END IF;

END;
/



