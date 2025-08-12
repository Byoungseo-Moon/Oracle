-- 날짜함수
-- SYSDATE : 현재시간 가져오기
-- TO_CHAR : 날짜를 문자형식으로
-- TO_DATE : 문자형식을 날짜형식으로
SELECT 
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

SELECT 
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'HH:MI:SS'),
    TO_DATE('2025-10-15', 'YYYY-MM-DD')
FROM DUAL;