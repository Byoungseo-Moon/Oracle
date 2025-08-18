-- 프로시저

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL
    (P_EMPNO IN EMP.EMPNO%TYPE) -- EMP TABLE의 EMPNO와 같은 타입을 선언함
IS
BEGIN
    UPDATE EMP
    SET
        SAL = SAL * 1.1
    WHERE EMPNO = P_EMPNO;
    --COMMIT;
END;
/

EXECUTE UPDATE_EMP_SAL(7369);

-- EMPNO 7369 원래 SAL로 돌리기
UPDATE EMP
    SET SAL = 880
WHERE EMPNO = 7369;

-- UPDATE_EMP_SAL 프로시저에서 파라미터값을 하나 더 받아서 해당 배율만큼 급여증가
-- EXECUTE UPDATE_EMP_SAL(7369, 1.3); => 30%증가

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL
    (
        P_EMPNO IN EMP.EMPNO%TYPE,
        P_RATE IN NUMBER
    ) 
IS
    P_COUNT NUMBER;
BEGIN
    UPDATE EMP
    SET
        SAL = SAL * P_RATE
    WHERE EMPNO = P_EMPNO;  --- '=' 는 같냐 같지 않냐를 나타냄 TRUE / FALSE
                            --- P_COUNT를 0으로 만든다. 'P_COUNT := 0' 로 해야 함
    P_COUNT := SQL%ROWCOUNT; --- SQL%ROWCOUNT는 쿼리 실행결과가 몇개의 행(ROW)에 영향을 주는지
    
    IF P_COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('**사번을 다시 확인해 주세요.');
    ELSIF P_COUNT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('**정상적으로 저장되었습니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('2개 이상이 저장되었습니다.'); -- PK 조건으로 실행될일 없어야 함
    END IF;
    COMMIT;
     
END;
/

SET SERVEROUTPUT ON; -- 프린트 기능을 켜는 명령어

EXECUTE UPDATE_EMP_SAL(1234, 1.3); -- 없는 사번의 경우

EXECUTE UPDATE_EMP_SAL(7369, 1.3); -- 있는 사번의 경우






