-- UPDATE : 테이블의 특정 컬럼에 있는 데이터수정


SELECT * FROM STUDENT;

UPDATE STUDENT
SET
   STU_HEIGHT = 175 
WHERE STU_NAME = '박희철';   
COMMIT;
  
-- ROLLBACK; 데이터 변경(수정, 삭제, 삽입)후 COMMIT을 하지 않으면 완전히 저장된게 아니라
--             롤백 가능하나, COMMIT후에는 불가능하다.
    
UPDATE STUDENT
SET
    STU_HEIGHT = STU_HEIGHT + 1,
    STU_WEIGHT = STU_WEIGHT - 1
WHERE STU_DEPT = '기계'; 
COMMIT;
    

    
    
    
    
    