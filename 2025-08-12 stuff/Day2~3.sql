-- CASE ~ WHEN (DECODE보다 좀더 복잡한 처리 가능한 IF문)

SELECT * FROM PROFESSOR;

SELECT 
    PAY,
    CASE
        WHEN PAY >= 500 THEN '고소득'
        WHEN PAY BETWEEN 300 AND 500 THEN '중위소득'
        ELSE '화이팅'
    END AS 급여정보
FROM PROFESSOR;